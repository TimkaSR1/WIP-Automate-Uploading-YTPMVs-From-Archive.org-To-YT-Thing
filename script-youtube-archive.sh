echo insert youtube link

read link

echo insert dir to save the video in

read dir

# getting variables

title=$(yt-dlp --print title https://web.archive.org/web/*/$link)

desc=$(yt-dlp --print description https://web.archive.org/web/*/$link)

creator=$(yt-dlp --print uploader https://web.archive.org/web/*/$link)

rel_date=$(yt-dlp --print "%(upload_date>%d/%m/%Y)s" https://web.archive.org/web/*/$link)

format_date=$(echo [$rel_date] | awk -F'[][/: ]' 'BEGIN{split("January February March April May June July August September October November December",m,/ /)} {print m[$3+0],$2",",$4}')

url=$(yt-dlp --print webpage_url https://web.archive.org/web/*/$link)

video_dir=$(echo "$dir/$creator/$title")

desc_file=$(echo "$video_dir/$title-metadata.txt")

# creating description

echo -e "Archive.org link:" >> "$desc_file"

echo -e "$url\n" >> "$desc_file"

echo -e "Upload date:" >> "$desc_file"

echo -e "$format_date\n" >> "$desc_file"

echo -e "Description:" >> "$desc_file"

echo -e "$desc" >> "$desc_file"

sed -i -e "s@https://@@" "$desc_file"

# download the video

mkdir -p "$video_dir"

yt-dlp -f b -o "$video_dir/$title [$creator]" https://web.archive.org/web/*/$link
