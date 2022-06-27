#!/bin/bash

createLogs ()
{
	for i in `seq 1 100`
	do
		echo log"$i".txt > log"$i".txt
		echo "$0" >> log"$i".txt
		date +%F >> log"$i".txt
	done
}

case "$1" in
	"--date") date +%F;;
	"--logs") createLogs;;
esac
