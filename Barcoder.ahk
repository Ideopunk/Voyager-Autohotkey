; End the record by adding the barcode...without all the keystrokes. 

^+r:: ; Input CTRL SHIFT R.
InputBox, OutputVar2, Book barcode? ; Scan the barcode.
if ErrorLevel
{
	Msgbox, Nope
	return
}
Send, ^r 
Sleep, 500
Send, !rt
Sleep, 300
Send, %OutputVar2%
Sleep, 200
Send, ^q
Sleep, 200
Send, ^q
return

~^s::
Sleep, 200
reload
return