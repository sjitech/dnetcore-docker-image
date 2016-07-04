FROM microsoft/dotnet

#add sudoable devuser and switch to it
RUN \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils sudo && \
    adduser --disabled-password --gecos "Developer" devuser && \
    adduser devuser sudo && \
    echo "devuser ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo) && \
    chown -R root:sudo /usr/local

USER devuser
WORKDIR /home/devuser

#these are basic utilities
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y bash-completion vim less man lsof tree psmisc \
    net-tools iputils-ping netcat curl wget && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo bash - && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs && \
    sudo npm install -g yo bower grunt-cli gulp && \
    sudo npm install -g generator-aspnet && \
    sudo rm -fr /core /tmp/NuGetScratch
