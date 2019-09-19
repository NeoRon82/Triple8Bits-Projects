Procedure Input_Mouse()
  Define x,y,l
  If ExamineMouse()

    ;// Maus gedrückt?
   If (MouseButton(#PB_MouseButton_Left) = 0 And mb = #True)
      mb = #False
    EndIf
    If (MouseButton(#PB_MouseButton_Left) And mb = #False)                             
      mb = #True   
      
      If  mb = #True And MouseX()  => ToPixel(3, #TileSize) And MouseX()  =< ToPixel(14, #TileSize) And MouseY()  => ToPixel(2, #TileSize) And MouseY() <= ToPixel(9, #TileSize) And Not GameState\status = #GAME_MAIL
        
        Global field_market\x = MouseX() 
        Global field_market\y = MouseY() 
              
        If TileMap_Field(MapArray_Field(), ToField(field_market\x, #TileSize), ToField(field_market\y, #TileSize), 1, #Sprite_Field_Market) = 0
          Debug "not in range"
          Debug "----"      
        Else         
          Debug "SET"
          Debug "----"
          Debug "Field Pos X "  + Str(ToField(field_market\x,#TileSize)) + " - Y: " + Str(ToField(field_market\y,#TileSize)) 
          Debug "Mosue Pos X "  + Str(MouseX()) + " - Y: " + Str(MouseY())
          Field_ID\objectID  = #NONE_MARKET
        
        EndIf

        For X = 0 To #SCREEN_SIZE_WIDTH
          For Y = 0 To #SCREEN_SIZE_HEIGHT
            For L = 0 To #LAYER
              If MapArray_Field(X,Y,L)\ID = #Sprite_Field_Market And Object_Array(X,Y)\ID = #Sprite_HQ
                Field_ID\objectID = #HQ_Base         
              EndIf
              If MapArray_Field(X,Y,L)\ID = #Sprite_Field_Market And Object_Array(X,Y)\ID = #Sprite_Bank
                Field_ID\objectID = #Bank_Base               
              EndIf
              If MapArray_Field(X,Y,L)\ID = #Sprite_Field_Market And Object_Array(X,Y)\ID = #Sprite_PHQ
                Field_ID\objectID = #PHQ_Base             
              EndIf
           Next L
          Next Y
        Next X

      EndIf   
    EndIf
  EndIf
EndProcedure

Procedure Input_Keyboard()
  
  ExamineKeyboard()
  
  If KeyboardReleased(#PB_Key_Escape)
    GameState\status = #GAME_END
  EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 52
; FirstLine = 10
; Folding = -
; EnableXP
; EnableUnicode