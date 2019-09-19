Procedure IsMouseInBox(X.i, Y.i, x2.i, y2.i)                 ;Mouse Procedure
  If MouseX() >= X And MouseX() <= x2    
    If MouseY() >= Y And MouseY() <= y2
      ProcedureReturn #True      
    EndIf  
  EndIf
  ProcedureReturn #False
EndProcedure

Procedure TileMap(Array MapArray.fieldmarket(3),FeldX.i, FeldY.i, layer.i, SpriteID)   
  If FeldX < 0 Or FeldX > #SCREEN_SIZE_WIDTH : ProcedureReturn #False : EndIf
  If FeldY < 0 Or FeldY > #SCREEN_SIZE_HEIGHT : ProcedureReturn #False : EndIf
  
  MapArray(FeldX, FeldY, layer)\ID = SpriteID
  MapArray(FeldX, FeldY, layer)\x = FeldX
  MapArray(FeldX, FeldY, layer)\y = FeldY
  
  ProcedureReturn #True
  
EndProcedure

Procedure TileMap_Field(Array MapArray_Field.fieldmarket(3),FeldX.i, FeldY.i, layer.i, SpriteID.i)   
  If FeldX < 0 Or FeldX > #SCREEN_SIZE_WIDTH : ProcedureReturn #False : EndIf
  If FeldY < 0 Or FeldY > #SCREEN_SIZE_HEIGHT : ProcedureReturn #False : EndIf
  
  MapArray_Field(FeldX, FeldY, layer)\ID = SpriteID

  MapArray_Field\ID = SpriteID
  MapArray_Field\x = FeldX
  MapArray_Field\y = FeldY

  ProcedureReturn #True
  
EndProcedure

Procedure Object(Array Object_Array.objects(2),FeldX.i, FeldY.i, SpriteID.i, Power.i)   
  If FeldX < 0 Or FeldX > #SCREEN_SIZE_WIDTH : ProcedureReturn #False : EndIf
  If FeldY < 0 Or FeldY > #SCREEN_SIZE_HEIGHT : ProcedureReturn #False : EndIf
  
  Object_Array(FeldX, FeldY)\ID = SpriteID
  Object_Array(FeldX, FeldY)\Power = Power
  Object_Array(FeldX, FeldY)\x = FeldX
  Object_Array(FeldX, FeldY)\y = FeldY
  
  ProcedureReturn #True
  
EndProcedure

Procedure Clear_Field_Market()
  Protected X, Y, L
  
  For X = 0 To #SCREEN_SIZE_WIDTH
    For Y = 0 To #SCREEN_SIZE_HEIGHT
      For L = 0 To #LAYER
        
        If MapArray_Field(X,Y,L)\ID = #Sprite_Field_Market
          MapArray_Field(X,Y,L)\ID = 0    
        EndIf
      Next L
    Next Y
  Next X
  
EndProcedure

Procedure ToField(pixel.f,tilesize.i)
  ProcedureReturn Pixel/tilesize
EndProcedure

Procedure ToPixel(field.i,tilesize.i)
  ProcedureReturn field*tilesize-32
EndProcedure

Procedure LOAD_MAP()
  Protected X, Y,l,i
  
  ;// objekte
  ;// X = 0 bis 29
  ;// Y = 0 bis 21
  ;// setzt Sprite auf die Felder
  Object(Object_Array(),Random(13,3),Random(8,2), #Sprite_HQ, 15)
  
  Object(Object_Array(),Random(13,3),Random(8,2), #Sprite_Bank, Random(50,20))
  Object(Object_Array(),Random(13,3),Random(8,2), #Sprite_PHQ, Random(50,20))
  Object(Object_Array(),Random(13,3),Random(8,2), #Sprite_KI, Random(50,20))
  
  
  For X = 0 To #FIELDSIZE_WIDTH
    For Y = 0 To #FIELDSIZE_HEIGHT
      TileMap(MapArray(),X, Y, 0, #Sprite_Field) 
    Next Y
  Next X
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 19
; FirstLine = 38
; Folding = --
; EnableXP
; EnableUnicode