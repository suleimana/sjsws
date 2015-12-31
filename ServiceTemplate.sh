#!/bin/sh
### BEGIN INIT INFO
# Provides:          V_SERVICE_NAME
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     true
# Short-Description: Start/stop/restart/etc.. service wrapper to run java program as deamon.
### END INIT INFO
# author:            Suleiman Alrosan
# version:            v0.1

SERVICE_NAME=V_SERVICE_NAME
SERVICE_WORK_DIR=V_SERVICE_WORK_DIR
SERVICE_PID_FILE=V_SERVICE_PID_FILE
SERVICE_CLASS_PATH=V_SERVICE_CLASS_PATH
SERVICE_CLASS=V_SERVICE_CLASS
SERVICE_CMD=V_SERVICE_CMD

get_conf()
{
	
	echo "
	--------------------------------------- \033[7mService Configuration\033[0m ---------------------------------------
	The following list represent the service configurations:  
	-\033[1mSERVICE_NAME\033[0m: $SERVICE_NAME
	-\033[1mSERVICE_WORK_DIR\033[0m: $SERVICE_WORK_DIR
	-\033[1mSERVICE_PID_FILE\033[0m: $SERVICE_PID_FILE
	-\033[1mSERVICE_CLASS_PATH\033[0m: $SERVICE_CLASS_PATH
	-\033[1mSERVICE_CLASS\033[0m: $SERVICE_CLASS
	-\033[1mSERVICE_CMD\033[0m:  $SERVICE_CMD
	------------------------------------------------------------------------------------------------------------
	"
}

do_start()
{
	echo "Starting $SERVICE_NAME service ..."
	#nohup java -cp $SERVICE_CLASS_PATH $SERVICE_CLASS  $SERVICE_WORK_DIR 2>> /dev/null >> /dev/null &
	nohup $SERVICE_CMD  $SERVICE_WORK_DIR 2>> /dev/null >> /dev/null &	
	echo $! > $SERVICE_PID_FILE
	PID=$(cat $SERVICE_PID_FILE);
	echo "$SERVICE_NAME service started with PID[$PID]..."
}

do_stop()
{
	PID=$(cat $SERVICE_PID_FILE);
	echo "Stopping $SERVICE_NAME service with PID[$PID]..."
	kill $PID;
	echo "$SERVICE_NAME stopped ..."
	rm $SERVICE_PID_FILE
}

do_restart()
{
	do_stop
	do_start
}

get_status()
{
	if [ ! -f $SERVICE_PID_FILE ]; then
		echo "$SERVICE_NAME service is not running"
	else
		PID=$(cat $SERVICE_PID_FILE);
		echo "$SERVICE_NAME service is running on PID[$PID]"
	fi
}

get_pid(){
	if [ ! -f $SERVICE_PID_FILE ]; then
		echo "NO ACTIVE PID"
	else
		PID=$(cat $SERVICE_PID_FILE);
		echo "PID: $PID"
	fi
}

print_help()
{
	echo '
	--------------------------  \033[7mSimple Java Service Wrapper Script(SJSWS)\033[0m -----------------------------
	This is a simple script to manage java programs(Start/stop/restart/etc.. ), which can be setup as deamon(background service).
	The script accepts the following commands:
	
	- \033[1mh,help\033[0m: print information about the scrip.  

	- \033[1mconf\033[0m: print the current configuration values for the service. 

	- \033[1mst, status\033[0m: print the current status of the service. 

	- \033[1mstart\033[0m: start service by executing the configured java command.   

	- \033[1mstop\033[0m: stop the service by killing the PID.

	- \033[1mrestart\033[0m: restart configured service by stop and then starting the service again. 
	
	- \033[1mpid\033[0m: print the PID for service.
	'
}

case $1 in
	h)
		print_help
	;;
	help)
		print_help
	;;
	pid)
		get_pid
	;;
	conf)
		get_conf
	;;
	st)
		get_status
	;;
	status)
		get_status
	;;
	start)
		if [ ! -f $SERVICE_PID_FILE ]; then
			do_start
		else
			echo "$SERVICE_NAME service is already running."
		fi
	;;
	stop)
		if [ -f $SERVICE_PID_FILE ]; then
			do_stop
		else
			echo "$SERVICE_NAME service is already stopped."
		fi
	;;
	restart)
		if [ -f $SERVICE_PID_FILE ]; then
			do_restart
		else
			echo "$SERVICE_NAME service is not running. Start the service first."
		fi
	;;
	*)  
		echo "Invalid command. See help for more information." 
	;; 
esac
