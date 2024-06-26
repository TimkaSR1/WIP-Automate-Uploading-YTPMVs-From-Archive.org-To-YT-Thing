echo insert archive.org link

read link

echo insert dir to save the video in

read dir

# getting variables

title=$(yt-dlp --print title $link)

desc=$(yt-dlp --print description $link)

creator=$(yt-dlp --print creator $link)

rel_date=$(yt-dlp --print "%(release_date>%d/%m/%Y)s" $link)

format_date=$(echo [$rel_date] | awk -F'[][/: ]' 'BEGIN{split("January February March April May June July August September October November December",m,/ /)} {print m[$3+0],$2",",$4}')

url=$(yt-dlp --print webpage_url $link)

video_dir=$(echo $dir/$creator/$title)

desc_file=$(echo $video_dir/$title-metadata.txt)

# creating description

mkdir -p "$video_dir"

touch "$desc_file"

echo -e "Archive.org link:" >> "$desc_file"

echo -e "$url\n" >> "$desc_file"

echo -e "Upload date:" >> "$desc_file"

echo -e "$format_date\n" >> "$desc_file"

echo -e "Description:" >> "$desc_file"

echo -e "$desc" >> "$desc_file"

sed -i -e "s@https://@@" "$desc_file"

# download the video

yt-dlp -f b -o "$video_dir/$title [$creator]" $link
