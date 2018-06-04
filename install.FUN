#! /bin/bash
# DEBUG code:
# dir=tgCam; rm -rf $dir; git clone https://github.com/vasyl-belyey/${dir}.git; . ./$dir/install.FUN; read -p "REMOVE? " answer; if [ -d "$dir" ] && ! [ -z "$answer" ]; then rm -rf "$dir"; fi; echo; ll
#
dirZ=$(pwd)
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
. printColored.fun
#
printColored green "\n\n\n\t\t\t Okay. \n\n"
# Main:
#
# END
printf "\n\n\n"
if ! [ -z "$dirZ" ]; then cd "$dirZ"; fi
return $retCode
# eof
