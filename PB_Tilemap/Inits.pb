; --- InitSystem
If Not InitSprite()         : MessageRequester("Fehler","Sprites konnten nicht initialisiert werden")   : EndIf
If Not InitSound()          : MessageRequester("Fehler","Sound konnte nicht initialisiert werden")      : EndIf
If Not InitMouse()          : MessageRequester("Fehler","Maus konnte nicht initialisiert werden")       : EndIf
If Not InitKeyboard()       : MessageRequester("Fehler","Tastatur konnte nicht initialisiert werden")   : EndIf
If Not UsePNGImageDecoder() : MessageRequester("Fehler","PNG konnte nicht initialisiert werden")        : EndIf
If Not UseOGGSoundDecoder() : MessageRequester("Fehler","OGG konnte nicht initialisiert werden")        : EndIf

If OpenWindow(#Window,0 ,0 ,  Settings\screen_width, Settings\screen_height, "Cypher-Force", #PB_Window_SystemMenu|#PB_Window_ScreenCentered)
  If OpenWindowedScreen(WindowID(#Window), 0, 0, WindowWidth(#Window), WindowHeight(#Window), 0, 0, 0, 0)
  Else
    MessageRequester("Error", "Can't open windowed screen!", 0)
    End
  EndIf
EndIf

SpriteQuality(#PB_Sprite_BilinearFiltering)

; IDE Options = PureBasic 5.50 (Windows - x64)
; CursorPosition = 16
; EnableXP
; EnableUnicode