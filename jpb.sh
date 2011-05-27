#! /usr/bin/env sh
# jpb.sh v0.1.0 (27.05.2011) by Bystroushaak (bystrousak@kitakitsune.org)

PFN="paths"
OFN="clipboard"

case $1 in
add)
	for i in $@; do
		if [ "$i" = "$1" ]; then continue; fi
		
		FN=`readlink -f "$i"` # get full path
		
		if [ -r $FN ]; then
			echo "$FN" >> $PFN
			echo "$i .. ok"
		else
			echo "Can't add '$i'!"
		fi
	done
;;
del)
	for FN in $@; do
		if [ "$i" = "$1" ]; then continue; fi
		
		grep "$FN" $PFN > /dev/null
		if [ $? -eq 0 ]; then
			grep -v "$FN" $PFN > $PFN.tmp
			rm $PFN && mv $PFN.tmp $PFN
			echo "'$i' removed from list"
		fi
	done
;;
save)
	JPBP="/usr/bin/jpb"
	
	if [ $2!="" ]; then
		OFN=$2
	fi
	
	# unpack jpb
	echo "base64 -d > '/tmp/jbp.tmp' <<EOF--" > $OFN
	gzip -c $0 | base64 >> $OFN
	echo "EOF--" >> $OFN
	echo "gzip -c -d /tmp/jbp.tmp > $JPBP"
	
	#~ tar cz -T $PFN -f - "$PFN" >> $OFN 2>/dev/null
;;
list)
	more $PFN
;;
*)
	echo "Usage: $0 [action] file file2 .."
	echo "\nActions:"
	echo "	add"
	echo "		Mark files for backups."
	echo "	del"
	echo "		Remove files from list of backuped."
	echo "	list"
	echo "		List all files for backups."
;;
esac