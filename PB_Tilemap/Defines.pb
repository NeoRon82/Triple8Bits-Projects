  #FPS     = 1000/60

#FIELDSIZE_HEIGHT = 6 ;Felder
#FIELDSIZE_WIDTH = 10
#SCREEN_SIZE_HEIGHT = 10
#SCREEN_SIZE_WIDTH = 13

#TILESIZE =64
#LAYER = 2

;// window size
#windowwidth = 1024
#windowhight = 768

#FontSize = 1         ;// Windowtypeface
#TextItensity = 255

Enumeration
  #Window
  #Typeface
  #Sprite_Mouse
  #NONE_STATE
  #Start_Music_Main_Menu
  #StopSound
  ;//States
  #GAME_END
  #GAME_MENU
  #GAME_RUN
  #GAME_NAME
  #GAME_MAIL
  #Int_Mail_Off
  #Int_Mail_On
  #FIELD_MARKET
  #NONE_MARKET
  #HQ_BASE
  #KI_Base
  #PHQ_Base
  #Bank_Base
  ;Mails
  #Mail_Start
  ;//Sprites
  #Sprite_Folder
  ;//Map
  #Map
  #Map_Cristal
  #Map_Pixel
  #Map_Streets
  #Map_Lights
  #Map_Flicker
  ;//Field
  #Sprite_Field
  #Sprite_Field_Market
  ;//Objects
  #Sprite_HQ
  #Sprite_KI
  #Sprite_Bank
  #Sprite_PHQ
  ;//Interface
  #Int_Info_Window
  #Int_Text_Window
  #Int_Mail_Window
  #Int_Display_Level
  #Int_Menu_Bar
  
  #Int_Navi
  #Int_navi_up
  #Int_navi_down
  #Int_navi_left
  #Int_navi_right
  #Int_navi_top
  ;#Sound
  #Music_Main_Menu
  #Music_Game_Run

EndEnumeration

Declare.f fps()

Declare ToPixel(field.i,tilesize.i)
Declare ToField(pixel.f,tilesize.i)

Structure  settings
  screen_width.i
  screen_height.i
  screen_depth.i
EndStructure

Structure game
  Mouse.point
  Position.point
  Field.point
  StartSound.i
  StopSound.i
EndStructure

Structure fieldmarket
  ID.i
  x.i
  y.i
  objectID.i
  fieldID.i
EndStructure

Structure objects
  ID.i
  Layer.i
  x.i
  y.i
  Name.s
  Power.i
EndStructure

Structure player
  name.s
  level.i
  exp.i
  nextlevel_exp.i
  implantate.i
  items.i
  hardware.i
EndStructure

Structure Status
  status.i
  state_int.i
EndStructure

Structure image
  image.i
EndStructure

Structure text Extends image
  StartTime.i
  EndTime.i
  x.i
  y.i
  text.s
  Fade.i
  ftime.i
  fStartTransparent.i
  fEndTransparent.i
  ftexttransparent.i
  iscommand.i
  color.i
EndStructure

Structure range
  min.i
  max.i
EndStructure

Global NewList Input_Text.text()
Global NewList Terminal_List.text()
Global NewList Mail_List.text()
Global NewList field.fieldmarket()
Global NewList image.image()
Global Dim MapArray.fieldmarket(#FIELDSIZE_WIDTH,#FIELDSIZE_HEIGHT,#LAYER)
Global Dim MapArray_Field.fieldmarket(#SCREEN_SIZE_WIDTH,#SCREEN_SIZE_HEIGHT,#LAYER)
Global Dim Object_Array.objects(#SCREEN_SIZE_WIDTH,#SCREEN_SIZE_HEIGHT)
Global Dim Object_HQ.objects(2)

Global.i Event, GameTimer,StartfeldX.i,StartfeldY.i, Market.i, input.s, mail.i, key_delay.i
Global mb.i
Global Settings.settings
Global Game.game
Global field_market.fieldmarket
Global GameState.status
Global Player.player
Global Field_ID.fieldmarket
Global input_text.text
Global MapArray_Field.fieldmarket
Global CommandListDisplayRange.range

Global Game\Field\x = ToPixel(3, #TILESIZE)
Global Game\Field\y = ToPixel(2, #TILESIZE)
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 118
; FirstLine = 126
; EnableXP
; EnableUnicode