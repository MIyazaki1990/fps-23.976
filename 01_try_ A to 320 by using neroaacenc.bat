CD  /D "%~dp0"





ffmpeg -y -i "%~1" -f wav  -| neroaacenc -br 331391 -if - -ignorelength -of "%~dpn1_v_320kbps.aac"



pause
