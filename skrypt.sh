#!/bin/bash

createLogs ()
{
	num=100
	if [ "$1" != '' ]
	then
		num="$1"
	fi
	
	for i in `seq 1 "$num"`
	do
		echo log"$i".txt > log"$i".txt
		echo "$0" >> log"$i".txt
		date +%F >> log"$i".txt
	done
}

helpInfo ()
{
	echo "$0"
	echo "Opcje:"
	echo "--date - wyświetl aktualną datę"
	echo "--logs - utwórz 100 plików log(1 - 100).txt"
	echo "--logs X - utwórz X plików log(1 - X).txt"
	echo "--help - wyświetl tą informację."
}

case "$1" in
	"--date") date +%F;;
	"--logs") createLogs "$2";;
	"-l") createLogs "$2";;
	"--help") helpInfo;;
	"-h") helpInfo;;
esac
