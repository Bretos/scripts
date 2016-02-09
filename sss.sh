#####
#Screenshoter - simple script for making&uploding screenshots
#
#WITH SELECT OPTION!
#
#Requirements: ssh, xclip, scrot
#For automated upload it is required to have properly set up RSA key authentication in your system
#you can specify used key by adding -i option in scp command
#use on your own
#I take no responsibility for burned CPUs or killed dinosaurs
#improvements neccesary
#Distributed under GPLv3 or newer.
#####

#############
#CONFIG BEGIN
#############

fileDate=`date +%x-%H.%M.%S`
machineName=`hostname`
fileName=".png"
FILENAME=$fileDate"-"$machineName$fileName
dst="dst.tld" #your dst. server
dstPath="i"
dstAbs="/var/www/"
user="$USERNAME"

###########
#CONFIG END
###########



#MAIN
cd /tmp
scrot -s $FILENAME #Make screenshot and save it as $FILENAME
scp -C $FILENAME $user@$dst:$dstAbs$dstPath #send screenshot through SCP(with compression enabled for low-bandwith connection) 
echo "http://"$dst"/"$dstPath"/"$FILENAME | xclip -i -selection clipboard #copy screenshot link to your clipboard
rm $FILENAME #delete screenshot locally
