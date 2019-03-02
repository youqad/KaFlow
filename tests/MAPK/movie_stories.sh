mkdir output/png
for i in {1..1227}
do
   sips -z 1024 -s format png output/story.${i}.pdf --out output/png/story.${i}.png
   convert output/png/story.${i}.png -background=white -flatten +matte img.png &&
   mv img.png output/png/story.${i}.png
done
ffmpeg -qscale 5 -r 2 -b 9600 -i output/png/story.%d.png movie.mp4
