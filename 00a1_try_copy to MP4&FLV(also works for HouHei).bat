@ECHO OFF 
color f0
CD /D "%~dp0"


:encLoop
IF "%~1"=="" GOTO :STOP

ffmpeg -y -i "%~1"  -vcodec copy -acodec copy "%~dpn1_copy.mp4"

ffmpeg -y -i "%~1"  -vcodec copy -acodec copy "%~dpn1_copy.flv"

shift /1
GOTO :encLoop


:STOP
//ECHO 封装完成，新文件在源文件所在目录下，按任意键关闭窗
//口
//pause
