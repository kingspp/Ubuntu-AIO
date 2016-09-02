#!/bin/bash
# @Author: Prathyush SP
# @Author-Progress Bar : Teddy Skarin
# Requirements:
# sudo apt-get install imagemagick

#!/bin/sh
echo 	"#########################################"
echo	"||  RAW to JPG Converter v0.1		||"
echo 	"||  @Author: Prathyush SP 		||"
echo 	"#########################################"

##Functions
##########################################################################
function ProgressBar {
	let _progress=(${1}*100/${2}*100)/100
	let _done=(${_progress}*4)/10
	let _left=40-$_done
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")
printf "\rProgress : [${_done// /#}${_left// /-}] ${_progress}%% $3  FileName: $4"
}

function checkArgs {
	if [ "$1" = "" ]; then
		echo "Please specify the source Directory" && exit 1
	fi

	if [ "$2" = "" ]; then
		echo "Please specify the destination Directory"  && exit 1
	fi
}

#############################################################################


##Init Variables
threads=5;
_start=1
#Main
checkArgs $1 $2
#Variable Init
srcDir="$1"
destDir="$2"
echo "Source directory:" $srcDir
echo "Destination directory: " $destDir
cd $srcDir
count="$(find . -type f | wc -l)"
cd ..
echo "Total no of Files: $count"

number=0
ProgressBar 0 $count 0
for filepath in $srcDir*
do
    filename=$(basename $filepath)
    Nfilename=$(echo $filename | cut -f 1 -d '.')
    convert $srcDir$filename $destDir$Nfilename".JPG"
    wait
    ProgressBar ${number} $count $number $filename
    number=`expr $number + 1 `   
done

echo ""
echo "Conversion Completed!!"
