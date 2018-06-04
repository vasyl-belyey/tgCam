#! /bin/bash
#
# Functions:
# . printColored.fun
#

all:
	@printf "\n\n\n\t\t\t Checking asi cameras' rules: \n"
	custom.Ubuntu.bash -P 70-asi-cameras.rules
	@printf "\n\n\n\t\t\t\t Okay \n\n\n"
clean:
	@printf "\n\n\n\t\t\t\t Clean \n\n\n"
# eof
