; enter this while the cursor is inside the existing 264 field to create a 264 _4 copyright field with the existing date. 
!^c:: ; Input CTRL ALT C

clipboard=

; grab the year from the field
Send, {End}
Send, {Left}
Send, +{Left 4}
Send, ^c

; start a new 264 field
Send, {Insert}
Send, 264
Send, {Tab 2}
Send, 4
Send, {Tab}
Sleep, 10

; edit and fill the field with the copyright symbol and the year. 
Send, {BS 2}
Send, c
Send, {Space}
Send, ©
Send, {Left}
Send, {BS}
Send, {Right}
Send, ^v
return


~^s::
Sleep, 200
reload
return