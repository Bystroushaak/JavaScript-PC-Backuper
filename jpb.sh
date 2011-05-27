#! /usr/bin/env sh
# jpb.sh v1.0.0 (27.05.2011) by Bystroushaak (bystrousak@kitakitsune.org)

PFN="/tmp/jpb.paths"
DFN="/dev/clipboard"
OFN="/tmp/loader.sh"

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
erase)
	rm $PFN && echo "Erased"
;;
list)
	cat $PFN
;;
save)
	JPBP="/usr/bin/jpb"
	TJPBP="/tmp/jpb.tmp"
	TDP="/tmp/data.tar.gz"
	WDFN=1
	
	if [ $# -gt 1 ]; then
		OFN=$2
		WDFN=0
	fi
	
	echo "Packing jpb.."
	echo "echo \"Unpacking jpb..\"; base64 -d > $TJPBP <<EOF-" > $OFN
	gzip -c $0 | base64 >> $OFN
	echo "EOF-" >> $OFN
	echo "gzip -c -d $TJPBP > $JPBP && rm $TJPBP; chmod +x $JPBP" >> $OFN
	
	echo "Packing data.."
	echo "echo \"Unpacking data..\"; base64 -d > $TDP <<EOF-" >> $OFN
	touch $PFN
	tar cvz -T $PFN -f - "$PFN" 2>/dev/null | base64 >> $OFN 
	echo "EOF-" >> $OFN
	echo "cd /; tar -xvf $TDP && rm $TDP" >> $OFN
	echo "Packet '$OFN' created."
	
	if [ $WDFN -eq 1 ]; then
		cat $OFN > $DFN && rm $OFN
	fi
;;
*)
	echo "Usage: $0 [action] file file2 .."
	echo
	echo "Actions:"
	echo "	add"
	echo "	del"
	echo "	erase"
	echo "	list"
	echo "	save [path]"
	echo "		Create packet containing data and unpacker."
	echo "		Default path is '$OFN'."
;;
esac