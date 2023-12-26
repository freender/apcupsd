#!/bin/bash
############


#TITLE="$SUBJECT"
#MESSAGE="$DESCRIPTION"


### Read parameters from input flags
while getopts s:d: flag
do
    case "${flag}" in
        s) TITLE=${OPTARG};;
        d) MESSAGE=${OPTARG};;
    esac
done



############
BOT_TOKEN=${TELEGRAM_TOKEN};
CHATID=${TELEGRAM_CHATID};
MESSAGE=$(echo -e "$(hostname): $TITLE\n$MESSAGE");

curl -G -s -k "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" --data-urlencode "chat_id=$CHATID" --data-urlencode "text=$MESSAGE" ;
