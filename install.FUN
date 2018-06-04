#! /bin/bash
#
dirZ=$(pwd)
if dirMY=$(find . -name tgCam); then cd "$dirMY"; fi
#
# Functions:
ls
#
# Main:
#
# END
printf "\n\n\n"
if ! [ -z "$dirZ" ]; then cd "$dirZ"; fi
return $retCode
# eof
