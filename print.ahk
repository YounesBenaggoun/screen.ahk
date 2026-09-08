#SingleInstance Force
#Requires AutoHotkey v2.0
InstallKeybdHook

is_map(obj) {
    if (Type(obj) == "Map") {
        return true
    } else {
        return false
    }
}
is_object(obj) {
    if (Type(obj) == "Object") {
        return true
    } else {
        return false
    }
}
is_array(arr) {
    if (Type(arr) == "Array") {
        return true
    } else {
        return false
    }
}
is_function(fn) {
    if (Type(fn) == "Func") {
        return true
    } else {
        return false
    }
}
duplicate_String(long := 0, model := "_") {
    s := ""
    Loop long
    {
        s .= model
    }
    return s
}
pri(object, _msgbox := false, ord := 0) {
    s := ""
    if (is_object(object)) {
        s .= pri_object(object, ord)
    } else if (is_array(object)) {
        s .= pri_array(object, ord)
    } else if (is_map(object)) {
        s .= pri_map(object, ord)
    } else {
        s .= object
    }
    if (_msgbox) {
        MsgBox s
    }
    return s
}
pri_array(tab, ord := 0) {
    s := ""
    space := duplicate_String(ord, "*")
    for key, index in tab {
        if (is_object(index) || is_array(index) || is_map(index)) {
            s .= pri(index, false, ord)
        } else if (is_function(index)) {
            s .= space key " = func-> " index.Name "`n"
        } else {
            s .= space key " = " index "`n"
        }
    }
    return s
}
pri_map(mymap, ord := 0) {
    s := ""
    For key, value in MyMap {
        s .= duplicate_String(ord)
        if (is_object(value) || is_array(value) || is_map(value)) {
            s .= key "`n" pri(value, false, (ord + 4))
        } else if (is_function(value)) {
            s .= key " = func-> " value.Name "`n"
        } else {
            s .= key "=" value "`n"
        }
    }
    return s
}
pri_object(object, ord := 0) {
    s := ""
    for key, value in object.OwnProps() {
        s .= duplicate_String(ord)
        if (is_object(value) || is_array(value) || is_map(value)) {
            s .= key "`n" pri(value, false, (ord + 4))
        } else if (is_function(value)) {
            s .= key " = func-> " value.Name "`n"
        } else {
            s .= key "=" value "`n"
        }
    }
    return s
}


; hello() {
;     MsgBox ("hello")
; }

; colours := { red: "0xFF0000", blue: "0x0000FF", green: "0x00FF00" }
; colours.younesObj := { name: "younes", age: "35" }
; colours.younesObj.mini := { none: "playStation", pig: "large" }
; colours.younesObj.mini.tab := [hello, "one", "two", "thre", { obj: "in_tab" }]

; colours.younesObj.mini.function := hello
; colours.younesObj.mini3 := { none: "playStation", pig: "large" }
; colours := { red: "0xFF0000", blue: "0x0000FF", green: "0x00FF00" }
; The above expression could be used directly in place of "colours" below:


; res := pri(colours)
; MsgBox (res)
