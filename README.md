
Simple Java Serivce Wrapper Script (SJSWS)
==========


What is SJSWS?
-----
Ever needed to run a Java program as a deamon(background service) on your *nix? All you want is to run some basic opertaion such start/stop/restart?. Then you are int right place. 

Baiscly SJSWS  is simple tool to generate a custom shell script to manage any java program as service (Start/Stop/restart/etc.. ). 


It worth mensioning that there are other alternatives you may use to run a Java program as a daemon on Linux:

- Java Service Wrapper.
- Apache Jakarta Commons Daemon package (Jsvc).

These alternatives are mush more advanced and you can do alot more with it. However, they come with some complixty such as 
compatiblties issue, having the need to implement custom interfaces, or install extra packages. A shell script, on the other hand, is easier to adapt to changing OS and Java environments.       


Features
--------

- Easy to use.
- Read values from editable properties file to generate custom script that works for your needs.   
- Provide all baisc operations for a servcie such as Start/Stop/restart/Status. 
- In addestion to the basic operations it also comse with other useful operation to get more infomation the configured service such process id, confugartions, and a help menu. 
 


SJSWS Details and strucutre : 
---

```
.
├── README.md
├── Service.properties
├── ServiceConfig.sh
├── ServiceTemplate.sh
└── examples
    ├── HelloPrintJob
    ├── HelloPrintJob-1.0-SNAPSHOT.jar
    ├── Service.properties
    ├── ServiceConfig.sh
    └── ServiceTemplate.sh

```
go throw the file and thier uses 


Running Example
--------


Support OS
--------
The scrip is tested under the following operating systems :  
-  MAC OS X El Capitan (v10.11.2)
-  Ubuntu 14.04.3 LTS
However, the script is simple and does not inclde any special libraries, so it will proboplly wrok fine in most *nix systems.  
### TODO List
Here are the list of tasks that should be included next: 
- Test and validate the scrip in other *nix distributions.
- Add support to install/uninstall service.
- 
How can You help?
-----------------

SJSWS is an open source tool and welcomes contributions.


Author
--------
Suleiman Alrosan 

License
-------
 SJSWS is under Apache License
