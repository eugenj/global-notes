#!/bin/bash

URL_HTML='https://www.reserveamerica.com/explore/cape-henlopen-state-park/DE/360108/campsites?arrivalDate=2020-09-06&lengthOfStay=1&availStartDate=2020-09-06&pageNumber=0'

now=$(TZ=America/New_York date)
echo "$now"

LOG=$(wget --no-hsts -O response.html ${URL_HTML})


DATA=$(cat response.html | sed -n 's/^.*<title>\(.*,.*\)<\/title>$/\1/p' | \
awk -F ',' '{gsub(/^[ \t]+|[ \t]+$)/, "", $1); gsub(/^[ \t]+|[ \t]+$)/, "", $2); gsub(/^[ \t]+|[ \t]+$)/, "", $3); \
type=($2=="Tent Only")?"T":($2=="Cabin")?"C":($2=="Standard")?"S":"U";\
available=($3=="Not Available")?"N":"Y";\
name=$1;\
print type"-"name"-"available}')

LINES=$(echo "$DATA" | wc -l)
echo $LINES

if [ $LINES -ne 175 ]
then
	echo "Not expected number of lines $LINES"
fi

AVAILABLE=$(echo "$DATA" | grep -e "T-" -e "S-" | grep -e "-Y" | wc -l)
echo "$AVAILABLE"

if [ $AVAILABLE -gt 0 ]
then
	WHAT_AVAL=$(echo "$DATA" | grep -e "T-" -e "S-" | grep -e "-Y")
	echo "!!!!FOUND FOUND!!!!"
	echo "$WHAT_AVAL"
	
	./notify.sh $WHAT_AVAL
fi