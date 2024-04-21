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
NumpadMult::
Hotkey, %A_ThisHotkey%,, T2
if (NumpadMult_ok)
{
Reload
return
}
NumpadMult_ok:=1
loop
{
Click 1300,800
Sleep 100
}
return
