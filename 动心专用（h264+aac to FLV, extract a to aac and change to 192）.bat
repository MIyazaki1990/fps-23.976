CD /D "%~dp0"

ffmpeg -y -i "%~1"  -vcodec copy -acodec copy "%~dpn1_copy.flv"

ffmpeg -y -i "%~1" -vn  -ab 192k "%~dpn1_v_192kbps.aac.mp3"

ffmpeg -y -i "%~1" -vn  -acodec copy "%~dpn1_a.aac"

