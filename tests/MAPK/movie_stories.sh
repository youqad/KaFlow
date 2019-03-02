mkdir output/png
nb_files=$(find output -maxdepth 1 -name "story.*.pdf" | wc -l)

for i in $(seq 1 $nb_files);
do
   sips -z 720 1280 -s format png output/story.${i}.pdf --out output/png/story.${i}.png
   convert output/png/story.${i}.png -flatten +matte img.png &&
   mv img.png output/png/story.${i}.png
done
ffmpeg -framerate 2 -i output/png/story.%d.png -s:v 1280x720 -c:v libx264 -crf 0 -pix_fmt yuv420p -y stories.mp4