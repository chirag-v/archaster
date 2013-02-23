File Edit Options Buffers Tools Sh-Script Help                                  
#!/bin/sh                                                                       
echo "Enter the output file name: "; read name

fullscreen=$(xwininfo -root | grep 'geometry' | awk '{print $2;}')

ffmpeg -f x11grab -r 15 -s 1366x768 -i :0.0 -f alsa -ac 2 -i pulse -vcodec libx\
264 -preset ultrafast -acodec pcm_s16le $name
