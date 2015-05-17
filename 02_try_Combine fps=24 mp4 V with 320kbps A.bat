CD  /D  "%~dp0"


ffmpeg -y -i "%~1" -f h264 -| MP4Box -add "%~1":fps=24 -add "%~dpn1_320kbps.aac" "%~dpn1_mp4boxVer(320).mp4"

