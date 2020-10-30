#SingleInstance force
SetTitleMatchMode, 2 ; This lets any window that partially matches the given name get activated
#IfWinActive, Cataloging

; Select all. Overrides the Voyager 'save as template' shortcut.
^a:: 
Send, ^{Home}
Send, ^+{End}
return

; Delete previous word. Mimic normal key behavior. 
^Backspace::
Send, ^+{Left}
Send, {Delete}
return

; Delete next word. Mimic normal key behavior. Overrides Voyager's "Delete rest of line".
^Delete::
Send, ^+{Right}
Send, {Delete}
return

~^s::
Sleep, 100
Reload
return