#!/bin/bash
#-~-~-~-~-~-~-~-~-~-~-~-~
# Custom motd
#-~-~-~-~-~-~-~-~-~-~-~-~


die() {
	echo "$1" >&2
	exit 1
}

display_jpeg_image() {
	if [[ "$#" -eq 0 ]];
	then
        	die "Ups, you do not have images to display :/"
	else
		random_file_number=`shuf -i 1-"$#" -n 1`
		file_name="${!random_file_number}"
		jp2a $file_name
        	echo "_____------// $(basename $file_name) \\------_____"
	fi
}


USERNAME=`whoami`
HOSTNAME=`hostname`
UPTIME=`uptime | sed 's/.*up \([^,]*\), .*/\1/'`
RELEASE=`uname -osrvm`
IMAGES_DIR="./images"

echo -e "
	\033[0;31m             ___                 _   _
	\033[0;31m _ __  _ __ / _ \ _ __ ___   ___| |_| |__   ___ _   _ ___
	\033[0;32m| '_ \| '__| | | | '_ ' _ \ / _ \ __| '_ \ / _ \ | | / __|
	\033[0;33m| |_) | |  | |_| | | | | | |  __/ |_| | | |  __/ |_| \__ \.
	\033[0;34m| .__/|_|   \___/|_| |_| |_|\___|\__|_| |_|\___|\__,_|___/
	\033[0;34m|_|
	\033[0;31m

xxx------------------------------------------------------------------------------xxx

	Hi \033[0;36m$USERNAME\033[0;31m! Welcome to \033[0;36m$HOSTNAME\033[0;31m, on the name of the old gods we
	wish you a good session and please do not forget to recycle :)

	Our kernel space gnomes have been working for$UPTIME and they are using
	$RELEASE.

xxx------------------------------------------------------------------------------xxx

			<Press any key to continue>

"
read

display_jpeg_image `ls $IMAGES_DIR/*.jpg`
