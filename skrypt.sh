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

case "$1" in
	"--date") date +%F;;
	"--logs") createLogs "$2";;
esac
