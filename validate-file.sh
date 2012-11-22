#!/bin/sh

## You need to be able to send email

## This is a quick and dirty check of rc.local to see if it has been modified after it has been initially run.
## knowledge of the before md5sum would be good
## md5sum can be changed for sha1sum if need be






## Edit the line below to say something other then "YES" to run the script.
## Ensure that you have set the variables above to match your system

SHOWHELP="YES"






FILETOCHECK=/etc/rc.local

DIR_TO_SAVE_INTO=$HOME/.bananaapple

MAIL_ADDR=your-email@address



MD5SUM=/usr/bin/md5sum
MKDIR=/bin/mkdir
MAIL=/bin/mail









if [ $SHOWHELP == "YES" ]; then


printf "Edit the variables in this script first !\n\n\n File to check: $FILETOCHECK \n Place of saving: $DIR_TO_SAVE_INTO \n Email address: $MAIL_ADDR\n\n md5sum location: $MD5SUM \n mkdir location: $MKDIR \n mail location: $MAIL \n\n"

exit 0
fi



## Initial Run ?

if [ -s $DIR_TO_SAVE_INTO/md5list ]
	then
		## MD5 file is non zero so just do a comapre
		$MD5SUM --status -c $DIR_TO_SAVE_INTO/md5list

		## how did md5sum die ?

		if [ $? != 0 ]; then
		
			## something is wrong... send email or just echo something.
			## if this is runing as a cronjob then output will be emailed via cron anyway...
		
			echo "Files listed in $DIR_TO_SAVE_INTO/md5list didn't seem to match their md5sum. You may wish to investigate!"
		
			#echo "Files listed in $DIR_TO_SAVE_INTO/md5list didn't seem to match their md5sum. You may wish to investigate!" | $MAIL -s "File signatures" $MAIL_ADDR


		else

			# All was fine with the md5's, bye.
			exit 0

		 fi





	else

		## Looks like the md5list is zero bytes. Initial run
		echo " It looks like this is the first time you have run this. trying to create md5list file..."		
		$MKDIR -p $DIR_TO_SAVE_INTO	
	

		$MD5SUM $FILETOCHECK > $DIR_TO_SAVE_INTO/md5list



fi


