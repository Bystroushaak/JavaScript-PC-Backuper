#! /usr/bin/env sh
# jpb.sh v0.3.0 (27.05.2011) by Bystroushaak (bystrousak@kitakitsune.org)

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
list)
	cat $PFN
;;
save)
	JPBP="/usr/bin/jpb"
	TJPBP="/tmp/jbp.tmp"
	TDP="/tmp/data.tar.gz"
	
	if [ $2!="" ]; then
		OFN=$2
	fi
	
	echo "Packing jpb.."
	echo "echo \"Unpacking jpb..\"; base64 -d > $TJPBP <<EOF-" > $OFN
	gzip -c $0 | base64 >> $OFN
	echo "EOF-" >> $OFN
	echo "gzip -c -d $TJPBP > $JPBP && rm $TJPBP" >> $OFN
	echo "chmod +x $JPBP" >> $OFN
	
	echo "Packing data.."
	echo "echo \"Unpacking data..\"; base64 -d > $TDP <<EOF-" >> $OFN
	touch $PFN
	tar cvz -T $PFN -f - "$PFN" | base64 >> $OFN 2>/dev/null
	echo "EOF-" >> $OFN
	echo "cd /; tar -xvf $TDP && rm $TDP" >> $OFN
;;
*)
	echo "Usage: $0 [action] file file2 .."
	echo
	echo "Actions:"
	echo "	add"
	echo "		Mark files for backups."
	echo "	del"
	echo "		Remove files from list of backuped."
	echo "	list"
	echo "		List all files for backups."
;;
esac