; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.



^+b::
	IfWinExist WIN7-V040
	{
		if MyPassword is space
		{
			InputBox, MyPassword, Enter Password, Enter password, hide 
		}
		WinActivate
		Send {CtrlDown}{ShiftDown}{AltDown}{Delete}{CtrlUp}{ShiftUp}{AltUp}
		Sleep 750
		WinActivate
		Send, {enter}
		Sleep 4000	
		WinActivate		
		Send, jisccm2{tab}%MyPassword%{enter}
	}
return
;
^+x::
	IfWinExist WIN7-V040
	{
		WinActivate
	}Else{
		Run, C:\users\jisccm2\vnc.exe "win7-v040"
	}
return

^+c::
	send, {f2}{ctrl down}{shift down}{Home}{shift up}{ctrl up}
	send, {ctrl down}c{ctrl up}
return 


; Ctrl+Alt+c autocorrect selected text
^!c::
	Loop 10
	{
		Send {tab}{tab}{tab}{tab}{tab}{tab}{tab}
		Send {Ctrl Down}a{Ctrl Up}
		Send {Ctrl Down}c{Ctrl Up}
		Sleep 50
		Send {Alt Down}{Tab}{ALTUP}
		Sleep 50
		Send {Ctrl Down}v{Ctrl Up}{Enter}
		Sleep 50
		Send {Alt Down}{Tab}{ALTUP}
		Sleep 50
		Send {Shift Down}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{Shift Up}
		Send {Down}
		Sleep 50
	}
return


;Gets most recently modified log file from log directory
^!L::
{
	
	Run, "C:\OpenMostRecentLog.exe"
	Return
}
^!+L::
{
	Run, explorer.exe "C:\ProgramData\JBHunt\Client Engineering\Logs"

	Return
}
$^F6::
{
	Loop 50
	{
		IfWinExist DDMI.xlsx - Excel
		{
			WinActivate
			Send ^c{Down}
			Sleep 100
			MyVar = RegExReplace(Clipboard, "[\r\n]") 
			StringTrimRight MyVar, clipboard, 2
			if MyVar =
			{
				break
			}
			IfWinExist Find - Radia ED Prod
			{
				WinActivate
				Sleep 200
				Send ^v{enter}
				Sleep 2000
				Send !d!y!p{enter}
				Sleep 500
			}			
		}
		else
		{
			break
		}		
		
	}
	return
}

^Numpad8::
	var1 = %clipboard%
	Run, explorer.exe "\\"%var1%"\C$\ProgramData\JBHunt\Client Engineering\Logs"
	Return
^Numpad0::
	Run, explorer.exe "\\win7-v040\C$\ProgramData\JBHunt\Client Engineering\Logs"
	Return
^Numpad1::
	Run, explorer.exe "\\win7-v041\C$\ProgramData\JBHunt\Client Engineering\Logs"
	Return
^Numpad2::
	Run, explorer.exe "\\win7-v042\C$\ProgramData\JBHunt\Client Engineering\Logs"
	return
^Numpad3::
	Run, explorer.exe "\\win7-v043\C$\ProgramData\JBHunt\Client Engineering\Logs"
	return
#C::
	IfWinExist Cmder
	{
		WinActivate
	}
	return

