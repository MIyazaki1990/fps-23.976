@ECHO OFF 
color f0
CD /D "%~dp0"

ffmpeg -i "%~1" -c copy -bsf:v h264_mp4toannexb -y "%~dp1\M0.mp4"
ffmpeg -i "%~dp1\Otoko-tachi no Yamato (2005) 2_copy.mp4" -c copy -y "%~dp1\M1.mp4"

mp4box -cat "%~dp1\M0.mp4" -cat "%~dp1\M1.mp4" "%~dpn1_con.mp4"

ECHO 已合并完成
pause

