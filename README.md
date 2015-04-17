# RemoteNighlyCopy
The script I use to bulk copy backup files encrypted with duplicity

Configuration: 
#just modify directories
LOCALDIR="/media/LocalBakup"
REMOTEDIR="/media/hubic/default/Backup/"

# If I start the script at noon, it will copy until 7AM
LASTHOUR=7

#Number of Duplicity Files
NBRFILE=12345

#FileName type : duplicity-full.201555331122.vol12345.difftar.gpg
PRENBRNAME="duplicity-full.201555331122.vol"
POSTNBRNAME=".difftar.gpg"
