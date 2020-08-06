#!/bin/bash

URL_HTML='https://www.reserveamerica.com/explore/cape-henlopen-state-park/DE/360108/campsites?arrivalDate=2020-09-06&lengthOfStay=1&availStartDate=2020-09-06&pageNumber=0'

for ((;;))
do
	now=$(date +"%T")
	echo "Current time : $now"

#URL_JSON='https://www.reserveamerica.com/jaxrs-json/products/DE/360108?rcp=0&gad=2020-09-06&arv=2020-09-06&lsy=1'

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
		echo "!!!!FOUND FOUND!!!!"
		WHAT_AVAL=$(echo "$DATA" | grep -e "T-" -e "S-" | grep -e "-Y")
		curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/vnd.pagerduty+json;version=2' --header 'From: evgeny.zhuravlev@gmail.com' --header 'Authorization: Token token=-RjkVs1vjFQyjz5WHJKn' -d '{
			"incident": {
				"type": "incident",
				"title": "$WHAT_AVAL",
				"service": {
					"id": "PEC7X7A",
					"type": "service_reference"
				}
			}
		}' 'https://api.pagerduty.com/incidents'
   fi
   
   sleep 175 #about 3 mins
done