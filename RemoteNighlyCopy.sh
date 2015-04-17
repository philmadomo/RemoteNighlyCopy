#!/bin/bash
LOCALDIR="/media/LocalBakup"
REMOTEDIR="/media/hubic/default/Backup/"
# Copy until 7AM
LASTHOUR=7
#Number of Duplicity Files
NBRFILE=12345
#FileName type : duplicity-full.201555331122.vol12345.difftar.gpg
PRENBRNAME="duplicity-full.201555331122.vol"
POSTNBRNAME=".difftar.gpg"

#First List the last job done
for (( filenbr=1; filenbr<=$NBRFILE; filenbr++ ))
do
    if [ -e "$REMOTEDIR/$PRENBRNAME$filenbr$POSTNBRNAME" ]
    then echo "$PRENBRNAME$filenbr$POSTNBRNAME exists in $REMOTEDIR"
    else echo "$PRENBRNAME$filenbr$POSTNBRNAME is missing in $REMOTEDIR"; break
    fi
done
if [ $filenbr -ge $NBRFILE ]
then
	echo "Copy Completed ($NBRFILE Files !)"
else
	echo "Next File is vol: $filenbr !"
fi
#LOOP START
basefilenbr=$filenbr
for (( filenbr=$basefilenbr; filenbr<=$NBRFILE; filenbr++ ))
do
	#Get the Time Hour Only ?
	# Current Hour < at LastHour ???
	CurrentHour=$(date +"%H")
	if [ $CurrentHour -ge $LASTHOUR ]
	then
		#END of Time Period
		echo "No More Copy !"
		exit 1
	else
		#Check if file source exist !
		FilewithPath=$LOCALDIR/$PRENBRNAME$filenbr$POSTNBRNAME
		if [ -f $FilewithPath ]
		then
			cp $FilewithPath $REMOTEDIR/$PRENBRNAME$filenbr$POSTNBRNAME
			echo "File $FilewithPath OK"
		else
			echo "Error File $FilewithPath is missing !"
			exit 1
		fi
	fi
done
#END LOOP




