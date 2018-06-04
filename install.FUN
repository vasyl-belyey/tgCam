#! /bin/bash
# DEBUG code:
# dir=tgCam; rm -rf $dir; git clone https://github.com/vasyl-belyey/${dir}.git; . ./$dir/install.FUN; read -p "REMOVE? " answer; if [ -d "$dir" ] && ! [ -z "$answer" ]; then rm -rf "$dir"; fi; echo; ll
#
dirZtgCam=$(pwd)
if dirMY=$(find . -name tgCam); then cd "$dirMY"; fi
#
# Functions:
if ! pc=$(which git); then
	sudo apt-get update
	sudo apt-get install git
fi
#
if ! [ -d shell ]; then
	git clone https://github.com/vasyl-belyey/shell.git
	. shell/initSHELL.FUN
fi
#
. includeAll.fun
#
printColored green "\n\n\n\t\t\t Okay.  Let's begin... \n\n"
sleepVB -n 7
# Main:
make
#
# END
printf "\n\n\n"
echo " dirZtgCam = '${dirZtgCam}'"
if ! [ -z "$dirZtgCam" ]; then cd "$dirZtgCam"; fi
pwd
return $retCode
# eof
