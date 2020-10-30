; Use this when inside a newly imported bib recor to 1) Open websites used to check the record's data against, 2) Perform other rote operations.

LibraryPersistLink := "https://library-1.okanagan.bc.ca/vwebv/holdingsInfo?bibId="

^+a:: ; Input SHIFT CTRL A to initiate. 
clipboard=

; Shrink the item window to improve Voyager's performance. 
Send, !-r

; Clear the search of any Z39.50 connections. This section can be commented out depending on workflow. 
Send, !rs
Sleep, 100
Send, !r
Sleep, 10
Send, !l
Sleep, 250
Send, !c
Sleep, 800
Send, !c
Sleep, 200

; Open the 'print label' menu
Send, {AltDown}f
Send, l
Sleep, 220
Send, {Tab 3}
Sleep, 50
Send, {Down 3}
Sleep, 50

; Get author name
Send, {CtrlDown}{Right}
Sleep, 50
Send, {ShiftDown}{End}
Send, ^c
Send, !c
AuthorName := Clipboard
Sleep, 50
clipboard=

; Get bib number
WinGetText, BibNum, a 
RegExMatch(BibNum, "\w+", BibNumbo, 4)

; Get class number

; Go into holdings. This method works whether or not there are multiple holdings. 
Send, !re 
Sleep, 100
Send, !r 
Sleep, 100

; Apply the LCC from the bib 050 field to the holdings record. 
Send, ^n
Sleep, 500	

; Go to the 852 field.
Send, +{Tab 2}
Sleep, 100
Send, {Tab 3}
Sleep, 50
Send, ^{Home}
Sleep, 30

; Replace the 852 field with a properly spaced version and snag the entire thing for a web check later.
Send, +{End}
Sleep, 30
Send, ^c
Sleep, 50

; snag for webcheck. Only works Happily if spaces haven't yet been inserted. 
RegExMatch(clipboard, "(?<=h ).*?(?= )", ohfifty)

; detect where to insert the first space.
RegExMatch(clipboard, "P).*?(?=[0-9])", NumbersLength)

;detect where to insert the second space. Only works if the cutter is preceded by a period, otherwise program will be Unhappy.  
RegExMatch(clipboard, "P).*?(?=\.[A-Z])", CutterLength)

Send, ^{Home}
Sleep, 30
Loop % NumbersLength
{
	Send, {Right}
}
Sleep, 30
Send, {Space}
Sleep, 30
Send, ^{Home}
Sleep, 30
Loop % CutterLength + 1
{
	Send, {Right}
}
Sleep, 300
Send, {Space} 
Send, ^q
Sleep, 100

; Restore bib window to max size.
Send, !-x

; Save bib number to personal record (this section can be removed or modified to suit workflow)
;Run, C:\Users\{YOUR 300# HERE}\Desktop\<YOUR FILENAME HERE>.xlsx ; Excel portion
;Sleep, 2000
;Send, ^{End}
;Send, {Down}
;Send, {Home}
;Send, %BibNumbo%

; Open the record in the OPAC. 
Run, %LibraryPersistLink%%BibNumbo% ; Webvoyage link 
Sleep, 50

; Check LCC
Run, http://www.calculate.alptown.com/
Sleep, 5000 ; Ridiculous wait time unfortunately necessary, load speed can really vary depending on the cache. 

; Switch from "MARC Var. Fields" to 'LC Class Numbers"
Send, {Tab 2}
Sleep, 500
Send, {Down 3}
Sleep, 500
Send, +{Tab 2}
Sleep, 500
Send, %ohfifty% 
Sleep, 500

; Check author name. Remember to check authority record to be sure it's valid.
Run, https://authorities.loc.gov/cgi-bin/Pwebrecon.cgi?DB=local&PAGE=First
Sleep, 3550
Send %AuthorName%
Send, {Enter}
Sleep, 900
Send, {Tab 12} ; Added 1 due to COVID closure element
Send, {Enter}
Sleep, 600
Send, {Tab 10} ; Added 1 due to COVID closure element
Send, {Enter}
return


~^s::
Sleep, 200
reload
return