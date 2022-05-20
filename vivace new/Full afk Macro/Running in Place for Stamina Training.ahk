; test

end::reload
#MaxThreadsPerHotkey, 2
f1::
macro_on := !macro_on
if (macro_on)
{
    CoordMode Pixel, Window
    CoordMode Mouse, Window
    slot = 2
	current = 0
    PixelGetColor , color2, 230, 134,
    Sendinput, {w down}{w up}{w down}{s down}
    Loop,
    {
        Sleep 100
        Loop,
        {
            PixelSearch , x, y, 40, 133, 45, 135, 0x3A3A3A, 40, Fast
            If ErrorLevel = 0
            {
                Sendinput, {w up}{s up}
                PixelSearch , x, y, 105, 144, 110, 146, 0x3A3A3A, 40, Fast
                If ErrorLevel = 0
                {
                    if current <= 5
                    {
                        Send %slot%
                        Sleep 200
                        Send {Click 10}
                        Sleep 8000
                        Send %slot%
                        current++
                    }
                    if slot = 0
                    {
                        if current >= 5
                        {
                            Send !{f4}
                            Exitapp
                        }
                    }
                    if current >= 5
                    {
                        slot++
                        current = 0
                        if slot >= 10
                        {
                            slot = 0
                        }
                    }
                }
                StartTime11 := A_TickCount
                Loop,
                {	
                    CoordMode , Pixel, Window
                    PixelSearch , x, y, 229, 133, 231, 135, color2, 3, Fast
                    If ErrorLevel = 0
                    {
                        Sleep 100
                        send {w down}{w up}{w down}{s down}
                        Sleep 100
                        Break
                    }
                } Until A_TickCount - StartTime11 > 21000
            }
        }
        
    }
}
else
{
    Sleep 100
    Sendinput, {w up}{s up}
    Sleep 100
    ExitApp
}

return
