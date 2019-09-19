Procedure ADDField(ID.i, x.i, y.i)
  AddElement(field())
  field()\ID = ID
  field()\x = x
  field()\y = y
EndProcedure

Procedure ADDImage(image.i)
  AddElement(image())
  image()\image = image
EndProcedure

Procedure ADDText(text.s, x.i, y.i,StartTime.i, Fade.i, ftime.f, fStartTransparent.f, fEndTransparent.f, color.i)
  AddElement(Input_Text())  
  Input_Text()\text = text
  Input_Text()\x = x 
  Input_Text()\y = y
  Input_Text()\StartTime = ElapsedMilliseconds() + StartTime 
  Input_Text()\Fade = Fade
  Input_Text()\ftime = ftime
  Input_Text()\fStartTransparent = fStartTransparent
  Input_Text()\fEndTransparent = fEndTransparent
  Input_Text()\color = color 
EndProcedure

Procedure ADDTerminal_Text(text.s, x.i, y.i,StartTime.i, Fade.i, ftime.f, fStartTransparent.f, fEndTransparent.f, color.i)
  AddElement(Terminal_List())  
  Terminal_List()\text = text
  Terminal_List()\x = x 
  Terminal_List()\y = y
  Terminal_List()\color = color
  MoveElement(Terminal_List(),#PB_List_Last)
  AddElement(input_text())
  Input_Text()\StartTime = ElapsedMilliseconds() + StartTime 
  Input_Text()\Fade = Fade
  Input_Text()\ftime = ftime
  Input_Text()\fStartTransparent = fStartTransparent
  Input_Text()\fEndTransparent = fEndTransparent
EndProcedure

Procedure ADDMail(text.s, x.i, y.i,StartTime.i, Fade.i, ftime.f, fStartTransparent.f, fEndTransparent.f, color.i)
  AddElement(Mail_List())  
  Mail_List()\image = #Sprite_Folder
  Mail_List()\text = text
  Mail_List()\x = x 
  Mail_List()\y = y
  Mail_List()\color = color
  AddElement(input_text())
  Input_Text()\StartTime = ElapsedMilliseconds() + StartTime 
  Input_Text()\Fade = Fade
  Input_Text()\ftime = ftime
  Input_Text()\fStartTransparent = fStartTransparent
  Input_Text()\fEndTransparent = fEndTransparent
EndProcedure
; IDE Options = PureBasic 5.50 (Windows - x64)
; CursorPosition = 31
; FirstLine = 11
; Folding = -
; EnableXP
; EnableUnicode