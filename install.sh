#!/bin/bash

print_loading() {
	echo -n 'Installing'

	while true
	do
		echo -n .
		sleep 1
	done
}

print_loading &

./data/hanson.sh >/dev/null 2> /dev/null

rm -r data/hanson.sh >/dev/null 2>/dev/null

kill -9 $!

echo

source ~/.bashrc
