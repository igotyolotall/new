#maxThreadsPerHotkey, 2
Loop, 3
{	
	CenterWindow("ahk_exe RobloxPlayerBeta.exe")
	Sleep 100
}

IfNotExist, %A_ScriptDir%\bin2\Start.png 
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin2\Stop.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}


MsgBox, 0, put mouse on Buy Pad. to Start Dura Macro,  F1 [YOU] and Wait for Start `nMessage to show up Then Your friend press F1  


CenterWindow(WinTitle) {	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2), 400, 400
}

type() {
    Clipboard = . ;copy clipboard text
    Loop, 3
    {
        Send / ;chat
        Sleep 50
        Send ^{v} ;paste
        Sleep 70
        Send {Enter} ;enter
    }
}

removetooltip() {
    Tooltip
}


end::reload

F1::
CoordMode, Pixel, Window
PixelGetColor, lol, 255, 120
macro_on := !macro_on
if (macro_on)
{
    current = 0
    slot = 3
    Send 1r ;charge rythm
    Loop, ; wait for full hp
    {
        SetBatchLines, -1
        Task1:
        {
            ImageSearch, x, y, 10, 30, 800, 630, *20 %A_ScriptDir%\bin2\Start.png ; Search Start Message
            If ErrorLevel = 0
            {
                tooltip, Found Start
                settimer, removetooltip, -2000
                Sleep 500
                PixelSearch, x, y, 409, 151, 411, 153, 0x242424,, Fast ;auto flow
                If ErrorLevel = 0
                {
                    Send e
                    Sleep 100
                }
                Loop,
                {
                    ImageSearch, x, y, 10, 30, 800, 630, *40 %A_ScriptDir%\bin2\Stop.png
                    If ErrorLevel = 0
                    {
                        Break
                    } else {
                        Send {Click}
                    }
                }
            }
        }
        
        PixelSearch, OutputVarX, OutputVarY, 254, 119, 255, 120, %lol%,,Fast ; Full and pop Dura
        If ErrorLevel = 0
        {
            PixelSearch, x, y, 409, 151, 411, 153, 0x242424,, Fast ;auto flow
            If ErrorLevel = 0
            {
                Send e
                Sleep 100
            }
            Clipboard = Start ;copy clipboard text
            ;Click, 10 ;buy dura
            Sleep 100
            Send 2{Click} ;pop dura
            Send / ;chat
            Sleep 50
            Send ^{v} ;paste
            Sleep 50
            Send {Enter} ;enter
            Sleep 100
            ;Settimer, e, -8000 ;berserk
            Loop,
            {
                PixelSearch, OutputVarX, OutputVarY, 70, 117, 71, 118, 0x3D3DA2, 20, Fast 
                If ErrorLevel = 0
                {
                    Clipboard = Stop ;copy clipboard text
                    Send / ;chat
                    Sleep 80
                    Send ^{v} ;paste
                    Sleep 80
                    Send {Enter} ;enter
                    Sleep 2000
                    Click, 10 ;buy dura ; un pop dura
                    Sleep 100
                    Click, 10 ;buy dura
                    Sleep 1000
                    Send 1r
                    type()
			        Goto, Task1
                }
                PixelSearch, OutputVarX, OutputVarY, 60, 117, 61, 118, 0x444444, 20, Fast
                If ErrorLevel = 0
                {
                    Clipboard = Stop ;copy clipboard text
                    Send / ;chat
                    Sleep 80
                    Send ^{v} ;paste
                    Sleep 80
                    Send {Enter} ;enter
                    Sleep 2000
                    Click, 10 ;buy dura ; un pop dura
                    Sleep 100
                    Click, 10 ;buy dura
                    Sleep 1000
                    Send 1r
                    type()
			        Goto, Task1
                }
            }
        }
        PixelSearch , x, y, 99, 144, 100, 146, 0x3A3A3A, 40, Fast ;auto eat
        If ErrorLevel = 0
        {
            tooltip, eat
            settimer, removetooltip, -3000
            if current <= 5
            {
                Sleep 100
                Send %slot%
                Sleep 200
                Send {Click 10}
                Sleep 200
                Aaa := A_TickCount
                Loop,
                {
                    
                    Sleep 100
                    ImageSearch, x, y, 10, 30, 800, 630, *20 %A_ScriptDir%\bin2\Start.png
                    If ErrorLevel = 0
                    {
                        tooltip, Cancel eat
                        settimer, removetooltip, -3000
                        Sleep 100
                        Send 1r
                        Goto, Task1
                    }
                } Until A_TickCount - Aaa > 6000
                Send 1r
                current++
            }
            if slot = 0
            {
                if current >= 5
                {
                    PixelSearch , x, y, 60, 144, 61, 146, 0x3A3A3A, 40, Fast ;auto eat
                    If ErrorLevel = 0
                    {
                        ExitApp
                    }
                }
            }
            if current >= 5
            {
                slot++
                Send {VKC0}
                Sleep 200
                Send {VKC0}
                current = 0
                if slot >= 10
                {
                    slot = 0
                }
            }
        }
        
    }
}
else
{
    Return
}
Return
