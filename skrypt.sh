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

createLogsSecond ()
{
	num=100
	if [ "$1" != '' ]
	then
		num="$1"
	fi
	
	for i in `seq 1 "$num"`
	do
		mkdir log"$i"
		echo log"$i".txt > log"$i"/log"$i".txt
		echo "$0" >> log"$i"/log"$i".txt
		date +%F >> log"$i"/log"$i".txt
	done
}

createErrorfiles ()
{
	num=100
	if [ "$1" != '' ]
	then
		num="$1"
	fi
	
	for i in `seq 1 "$num"`
	do
		mkdir error"$i"
		echo error"$i".txt > error"$i"/error"$i".txt
		echo "$0" >> error"$i"/error"$i".txt
		date +%F >> error"$i"/error"$i".txt
	done
}

init ()
{
	git clone https://github.com/dsw45634/n-p-lab-3.git
	skrypt="$0"
	export skrypt
}

helpInfo ()
{
	echo "$0"
	echo "Opcje:"
	echo "--date - wyświetl aktualną datę"
	echo "-d - wyświetl aktualną datę"
	echo "--logs - utwórz 100 plików w katalogach: log(1 -100)/log(1 - 100).txt"
	echo "-l - utwórz 100 plików log(1 - 100).txt"
	echo "--logs X - utwórz X plików w katalogach: log(1 - X)/log(1 - X).txt"
	echo "-l X - utwórz X plików log(1 - X).txt"
	echo "--init - klonuj repozytorium do bierzącego katalogu"
	echo "--error - utwórz 100 plików w katalogach: error(1 -100)/error(1 - 100).txt"
	echo "-e - utwórz 100 plików w katalogach: error(1 -100)/error(1 - 100).txt"
	echo "--error X - utwórz X plików w katalogach: error(1 -X)/error(1 - X).txt"
	echo "-e X - utwórz X plików w katalogach: error(1 -X)/error(1 - X).txt"
	echo "--help - wyświetl tą informację"
	echo "-h - wyświetl tą informację"
}

case "$1" in
	"--date") date +%F;;
	"-d") date +%F;;
	"--logs") createLogsSecond "$2";;
	"-l") createLogs "$2";;
	"--help") helpInfo;;
	"-h") helpInfo;;
	"--init") init;;
	"--error") createErrorfiles "$2";;
	"-e") createErrorfiles "$2";;
esac
