center_the_mouse() {
    ScreenX := A_ScreenWidth
    ScreenY := A_ScreenHeight
    half_width := Floor(ScreenX / 2)
    half_height := Floor(ScreenY / 2)
    CoordMode "Mouse", "Screen"
    SendMode "Event"
    MouseMove half_width, half_height, 4
}
toggleCapsLock() {
    SetCapsLockState !GetKeyState("CapsLock", "T")
}
milliTimeStamp() {
    t0 := "19700101010000" ;1970/01/01 10:00:00
    milliSec := A_MSec
    stamp := DateDiff(A_Now, t0, "Seconds")
    return (stamp "." milliSec)
}