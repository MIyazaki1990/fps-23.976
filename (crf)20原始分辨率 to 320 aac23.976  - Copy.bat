@ECHO OFF 
color f0
CD /D  "%~dp0"


:encLoop
IF "%~1"=="" GOTO :STOP


ffmpeg -y -i "%~1"  -vcodec copy  -an "%~dpn1_vo.mp4" 

ffmpeg -y -i "%~1" -vn  -acodec copy  "%~dpn1_v_320kbps.aac"

ffmpeg -y -i "%~dpn1_vo.mp4" -f h264 -| x264_x64_8bit  --crf 23.7 --preset 6 -b 5 -r 3 -I 250 -i 24 --me umh --merang 32 --scenecut 40 -f 1:1 --qcomp 0.5 --lookahead-thread 100 --psy-rd 0.3:0 --aq-mode 2 --aq-strength 0.9  -o "%~dpn1_vt.mp4" "%~1"

ffmpeg -y -i "%~dpn1_vt.mp4" -vcodec copy  -an "%~dpn1_v.mp4" 

ffmpeg -y -i "%~dpn1_v.mp4" -f h264 -| MP4Box -add "%~dpn1_v.mp4":fps=23.976 -add "%~dpn1_v_320kbps.aac" "%~dpn1_mp4boxVer(320).mp4"


shift /1
GOTO :encLoop

:STOP
ECHO 封装完成，新文件在源文件所在目录下，按任意键关闭窗
口

pause
