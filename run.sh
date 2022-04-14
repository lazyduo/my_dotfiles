#!/bin/bash
help()
{
	echo "ThanoSQL Engine launch script."
	echo
	echo "optional parameters - [p]"
	echo
	echo "-p	Port Config"
	echo
}

if [ $# -eq 0 ];
then
	uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
	exit 0
else
	while getopts ":p:h" opt; do
		case $opt in
			p)
				echo "Launch server at port $OPTARG"
				uvicorn app.main:app --reload --host 0.0.0.0 --port $OPTARG
				exit;;
			h)
				echo
				help
				exit;;
			\?) # Invalid option
				echo "Error: Invalid option."
				echo
				help
				exit;;
			:)  # Missing Argument
				echo "Error: Option -$OPTARG requires an argument."
				exit;;

		esac
	done
	help
fi
