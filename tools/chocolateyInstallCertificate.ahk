#NoEnv
#NoTrayIcon
#Warn
SendMode Input
SetTitleMatchMode, 2
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlClick,Button1,Windows ahk_class #32770 ahk_exe rundll32.exe
Sleep 3000

WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlClick,Button1,Windows ahk_class #32770 ahk_exe rundll32.exe
Sleep 3000

WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlClick,Button1,Windows ahk_class #32770 ahk_exe rundll32.exe
Sleep 3000

WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlClick,Button1,Windows ahk_class #32770 ahk_exe rundll32.exe
