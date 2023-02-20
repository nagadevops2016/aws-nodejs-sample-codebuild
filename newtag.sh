#!/bin/bash
last_tag_name=$(git tag --sort=-version: refname | head -1 ) 
date_fields=$(echo $last_tag_name | rev | cut -d '.' - f 2 )

today_date=$(date '+%Y%m%')

git sec number=o

if [ $date_fields == $today_date ]

then

latest_sec_number=$(echo $last_tag_name | rev | cut -d '.' -f 1 ) 
git_sec_number=$( expr $latest_sec_number + 1 )

else git_sec_number=1 
fi

git tag -a ee-map. Environment.$today_date.$git_sec_number 
git push --tags origin ee-map. Environment.$today_date.$git_sec_number
