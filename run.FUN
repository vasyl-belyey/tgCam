#! /bin/bash
# import:
. isInteger.fun
. parseOption.fun
#
function stop() {
        if (ps -C java); then
                echo; echo "java running.  stop first"; echo; read -p " pid to kill:  " answer
		if isInteger "$answer"; then
			kill -9 "$answer"
			echo
		fi
                return 13
        fi
}
#
function start() {
        if stop; then
                if pc=(ls nohup*.out); then rm -v nohup*.out; fi
		(nohup java -jar PinHoleCamera.jar $args > "$filOUT" &) & exit
                return 0
        fi
	return 13
}
#
# checks:
usageLine=". run.FUN [options] \n\n \
	Options: \n \
		-o nohupFile (default /dev/null) \n \
		start | stop (default start) \n \
		--args argsToPassTo (default --movie --place 'from place.txt file') \n \
		--refreshIPs - only re-load $HOME/.bash_aliases file and exit (close connection) \n \
	\n"
if [ "$1" = "-" ]; then
	printUsage.bash "$usageLine"
	return 13
fi
# --refreshIPs
fil="$HOME"/.bash_aliases
if [ -f "$fil" ]; then . "$fil"; fi
if refreshIPs=$(parseOption "--refreshIPs" $*); then exit 0; fi
#
#
if ! filOUT=$(parseOption -o $*); then
	filOUT=/dev/null
fi
echo "filOUT='$filOUT'"
#
if ! args=$(parseOption --args $*); then
	args="--movie"
fi
filPLACE="place.txt"
if [ -f "$filPLACE" ]; then
	if [ -z "$args" ]; then
		args="--place ""$(cat "$filPLACE")"
	else
		args="$args"" --place ""$(cat "$filPLACE")"
	fi
fi
echo "args='$args'"
#
if mode=$(parseOption stop $*); then
	mode="stop"
else
	mode="start"
fi
echo "mode='$mode'"
#
# main:
case "$mode" in
	"stop")
		stop
	;;
	*)
		while ! start; do
			echo "   re-trying ..."
		done
	;;
esac
#
# END
# eof
