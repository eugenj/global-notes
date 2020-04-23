#!/bin/bash

rm --force --recursive data
mkdir data
wget --directory-prefix=data --input-file=data_urls.txt --output-file=download.log


rm --force --recursive us-pa
mkdir us-pa
cat data/time_series_covid19_confirmed_US.csv | grep -e Pennsylvania -e UID | awk -F, '{print > "us-pa/"$8"_"$7"_"$6"-data.csv"}'
mv us-pa/Country_Region_Province_State_Admin2-data.csv us-pa/headers.csv

rm --force --recursive us-pa-with-headers
mkdir us-pa-with-headers

echo "date,cases,filename" > "us-pa-with-headers/data.csv"
for filename in us-pa/*-data.csv; do
	name=${filename##*/}
	cat us-pa/headers.csv > "us-pa-with-headers/$name-tmp"
    cat "$filename" >> "us-pa-with-headers/$name-tmp"
	cat "us-pa-with-headers/$name-tmp" | python transpose.py | tail -n +60 | dos2unix | sed "s/$/,$name/" >> "us-pa-with-headers/data.csv"
done

rm --force us-pa-with-headers/*.csv-tmp

python.exe plot.py
