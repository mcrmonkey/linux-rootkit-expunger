#!/bin/sh

# You need to be able to send email
# I used configuration information from http://askubuntu.com/questions/12917/how-to-send-mail-from-the-command-line

DIR_TO_SAVE_INTO=$HOME/.rootkit-expunger-saved-info
MAIL_ADDR=your-email-address@yahoo.com

if test -f /etc/rc.local ; then
	if test -d $DIR_TO_SAVE_INTO ; then
		:
	else
		mkdir -p $DIR_TO_SAVE_INTO
		cp /etc/rc.local $DIR_TO_SAVE_INTO
		sha1sum /etc/rc.local >$DIR_TO_SAVE_INTO/initial.state.sum
	fi

	if diff $DIR_TO_SAVE_INTO/rc.local /etc/rc.local ; then
		ssmtp $MAIL_ADDR <<XXxxXX
To: $MAIL_ADDR
From: $MAIL_ADDR
Subject: Rootkit found on $(hostname)
validate-file.sh found a potential rootkit on $(hostname)
XXxxXX
	fi
fi


