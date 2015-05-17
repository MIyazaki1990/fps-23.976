@ECHO OFF 
color f0
CD  /D "%~dp0"


:encLoop
IF "%~1"=="" GOTO :STOP

ffmpeg -y -i "%~1" -vn  -acodec copy "%~dpn1_a.aac"

ffmpeg -y -i "%~1" -vcodec copy  -an "%~dpn1_v.mp4"

ffmpeg -y -i "%~1" -f wav  -| neroaacenc -br 331391 -if - -ignorelength -of "%~dpn1_v_320kbps.aac"

ffmpeg -y -i "%~dpn1_v.mp4" -f h264 -| MP4Box -add "%~dpn1_v.mp4":fps=23.976 -add "%~dpn1_v_320kbps.aac" "%~dpn1_mp4boxVer(320).mp4"

ffmpeg -y -i "%~dpn1_mp4boxVer.mp4" -vcodec copy -acodec copy "%~dpn1_320kbps.flv"

shift /1
GOTO :encLoop


:STOP
ECHO 封装完成，新文件在源文件所在目录下，按任意键关闭窗
口
pause
