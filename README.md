
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
 


Details and Structure
---
Belwo is the main structure of SJSWS directory:

```
.
├── Service.properties
├── ServiceConfig.sh
├── ServiceTemplate.sh
└── examples

```

#####Service.properties
Contains the list of all configurable values that will be used to create the service shel script. Here is the list of values that currently supported: 


| Property Name | Description   |
| ------------- |:-------------:|
| SERVICE_NAME      | The name of your serivce without any spaces|
| SERVICE_WORK_DIR  | The location to the dir where your jar file is located.       |
| SERVICE_PID_FILE  | File name with full path that the service will use to store the proccess id. The defult is  $SERVICE_WORK_DIR"/"$SERVICE_NAME"_pid"   |
| SERVICE_CLASS_PATH| Pathe to your jars      |
| SERVICE_CLASS     | Full class name that has the main method for your java program|
|SERVICE_CMD        |  the actual command that the final script will execut to start you service. Defult  is "java -cp $SERVICE_CLASS_PATH $SERIVCE_CLASS"|

#####ServiceTemplate.sh
This file represnts the template which is used to create the end result script. 

#####ServiceConfig.sh
this scrip used to creat the final script for your service. It all the read configured values from Service.properties file, feed them to the ServiceTemplate.sh file, and finaly store the  final copy  ""CURRENT_DIR/ouput/service.sh""

#####examples
exmaple of how to use SJSWS to run configure and run a jar file as service. 

Example Program
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
