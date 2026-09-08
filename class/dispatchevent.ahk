#SingleInstance Force
#Requires AutoHotkey v2.0
InstallKeybdHook

class DispatchEvent {
    array_event := Map()
    __New() {
    }
    dispatchEvent(_event := "", arg_to_dispatch := false) {
        if (!this.array_event.Has(_event)) {
            return false
        }
        tab := this.array_event[_event]
        for key, index in tab {
            ; index(arg_to_dispatch)
            index()
        }
    }
    on(_event, _function) {
        _event := StrUpper(StrReplace(_event, A_Space, ""))
        if (!this.array_event.Has(_event)) {
            this.array_event[_event] := []
        }
        this.array_event[_event].Push(_function)
    }
}

; o := DispatchEvent()
; hello() {
;     MsgBox ("one hello")
; }
; hello2() {
;     MsgBox ("hello 2")
; }

; o.on("CLICK", hello)
; o.on("DOUBLE", hello2)

; o.dispatchEvent("DOUBLE")
