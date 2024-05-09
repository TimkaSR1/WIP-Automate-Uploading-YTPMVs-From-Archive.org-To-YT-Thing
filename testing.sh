echo put yt-dlp bin dir

read yt

echo put the dir you want to save the video in

read viddir

echo put archive.org linke

read linke

title=$($yt --print title $linke)

creator=$($yt --print creator $linke)

description=$($yt --print description $linke)

rel_date=$($yt --print release_date $linke)

webpageurl=$($yt --print webpage_url $linke)

formatdate_1=$(date -d $rel_date +"%d/%m/%Y")

formatdate_2=$(echo [$formatdate_1] | awk -F'[][/: ]' 'BEGIN{split("January February March April May June July August September October November December",m,/ /)} {print m[$3+0],$2",",$4}')

echo $formatdate_2

#$yt -o "$viddir/%(title)s/%(title)s [%(creator)s]" $linke

#cp description_template.txt $viddir/$title/$title-metadata.txt

#filename=$(echo $viddir/$title/$title-metadata.txt)

#sed -i -e "s/replace_with_description/$description" "$filename"

