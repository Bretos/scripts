#!/bin/bash
##Requirements: rdiff-backup
#For automated upload it is required to have properly set up RSA key authentication in your system
#you can specify used key by adding -i option in ssh settings
#use at your own risk
#I take no responsibility for burned CPUs or killed dinosaurs
#improvements neccesary
#this script violates some rules of enlightement http://taobackup.com/
#Distributed under GPLv3 or newer.
#####

### CONFIG
dstHost="destination Host"
dstPath="destination Path"
dstUser="destination User"
keyFile="keyfile #in case you add -i option"
items=( 'paths' 'which you would like' 'to backup' )

for item in ${items[@]}
do
        NAME=${item##*/} 
        rdiff-backup $item $dstUser@$dstHost::$dstPath/$NAME
done
