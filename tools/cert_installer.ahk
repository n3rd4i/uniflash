#NoEnv
#NoTrayIcon
#Warn
SendMode Input
SetTitleMatchMode, 2
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlSend,Button1,{SPACE},Windows ahk_class #32770 ahk_exe rundll32.exe
while WinExist("ahk_class #32770")
{
	Sleep, 20
}

WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlSend,Button1,{SPACE},Windows ahk_class #32770 ahk_exe rundll32.exe
while WinExist("ahk_class #32770")
{
	Sleep, 20
}

WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlSend,Button1,{SPACE},Windows ahk_class #32770 ahk_exe rundll32.exe
while WinExist("ahk_class #32770")
{
	Sleep, 20
}

WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlSend,Button1,{SPACE},Windows ahk_class #32770 ahk_exe rundll32.exe
