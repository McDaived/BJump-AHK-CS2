#Persistent
#NoEnv

DllCall("timeBeginPeriod", UInt, 1)

; Set the process priority to REALTIME_PRIORITY_CLASS
Process, Priority, , R

SetTitleMatchMode, 2  
SetTitleMatchMode, Fast ; Faster matching
TICK_64_MS := 15.6
exit_key := "End"
activation_key := "xButton1"

Gui, Font, cFFFFFF 
Gui, Add, Text, x10 y10 w50 h50, Important :
Gui, Font, cFFFFFF 
Gui, Add, Text, x70 y10 w200 h50, Make sure put this command in console.
Gui, Font, c00FF1D 
Gui, Add, Text, x100 y30 w200 h50, bind mwheeldown +jump;
Gui, Font, s10 Bold cFF0000 
Gui, Add, Text, x280 y9 w50 h16, Daived
Gui, Font, s12 Bold
Gui, Color, 000000 ; Background color
Gui, Margin, 10, 10
Gui, Show, Center, BJump Script
GuiControlGet, result

While !GetKeyState(exit_key, "P") 
{
    If GetKeyState(activation_key, "P") 
    {
        MouseClick, WheelDown  ; Simulate mouse wheel down
        Sleep, % (TICK_64_MS * 39) ; Sleep for a specific time
        Send, {LCtrl down} ; Press Left Control
        Sleep, % (TICK_64_MS * 8) ; Sleep for a specific time
        Send, {LCtrl up} ; Release Left Control

        MouseClick, WheelDown ; Simulate mouse wheel down
        While GetKeyState(activation_key, "P")
        {
            MouseClick, WheelDown
            Sleep, % (TICK_64_MS * 2)
        }
    }
    else
    {
        Sleep, 1
    }
}

DllCall("timeEndPeriod", UInt, 1)
ExitApp
