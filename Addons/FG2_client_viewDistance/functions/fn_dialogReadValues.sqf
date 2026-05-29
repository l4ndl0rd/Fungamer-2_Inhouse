/*
    Reads numeric edit values from dialog.

    Returns:
    [_vd, _ovd, _shadow, _pip]
*/

disableSerialization;

private _display = findDisplay 6100;
if (isNull _display) exitWith {[4500, 3000, 100, 1500]};

private _readNumber = {
    params ["_idc", "_fallback", "_min", "_max"];

    private _ctrl = _display displayCtrl _idc;
    private _text = ctrlText _ctrl;

    private _value = parseNumber _text;

    if (_value <= 0 && {_text != "0"}) then {
        _value = _fallback;
    };

    _value = round _value;
    _value = (_value max _min) min _max;

    _value
};

private _vd = [6111, 4500, 500, 12000] call _readNumber;
private _ovd = [6112, 3000, 500, 12000] call _readNumber;
private _shadow = [6113, 100, 0, 500] call _readNumber;
private _pip = [6114, 1500, 0, 12000] call _readNumber;

[_vd, _ovd, _shadow, _pip]