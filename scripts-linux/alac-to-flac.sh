# helloimbernardo
# Created: 02/06/2024
# All work dedicated to the public domain with CC0 1.0 - https://creativecommons.org/publicdomain/zero/1.0/legalcode

# converts all alac (m4a) files in the current directory to flac files
# works for ffmpeg installed on Windows and Linux

# check if ffmpeg is installed on windows or linux
if command -v ffmpeg.exe >/dev/null 2>&1; then
    ffmpeg_command="ffmpeg.exe"
elif command -v ffmpeg >/dev/null 2>&1; then
    ffmpeg_command="ffmpeg"
else
    echo "ffmpeg could not be found, check if ffmpeg is installed and in the PATH"
    exit
fi

for i in *.m4a; do
    echo $i
    $ffmpeg_command -i "$i" -y -v 0 -vcodec copy -acodec flac "${i%.m4a}".flac
done
echo ".flac files in this directory. Files were converted from .aac" >> README.txt
