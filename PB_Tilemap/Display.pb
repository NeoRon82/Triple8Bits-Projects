Procedure Display_Map()

  For X = 0 To #FIELDSIZE_WIDTH
    For Y = 0 To #FIELDSIZE_HEIGHT
      For L = 0 To #LAYER
        If MapArray(X,Y,L)\ID = #Sprite_Field
          
          DisplayTransparentSprite(MapArray(X,Y,L)\ID, Game\Field\x+x*#TILESIZE, Game\Field\y+y*#TILESIZE)
          
        EndIf
        
      Next L
    Next Y
  Next X
  
  For X = 0 To #SCREEN_SIZE_WIDTH
    For Y = 0 To #SCREEN_SIZE_HEIGHT
      For L = 0 To #LAYER
        
        If MapArray_Field\ID = #Sprite_Field_Market
          DisplayTransparentSprite(MapArray_Field\ID, ToPixel(MapArray_Field\x, #TileSize) ,ToPixel(MapArray_Field\y, #TileSize))
        EndIf
        
        If Object_Array(X,Y)\ID = #Sprite_HQ
          
          DisplayTransparentSprite(Object_Array(X,Y)\ID, ToPixel(Object_Array(X,Y)\x,#TILESIZE),ToPixel(Object_Array(X,Y)\y,#TILESIZE))  
          ;   Debug " FELDHQ X " + Str(Object_Array(X,Y)\x)
          ;     Debug " FELDHQ Y " + Str(Object_Array(X,Y)\y)
          
        EndIf
        If Object_Array(X,Y)\ID = #Sprite_KI
          
          DisplayTransparentSprite(Object_Array(X,Y)\ID, ToPixel(Object_Array(X,Y)\x,#TILESIZE),ToPixel(Object_Array(X,Y)\y,#TILESIZE))  
          ;   Debug " FELDHQ X " + Str(Object_Array(X,Y)\x)
          ;     Debug " FELDHQ Y " + Str(Object_Array(X,Y)\y)
          
        EndIf
        If Object_Array(X,Y)\ID = #Sprite_PHQ
          
          DisplayTransparentSprite(Object_Array(X,Y)\ID, ToPixel(Object_Array(X,Y)\x,#TILESIZE),ToPixel(Object_Array(X,Y)\y,#TILESIZE))  
          
        EndIf
        If Object_Array(X,Y)\ID = #Sprite_Bank
          
          DisplayTransparentSprite(Object_Array(X,Y)\ID, ToPixel(Object_Array(X,Y)\x,#TILESIZE),ToPixel(Object_Array(X,Y)\y,#TILESIZE))  
        EndIf
      Next L
    Next Y
  Next X
  ;  If Flicker > 10
  ;    DisplayTransparentSprite(#Game_Map_Flicker,0,0)
  ;  Flicker = 0
  ;EndIf
  
EndProcedure

Procedure Display_Main_Screen()
  Define time.f, X, Y
	Time.f = Sin(ElapsedMilliseconds()*0.001)

  StartDrawing(ScreenOutput()) 
  DrawingMode(#PB_2DDrawing_Transparent)
  DrawText(10, 150, "Name: ",RGB($FF,$FF,$99))
  DrawText(60, 150, "" + Player\name)
  DrawText(530, 690, "Level: " + Player\level,RGB($FF,$FF,$99))
    DrawText(560, 713, "Exp: " + Player\exp + " / " + Player\nextlevel_exp,RGB($FF,$FF,$99))
  StopDrawing()
  For X = 0 To #SCREEN_SIZE_WIDTH
    For Y = 0 To #SCREEN_SIZE_HEIGHt
      
      If Object_Array(X,Y)\ID = #Sprite_HQ
        
        If Field_ID\objectID  = #HQ_Base
          StartDrawing(ScreenOutput()) 
          DrawingMode(#PB_2DDrawing_Transparent)
          FrontColor(RGB($FF,$FF,$99))
          DrawText(10, 210, "Hauptquartier: ")
          DrawText(10, 235, "Power: " + Str(Object_Array(X,Y)\Power))
          StopDrawing()
          
        EndIf
      EndIf
      
      If  Object_Array(X,Y)\ID = #Sprite_Bank
        
        If Field_ID\objectID  = #Bank_Base
          StartDrawing(ScreenOutput()) 
          DrawingMode(#PB_2DDrawing_Transparent)
          FrontColor(RGB($FF,$FF,$99))
          DrawText(10, 210, "Bank: ")
          DrawText(10, 235, "Power: " + Str(Object_Array(X,Y)\Power))
          StopDrawing()
        EndIf
      EndIf
          
 
      If  Object_Array(X,Y)\ID = #Sprite_PHQ
        
        If Field_ID\objectID  = #PHQ_Base
          StartDrawing(ScreenOutput()) 
          DrawingMode(#PB_2DDrawing_Transparent)
          FrontColor(RGB($FF,$FF,$99))
          DrawText(10, 210, "Polizei Quartier: ")
          DrawText(10, 235, "Power: " + Str(Object_Array(X,Y)\Power))
          StopDrawing()
        EndIf
      EndIf
    Next Y
  Next X
  
EndProcedure

Procedure Update_Screen()
  
  Define x, y, fade, color, text.s
  
  ClearScreen(RGB(0,0,0)) 

    Display_Map()
    Display_Main_Screen()
  
  DisplayTransparentSprite(#Sprite_Mouse,MouseX() ,MouseY())
  
  StartDrawing(ScreenOutput())  
  DrawText(650, 740, "FPS: "+ StrF(FPS(),2))
  StopDrawing()

  FlipBuffers() 
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 124
; FirstLine = 1
; Folding = -
; EnableXP
; EnableUnicode