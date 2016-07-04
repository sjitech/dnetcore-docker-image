# dnetcore-docker-image
An non-root docker image for .NET Core development( having created normal user id with sudoable, installed nodejs, yoman, aspnet generator...),
you won't worry about yomen's anti-root problem and some other permission problem about /usr/local or NuGet Cache etc.


Usage:

To just use the docker image:
```
docker run -it osexp2000/dnetcore-docker-image
```
You will get a bash running with normal user id named `devuser` which can sudo without password.

Then you can run aspnet generator:
```
yo aspnet
```

And also installed some other utilities `vim`,`lsof`，`netstat`.


A screenshot:

```
$ docker run -it osexp2000/dnetcore-docker-image
devuser@640be8c28a81:~$ id
uid=1000(devuser) gid=1000(devuser) groups=1000(devuser),27(sudo)
devuser@640be8c28a81:~$ yo aspnet
? ==========================================================================
We're constantly looking for ways to make yo better!
May we anonymously report usage statistics to improve the tool over time?
More info: https://github.com/yeoman/insight & http://yeoman.io
========================================================================== Yes

     _-----_     ╭──────────────────────────╮
    |       |    │      Welcome to the      │
    |--(o)--|    │  marvellous ASP.NET Core │
   `---------´   │        generator!        │
    ( _´U`_ )    ╰──────────────────────────╯
    /___A___\   /
     |  ~  |
   __'.___.'__
 ´   `  |° ´ Y `

? What type of application do you want to create? (Use arrow keys)
❯ Empty Web Application
  Console Application
  Web Application
  Web Application Basic [without Membership and Authorization]
  Web API Application
  Class Library
  Unit test project (xUnit.net)
```

----


To build it yourself:

```
docker build -t IMAGE_NAME_HERE --rm https://raw.githubusercontent.com/sjitech/dnetcore-docker-image/master/Dockerfile
```

or download the Dockerfile then run:

```
docker build -t IMAGE_NAME_HERE --rm - < Dockerfile
```
