@ECHO OFF 
color f0
CD /D "%~dp0"

ffmpeg -ss 00:0:01 -i "%~1" -t 00:3:20 -vcodec copy -acodec copy -y  "%~dpn1_splitS.mp4"

