full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}

#IfWinActive ahk_exe YuanShen.exe
NumpadAdd::
Hotkey, %A_ThisHotkey%,, T2
if (NumpadAdd_ok)
{
Reload
return
}
NumpadAdd_ok:=1
loop
{
Send z
Sleep 600
Send {Escape}
Sleep 600
Click, 50, 1024
Sleep 600
Click 1200, 765
Sleep 15000
Click
Sleep 15000
}
return