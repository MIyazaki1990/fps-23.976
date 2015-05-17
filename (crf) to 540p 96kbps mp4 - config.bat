
@ECHO OFF 
color f0
CD /D  "%~dp0"


:encLoop
IF "%~1"=="" GOTO :STOP

ffmpeg -y -i "%~1" -f h264 -| x264_x64_8bit --crf 23.4 --preset 6 -b 5 -r 3 -I 250 -i 24 --me umh --merang 24 --scenecut 40 -f 1:1 --qcomp 0.5 --psy-rd 0.3:0 --aq-mode 2 --aq-strength 0.9 --vf resize:960,540,,,,lanzos -o "%~dpn1_540p v.mp4" "%~1"

ffmpeg -y -i "%~1" -f wav  -| neroaacenc -br 98304 -if - -ignorelength -of "%~dpn1_540p v_96kbps.aac"

ffmpeg -y -i "%~dpn1_540p v.mp4" -f h264 -| MP4Box -add "%~dpn1_540p v.mp4":fps=23.976 -add "%~dpn1_540p v_96kbps.aac" "%~dpn1_540pEnc_mp4boxVer(96).mp4"

shift /1
GOTO :encLoop

:STOP
ECHO 封装完成，新文件在源文件所在目录下，按任意键关闭窗
口
pause
