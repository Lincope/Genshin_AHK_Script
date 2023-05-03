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
NumpadSub::
Hotkey, %A_ThisHotkey%,, T2
if (NumpadSub_ok)
{
Reload
return
}
NumpadSub_ok:=1
loop
{
Click 1800, 750
Sleep 10
Click 1800, 1000
Sleep 10
Click 150, 150
Sleep 10
Click 150, 230
}
return