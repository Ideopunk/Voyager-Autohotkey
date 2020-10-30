; Scan an ISBN, instant OCLC search.

!1:: ; Input ALT 1.
IfWinActive Voyager Cataloging

	; scan book
	InputBox, ISBN, Item ISBN?
	if ErrorLevel
	{
		return
	}
	Send, !rs  
	Sleep, 5   
	
	; Deactivate any existing connections.
	Send, !k   
	Sleep, 5   
	Send, !b   
	Sleep, 10
	Send, !r
	Sleep, 10
	Send, !l
	Sleep, 20
	Send, !c
	Sleep, 100
	
	; Connect to OCLC
	Send, !r  
	Sleep, 20
	Send, {Down}
	Sleep, 20
	Send, {Tab}
	Sleep, 20
	Send, {Enter}
	Sleep, 20
	Send, !c   
	Sleep, 1000
	
	; Search book
	Send % ISBN
	Send, {Enter}   
return              
                    
~^s::               
Sleep, 200          
reload              
return              