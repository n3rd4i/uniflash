#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; A windows's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
WinWait,Windows ahk_class #32770 ahk_exe rundll32.exe,mshelp, 180
ControlClick,Button1,Windows ahk_class #32770 ahk_exe rundll32.exe
 
Process, Wait, uniflash_sl.5.0.0.2289.exe
Process, Close, uniflash_sl.5.0.0.2289.exe
