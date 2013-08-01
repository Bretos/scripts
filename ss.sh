#####
#Screenshoter - simple script for making&uploding screenshots
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

fileDate=`date +%H.%M.%S`
machineName=`hostname`
fileName="-screenshot.png"
FILENAME=$fileDate"-"$machineName$fileName
dst="127.0.0.1" #your dst. server
dstPath="ss"
dstAbs="/var/www/localhost/"
user="username!"

###########
#CONFIG END
###########



#MAIN
scrot $FILENAME #Make screenshot and save it as $FILENAME
scp -C $FILENAME $user@$dst:$dstAbs$dstPath #send screenshot through SCP(with compression enabled for low-bandwith connection) 
echo "http://"$dst"/"$dstPath"/"$FILENAME | xclip -i -selection clipboard #copy screenshot link to your clipboard
rm $FILENAME #delete screenshot locally
