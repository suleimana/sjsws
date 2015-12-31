
Simple Java Service Wrapper Script (SJSWS)
==========


What is SJSWS?
-----
Ever needed to run a Java program as a daemon (background service) on your *nix? All you want is to run some basic operations such as start/stop/restart? Then you are in the right place. 

Basically, SJSWS is a simple tool to generate a custom shell script to manage any java program as a service (Start/Stop/restart/etc..). 


It's worth mentioning that there are other alternatives you may use to run a Java program as daemon on Linux:

- Java Service Wrapper.
- Apache Jakarta Commons Daemon package (Jsvc).

These alternatives are much more advanced and you can do a lot more by using them. However, they come with some complexities such as compatibility issues, having the need to implement custom interfaces, or that it requires installation of some extra packages before using.  A shell script, on the other hand, is easier to adapt to changing OS and Java environments.       


Features
--------

- Easy to use
- Reads values from editable properties file to generate custom script that works for your needs
- Provides all basic operations for a service such as Start/Stop/Restart/Status
- In addition to the basic operations, the script also comes with other useful operations to get more information about the configured service such process ID, configuration values, and a help menu
 


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
Contains the list of all configurable values that will be used to create the service shell script. Here is the list of values that are currently supported: 


| Property Name | Description   |
| ------------- |:-------------:|
| SERVICE_NAME      | The name of your service without any spaces|
| SERVICE_WORK_DIR  | The location to the dir where your jar file is located.       |
| SERVICE_PID_FILE  | File name with full path that the service will use to store the process ID. The default is  $SERVICE_WORK_DIR"/"$SERVICE_NAME"_pid"   |
| SERVICE_CLASS_PATH| Path to your jars      |
| SERVICE_CLASS     | Full class name that has the main method for your java program|
|SERVICE_CMD        |  The actual command that the final script will execute to start your service. Default  is "java -cp $SERVICE_CLASS_PATH $SERVICE_CLASS"|

#####ServiceTemplate.sh
This file represents the template which is used to create the end result script. 

#####ServiceConfig.sh
This script is used to create the final script for your service. It reads all the configured values from the Service.properties file, feeds them to the ServiceTemplate.sh file, and finally stores the  final copy in   "CURRENT_DIR/output/service.sh"

#####examples
contains an example of how to use SJSWS to configure and run a jar file as a service. 


Service operations:
---
The generated script will support the following operations: 

	- h, help: print information about the script.  

	- conf: print the current configuration values for the service. 

	- st, status: print the current status of the service. 

	- start: start service by executing the configured java command.   

	- stop: stop the service by killing the PID.

	- restart: restart the configured service by stopping and then starting the service again. 
	
	- pid: print the PID for the configured service.


Going Through the Example
--------
The examples folder contains sample java program (HelloPrintJob) with SJSWS files which can be used to create a service script.
 
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

Here is the list of all steps required to run the example program as a service on your machine:

1- Create jar files: The first thing to do is build the jar file for the HelloPrintJob program. The program simply prints the word "hello" into a temp file every 10 seconds. For the purpose of this example, there is a jar called "HelloPrintJob-1.0-SNAPSHOT.jar" ready to be used. In addition, the source code for this program is also provided under "examples/HelloPrintJob". So you can make any changes to the program and build a new jar file.

2- Update Service.properties: Service.properties has a set values such as the program location and the command used to start the java program. We assume that the working directory for this program will be  "/usr/local/myservices". Here is the full list of values: 
````
SERVICE_NAME=HelloPrintJob
SERVICE_WORK_DIR="/usr/local/myservices"
SERVICE_PID_FILE=$SERVICE_WORK_DIR"/"$SERVICE_NAME"_pid"
SERVICE_CLASS_PATH="$SERVICE_WORK_DIR/HelloPrintJob-1.0-SNAPSHOT.jar"
SERVICE_CLASS=com.job.hello.App
SERVICE_CMD="java -cp $SERVICE_CLASS_PATH $SERVICE_CLASS"

````

3- Create the service script: to create the service script, run  examples/ServiceConfig.sh:
````shell
# sh ./ServiceConfig.sh
````
After running this command you should have the service.sh created under output dir. 


4- Copy the jar file into the working dir "/usr/local/myservices"

````
# mkdir /usr/local/myservices
# cp HelloPrintJob-1.0-SNAPSHOT.jar /usr/local/myservices/HelloPrintJob-1.0-SNAPSHOT.jar
````

5- Add the created script as a new service in init.d
````
# sudo cp output/service.sh /etc/init.d/helloprintservice
# sudo chmod +x /etc/init.d/helloprintservice 
# sudo update-rc.d helloprintservice defaults 
````

That's it!!! Now you have helloprintservice setup as a daemon. You can start the service by calling the "start" command:

````
# /etc/init.d/helloprintservice start
````

6- Add a command shortcut for the service: This is an extra step, but it makes it easier to call the service. To add a command shortcut for the service: 
````
sudo ln -s /etc/init.d/helloprintservice /usr/local/bin/helloprintservice
````

Now you can call the service by writing commands such: 
````
#helloprintservice start
#helloprintservice st
helloprintservice pid
#helloprintservice stop
````


Supported OS
--------
The script is tested under the following operating systems:  
-  MAC OS X El Capitan (v10.11.2)
-  Ubuntu 14.04.3 LTS

However, the script is simple and does not include any special libraries, so it will probably work fine in most *nix systems. 

TODO List
--------
Here are the list of tasks that should be included next: 
- Test and validate the script in other *nix distributions.
- Add support to install/uninstall service.


How Can You help?
-----------------

SJSWS is an open source tool and welcomes contributions.


Author
--------
Suleiman Alrosan 

License
-------
 SJSWS is under Apache License
