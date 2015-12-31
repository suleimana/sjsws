
Simple Java Service Wrapper Script (SJSWS)
==========


What is SJSWS?
-----
Ever needed to run a Java program as a deamon(background service) on your *nix? All you want is to run some basic operations such start/stop/restart?. Then you are in the right place. 

Basically SJSWS  is simple tool to generate a custom shell script to manage any java program as service (Start/Stop/restart/etc.. ). 


It worth mentioning that there are other alternatives you may use to run a Java program as a daemon on Linux:

- Java Service Wrapper.
- Apache Jakarta Commons Daemon package (Jsvc).

These alternatives are much more advanced and you can do lot more by using them. However, they come with some complexities such as compatibility issues, having the need to implement custom interfaces, or that it requires to install some extra packages before using. A shell script, on the other hand, is easier to adapt to changing OS and Java environments.       


Features
--------

- Easy to use.
- Read values from editable properties file to generate custom script that works for your needs.   
- Provide all basic operations for a service such as Start/Stop/restart/Status.
- In addition to the basic operations, the script also comes with other useful operation to get more information about the configured service such process id, configuration values, and a help menu. 
 


Details and Structure
---
Below is the main structure of SJSWS directory:

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
| SERVICE_NAME      | The name of your service without any spaces|
| SERVICE_WORK_DIR  | The location to the dir where your jar file is located.       |
| SERVICE_PID_FILE  | File name with full path that the service will use to store the process id. The default is  $SERVICE_WORK_DIR"/"$SERVICE_NAME"_pid"   |
| SERVICE_CLASS_PATH| Path to your jars      |
| SERVICE_CLASS     | Full class name that has the main method for your java program|
|SERVICE_CMD        |  the actual command that the final script will execute to start you service. Default  is "java -cp $SERVICE_CLASS_PATH $SERIVCE_CLASS"|

#####ServiceTemplate.sh
This file represents the template which is used to create the end result script. 

#####ServiceConfig.sh
this scrip used to create the final script for your service. It all the read configured values from Service.properties file, feed them to the ServiceTemplate.sh file, and finally store the  final copy  ""CURRENT_DIR/output/service.sh""

#####examples
contains an example of how to use SJSWS to configure and run a jar file as service. 

Going Through the Example
--------
The exmaples folder, contains sample java program(HelloPrintJob) with with SJSWS files which be used to creat service scrip.
 
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

Here is the list of all steps required to run the exmaple program as service on your machine:

1-  Create jar files: The first thing to do is prepear the jar file for the HelloPrintJob program that prints the world "hello" into into a temp file every 10 seconds. For the perpuse of this example there is a jar called "HelloPrintJob-1.0-SNAPSHOT.jar" ready to be used. The source code for this program is also provided under "exmaples/HelloPrintJob". So you can make any changes to the program and build a new jar file. 

2- Update Service.properties: Service.properties has set values such as the program location and the command used to start the java program. We assume that the working dirctory for this program will be  "/usr/local/myservices" . here is the full list values: 
````
SERVICE_NAME=HelloPrintJob
SERVICE_WORK_DIR="/usr/local/myservices"
SERVICE_PID_FILE=$SERVICE_WORK_DIR"/"$SERVICE_NAME"_pid"
SERVICE_CLASS_PATH="$SERVICE_WORK_DIR/HelloPrintJob-1.0-SNAPSHOT.jar"
SERVICE_CLASS=com.job.hello.App
SERVICE_CMD="java -cp $SERVICE_CLASS_PATH $SERIVCE_CLASS"
Status API Training Shop Blog About Pricing
````

mkdir /usr/local/batchmanager



src:http://developer.bostjan-cigan.com/running-java-program-as-a-daemon-in-ubuntu-linux/

add new service
root@PollectedHostServer:/usr/local/batchmanager/SJSWS# sudo cp ouput/service.sh /etc/init.d/cleanbatchmanager
root@PollectedHostServer:/usr/local/batchmanager/SJSWS# sudo chmod +x /etc/init.d/cleanbatchmanager 
root@PollectedHostServer:/usr/local/batchmanager/SJSWS# sudo update-rc.d cleanbatchmanager defaults 



remove service 
root@PollectedHostServer:/usr/local/batchmanager/SJSWS# sudo rm /etc/init.d/cleanbatchmanager
root@PollectedHostServer:/usr/local/batchmanager/SJSWS# sudo update-rc.d cleanbatchmanager remove 


Support OS
--------
The scrip is tested under the following operating systems :  
-  MAC OS X El Capitan (v10.11.2)
-  Ubuntu 14.04.3 LTS

However, the script is simple and does not include any special libraries, so it will probably work fine in most *nix systems. 

TODO List
--------
Here are the list of tasks that should be included next: 
- Test and validate the script in other *nix distributions.
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
