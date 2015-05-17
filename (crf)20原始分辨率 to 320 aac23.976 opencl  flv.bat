@ECHO OFF 
color f0
CD /D  "%~dp0"


:encLoop
IF "%~1"=="" GOTO :STOP

ffmpeg -y -i "%~1" -f h264 -| x264_64_tMod-8bit-all --crf 20 --preset 6 -b 5 -r 3 -I 250 -i 24 --me umh --merang 32 --scenecut 40 -f 1:1 --qcomp 0.5 --lookahead-thread 100 --psy-rd 0.3:0 --aq-mode 2 --aq-strength 0.9  --opencl -o "%~dpn1_v.mp4" "%~1"

ffmpeg -y -i "%~1" -f wav  -| neroaacenc -br 331391 -if - -ignorelength -of "%~dpn1_v_320kbps.aac


ffmpeg -y -i "%~dpn1_v.mp4" -f h264 -| MP4Box -add "%~dpn1_v.mp4":fps=23.976 -add "%~dpn1_v_320kbps.aac" "%~dpn1_mp4boxVer(320).mp4"

ffmpeg -y -i "%~dpn1_mp4boxVer(320).mp4" -vcodec copy -acodec copy "%~dpn1_originalDefinition&320Audio enc.flv"

shift /1
GOTO :encLoop

:STOP
ECHO 封装完成，新文件在源文件所在目录下，按任意键关闭窗
口

pause
