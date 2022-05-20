#maxThreadsPerHotkey, 2
removetooltip(){
   ToolTip
}
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
MsgBox, 0, Put mouse on Buy Pad And F1.to Start Dura Macro,Press F1 And Buy Pad [Start from Left] Both side`nPress F2 to Activate Macro `nPress END to reload or F2 Again to Toggle [on/off]   
end::reload
f1::
   T := !T
   If T
   {
      MouseGetPos, x1, y1
      ToolTip, Saved First Position
      SetTimer, removetooltip, -500
   }else  {
      MouseGetPos, x2, y2
      ToolTip, Saved Seconds Position
      SetTimer, removetooltip, -500
   }
return

f2::
current = 0
slot = 3
current2 = 0
slot2 = 3
PixelGetColor, lol, 300, 117
PixelGetColor, lol1, 1260, 117
macro_on := !macro_on
if (macro_on)
{
   Loop,
   {
      MouseMove, x2, y2, 2
      Sleep 100
      Send {MButton}
      Sleep 100
      Send 1r
      Sleep 1000
      MouseMove, x1, y1, 2
      Sleep 100
      Send {MButton}
      Sleep 100
      Send 1r
      Sleep 100
      Loop,
      {
         SetBatchLines, -1
         PixelSearch, X, Y, 299, 116, 300, 117, %lol%,,Fast ; Full and pop Dura for Left Screen
         If ErrorLevel = 0
         {
            MouseMove, x1, y1, 2
            Sleep 100
            Send {MButton}
            PixelSearch, x, y, 479, 259, 481, 261, 0x1E1E1E, 3, Fast 
            If ErrorLevel = 0
            {
               Sleep 100
               Send e
            }
            Sleep 300
            Send 2{Click, 5} ;pop dura
            ;Settimer, e, -8000 ;berserk
            MouseMove, x2, y2, 2
            Sleep 2000
            Send {MButton}
            Loop,
            {
               PixelSearch, OutputVarX, OutputVarY, 70, 117, 71, 118, 0x3D3DA2, 20, Fast 
               If ErrorLevel = 0
               {
                  Sleep 1000
                  MouseMove, x1, y1, 2
                  Sleep 100
                  Send {MButton}
                  Sleep 100
                  Click, 10 ;buy dura ; un pop dura
                  Sleep 100
                  Click, 10 ;buy dura
                  Sleep 1000
                  Send 1r
                  Break
               }
               PixelSearch, OutputVarX, OutputVarY, 70, 117, 71, 118, 0x444444, 20, Fast
               If ErrorLevel = 0
               {
                  Sleep 1000
                  MouseMove, x1, y1, 2
                  Sleep 100
                  Send {MButton}
                  Sleep 100
                  Click, 10 ;buy dura ; un pop dura
                  Sleep 100
                  Click, 10 ;buy dura
                  Sleep 1000
                  Send 1r
                  Break
               }
               Send {Click}
               Sleep 70
            }
         }



         PixelSearch, X, Y, 1259, 116, 1260, 117, %lol1%,,Fast ; Full and pop Dura for Right Screen
         If ErrorLevel = 0
         {
            MouseMove, x2, y2, 2
            Sleep 100
            Send {MButton}
            PixelSearch, x, y, 1429, 244, 1431, 246, 0x212121, 3, Fast 
            If ErrorLevel = 0
            {
               Sleep 100
               Send e
            }
            Sleep 300
            Send 2{Click, 5} ;pop dura
            ;Settimer, e, -8000 ;berserk
            MouseMove, x1, y1, 2
            Sleep 2000
            Send {MButton}
            Loop,
            {
               PixelSearch, OutputVarX, OutputVarY, 1030, 117, 1031, 118, 0x3D3DA2, 50, Fast 
               If ErrorLevel = 0
               {
                  Sleep 1000
                  MouseMove, x2, y2, 2
                  Sleep 100
                  Send {MButton}
                  Sleep 100
                  Click, 10 ;buy dura ; un pop dura
                  Sleep 100
                  Click, 10 ;buy dura
                  Sleep 1000
                  Send 1r
                  Break
               }
               PixelSearch, OutputVarX, OutputVarY, 1030, 117, 1031, 118, 0x444444, 50, Fast
               If ErrorLevel = 0
               {
                  Sleep 1000
                  MouseMove, x2, y2, 2
                  Sleep 100
                  Send {MButton}
                  Sleep 100
                  Click, 10 ;buy dura ; un pop dura
                  Sleep 100
                  Click, 10 ;buy dura
                  Sleep 1000
                  Send 1r
                  Break
               }
               Send {Click}
               Sleep 70
            }
         }
         PixelSearch , x, y, 99, 144, 100, 145, 0x3A3A3A, 20, Fast ;auto eat
         If ErrorLevel = 0
         {
            MouseMove, x1, y1, 2
            Sleep 100
            Send {MButton}
            tooltip, eat left Screen Slot %slot% Current %current%
            settimer, removetooltip, -3000
            if current <= 5
            {
               Sleep 100
               Send %slot%
               Sleep 200
               Send {Click 10}
               Sleep 200
               Sleep 6000
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
               Sleep 100
               current = 0
               if slot >= 10
               {
                  slot = 0
               }
            }
         }
         PixelSearch , x, y, 1055, 144, 1056, 145, 0x3A3A3A, 20, Fast ;auto eat
         If ErrorLevel = 0
         {
            MouseMove, x2, y2, 2
            Sleep 100
            Send {MButton}
            tooltip, eat left Screen Slot %slot% Current %current%
            settimer, removetooltip, -3000
            if current2 <= 5
            {
               Sleep 100
               Send %slot2%
               Sleep 200
               Send {Click 10}
               Sleep 200
               Sleep 6000
               Send 1r
               current2++
            }
            if slot2 = 0
            {
               if current2 >= 5
               {
                  PixelSearch , x, y, 1010, 144, 1011, 146, 0x3A3A3A, 40, Fast ;auto eat
                  If ErrorLevel = 0
                  {
                     ExitApp
                  }
               }
            }
            if current2 >= 5
            {
               slot2++
               Send {VKC0}
               Sleep 200
               Send {VKC0}
               Sleep 100
               current2 = 0
               if slot2 >= 10
               {
                  slot2 = 0
               }
            }
         }
      }
   }
}
Else
{
   Reload
}
return              
