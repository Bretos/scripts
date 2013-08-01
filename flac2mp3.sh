#######
#flac2mp3.sh -> recursively convert flacs to mp3@320kbps
#improvements advices
#Distributed only under GPLv3 or newr
#may be used to convert different formats... feel free to modify/alter
#comment third from end line to keep original file undeleted
#######

if [ -z $1 ];then echo Give target directory; exit 0;fi

find "$1" -depth -name "*.flac" | while read file ; do
directory=$(dirname "$file")
oldfilename=$(basename "$file")
newfilename=$(basename "${file%.[Ff][Ll][Aa][Cc]}")

if [ "$oldfilename" != "$newfilename" ]; then
ffmpeg -i "$directory/$oldfilename" -ab 320k "$directory/$newfilename.mp3" </dev/null
rm "$directory/$oldfilename"
fi
done
