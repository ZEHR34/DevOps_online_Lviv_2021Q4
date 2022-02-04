#!/bin/bash
OK=0
if [ -n "$1"  ] && [ -n "$2" ] && [ $1 != $2 ]
then
	if ls $1 > /dev/null 2> /dev/null && ls $2 > /dev/null 2> /dev/null
	then
		OK=1
	else 
		echo cant read directory.
	fi
else
	echo write 2 directorys
fi
if [ $OK -eq 0 ]
then
	exit	
fi

if ! cat $2log.info > /dev/null 2> /dev/null 
then
	echo created
	touch $2log.info
fi


for FILE in `ls $1` 
do
	cp $1$FILE $2
	CURENT="$FILE `date -r $1$FILE`"
	echo $CURENT

	# NEW FILE
	OLD=`cat $2log.info | grep ^$FILE | tail -n 1 | awk '{NF--; print }'`
	echo $OLD
	if [ "$OLD" == "" ]
	then
		echo NEW FILE
		echo $CURENT N >> $2log.info
	fi

	OLD=`cat $2log.info | grep ^$FILE | tail -n 1 | awk '{NF--; print }'`
	if [ "$OLD" != "$CURENT" ]
	then
		echo file changed
		echo $CURENT E >> $2log.info
	fi
done


for FILE in `ls $2`
do
	if [ "$FILE" != "log.info" ] && [ "`cat $2log.info | grep ^$FILE | grep D$ | tail -n 1`" == "" ]
	then
		IS=1
		# cat $2log.info | grep ^$FILE | grep D$ | tail -n 1
		for NEWFILE in `ls $1`
		do
			# echo new: $NEWFILE old: $FILE
			if [ "$NEWFILE" == "$FILE" ]
			then
				# echo IS
				IS=0
			fi
		done
		# echo $IS $FILE
		if  [ $IS -eq 0 ]
		then
			echo $FILE file not deleted
		else
			echo "$FILE `date` D" >> $2log.info
		fi
	fi
done




