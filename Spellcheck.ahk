; crude but quick spellcheck.
^+p:: ; Input CTRL + SHIFT + P.


clipboard=
Sleep, 10

; grab the entire field
Send, {ControlDown}{Home}
Sleep, 5
Send, {ShiftDown}{ControlDown}{End}
Sleep, 5
Send, ^c
Run, https://www.reverso.net/spell-checker/english-spelling-grammar/
Loop, 3
{
	Sleep, 600
	Send, ^v
}
return

~^s::
Sleep, 200
reload
return