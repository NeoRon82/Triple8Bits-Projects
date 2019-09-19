IncludeFile "Defines.pb"
IncludeFile "Lists.pb"
IncludeFile "ReadData.pb"
IncludeFile "Inits.pb"
IncludeFile "Loadcontent.pb"
IncludeFile "Functions.pb"
IncludeFile "Control.pb"
IncludeFile "Display.pb"

Procedure.f FPS()
  Static time.i = -1
  Protected currentTime.i = ElapsedMilliseconds()
  Protected timeDiff.i = currentTime - time
  time = currentTime
  If timeDiff > 0    
    ProcedureReturn   1000 / timeDiff   
  EndIf
  
EndProcedure

Procedure Debugger()

EndProcedure

LOAD_MAP()

Repeat

  Repeat

    Event = WindowEvent()
    
    Select Event 
        
      Case #PB_Event_CloseWindow
        
        End 
        
    EndSelect
    
  Until Event = 0
  
  If ElapsedMilliseconds() >= GameTimer
   ; Debugger()
    Define x,y
    ;//EINGABE
    Input_Mouse()
    Input_Keyboard()

    ;//VERARBEITUNG
    Clear_Field_Market()
    
    ;//Sound

    ;//DISPLAY
    ;Update_Music()
     Update_Screen()
    
    GameTimer = ElapsedMilliseconds() + #FPS 
    
  EndIf
  
  event = WindowEvent() 
  If Event    
  Else
    Delay(1)  
  EndIf 
  
Until GameState\Status = #GAME_END 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 1
; FirstLine = 20
; Folding = -
; EnableXP
; EnableUnicode