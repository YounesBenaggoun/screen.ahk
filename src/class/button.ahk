
Class TripleButton extends DispatchEvent {
    _t0 := 0
    _button := ""
    _interval := 341
    _clicked := 0
    _timer := false
    _native_action := false
    __New(__button := "RControl", __native_action := false) {
        this._button := __button
        this._native_action := __native_action
        this.init_attr()
    }
    key_up(__keyPressed := false) {
        this.triple_click()
    }
    key_down(__keyPressed := false) {
    }
    init_attr() {
        this._timer := this.tick.bind(this)
        if (this._native_action) {
            Hotkey "~$" this._button " up", this.key_up.bind(this)
        } else {
            Hotkey "$" this._button " up", this.key_up.bind(this)
        }
    }
    tick() {
        SetTimer , 0
        if (this._clicked == 3) {
            this.dispatchEvent("TRIPLE_CLICK")
        } else if (this._clicked == 2) {
            this.dispatchEvent("DOUBLE_CLICK")
        }
        this._clicked := 0
    }
    triple_click() {
        if (this._clicked == 2) {
            this._clicked := 3
        } else if (this.is_double_clicked()) {
            this._clicked := 2
            SetTimer this._timer, this._interval
            ; SetTimer this._timer, 0
        }
    }
    is_double_clicked() {
        now := milliTimeStamp()
        diff := now - this._t0
        this._t0 := now
        if (diff <= 0.301) {
            this._t0 := 0
            return true
        }
        return false
    }
}