#!/bin/sh
### BEGIN INIT INFO
# author:      	     Suleiman Alrosan
#version:	     v0.1
# Short-Description: configuration scrip to generate a wrapper service scrip with custom values read from properties file. 
### END INIT INFO

OUTPUT_DIR="ouput"
OUTPUT_FILE="service.sh"
file="Service.properties"
TEMPLATE_FILE="ServiceTemplate.sh"

copy_output()
{
	echo "=> Prepare output dir...
	"
	if [ ! -f $OUTPUT_DIR ]; then
		echo "Remove output dir first, since it's already existes.";
		rm -r $OUTPUT_DIR;
	fi
	echo "Create output dir: $OUTPUT_DIR"
	mkdir $OUTPUT_DIR
	
	echo "Create service scrip file: $OUTPUT_DIR/$OUTPUT_FILE from $TEMPLATE_FILE"
	cp $TEMPLATE_FILE "$OUTPUT_DIR/$OUTPUT_FILE"
}


read_properties()
{
	echo "=> Read config properties from $file ...
	"	
	while IFS="=" read -r key value; do
		echo "-"$key"="$value
		#sed -i "" "s#V_${key}#${value}#g" "$OUTPUT_DIR/$OUTPUT_FILE"
                sed -i -- "s#V_${key}#${value}#g" "$OUTPUT_DIR/$OUTPUT_FILE"
	done < "$file"
}

copy_output
read_properties


CURRENT_DIR=$(pwd)

echo "

------------The configuration process has finished------------------ 
Location to the generated scrip:[$CURRENT_DIR/$OUTPUT_DIR/$OUTPUT_FILE]"
