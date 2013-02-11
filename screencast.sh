#!/bin/sh
echo "Enter the output file name(use .avi or.mkv as extension): "; read name

fullscreen=$(xwininfo -root | grep 'geometry' | awk '{print $2;}')

ffmpeg -f alsa -i pulse -f x11grab -r 15 -s $fullscreen -i :0.0 -vcodec libx264 -preset ultrafast -threads 4 -y $name
