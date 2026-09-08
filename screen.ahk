#SingleInstance Force
#Requires AutoHotkey v2.0

#Include class\dispatchevent.ahk
#Include class\button.ahk
#Include lib.ahk

rControl := TripleButton("RControl", true)

rControl_double_click() {
    center_the_mouse()
}
rControl.on("DOUBLE_CLICK", rControl_double_click)

rControl_triple_click() {
    Send "+#s"
    ; MsgBox "Triple"
    ; center_the_mouse()
}
rControl.on("TRIPLE_CLICK", rControl_triple_click)
; ------------------------------------------------------------------------------------
; lAlt := TripleButton("RAlt")
; lAlt_double_click() {
;     ; center_the_mouse()
; }
; lAlt.on("DOUBLE_CLICK", lAlt_double_click)
; lAlt_triple_click() {
;     ; MsgBox "Triple"
;     center_the_mouse()

; }
; lAlt.on("TRIPLE_CLICK", lAlt_triple_click)
