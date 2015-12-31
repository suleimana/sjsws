
Simple Java Service Wrapper Script (SJSWS)
==========


What is SJSWS?
-----
Ever needed to run a Java program as a deamon(background service) on your *nix? All you want is to run some basic operations such start/stop/restart?. Then you are in the right place. 

Basically SJSWS  is simple tool to generate a custom shell script to manage any java program as service (Start/Stop/restart/etc.. ). 


It worth mentioning that there are other alternatives you may use to run a Java program as a daemon on Linux:

- Java Service Wrapper.
- Apache Jakarta Commons Daemon package (Jsvc).

These alternatives are much more advanced and you can do lot more by unsing them. However, they come with some complexities such as compatibility issues, having the need to implement custom interfaces, or that it requires to install some extra packages before using. A shell script, on the other hand, is easier to adapt to changing OS and Java environments.       


Features
--------

- Easy to use.
- Read values from editable properties file to generate custom script that works for your needs.   
- Provide all basic operations for a service such as Start/Stop/restart/Status.
- In addition to the basic operations, the script also comes with other useful operation to get more information about the configured service such process id, configuration values, and a help menu. 
 


SJSWS Details and structure : 
---

```
.
├── Service.properties
├── ServiceConfig.sh
├── ServiceTemplate.sh
└── examples

```
todo: describe the structure 


Running Example
--------


```
.
.
└── examples
    ├── HelloPrintJob
    ├── HelloPrintJob-1.0-SNAPSHOT.jar
    ├── Service.properties
    ├── ServiceConfig.sh
    └── ServiceTemplate.sh

```

todo: go through the example.

Support OS
--------
The scrip is tested under the following operating systems :  
-  MAC OS X El Capitan (v10.11.2)
-  Ubuntu 14.04.3 LTS

However, the script is simple and does not include any special libraries, so it will probably work fine in most *nix systems.  
TODO List
--------
Here are the list of tasks that should be included next: 
- Test and validate the scrip in other *nix distributions.
- Add support to install/uninstall service.


How can You help?
-----------------

SJSWS is an open source tool and welcomes contributions.


Author
--------
Suleiman Alrosan 

License
-------
 SJSWS is under Apache License
