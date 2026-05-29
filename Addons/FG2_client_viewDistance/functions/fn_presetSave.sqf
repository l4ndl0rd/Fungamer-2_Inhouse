/*
    Saves current dialog values into selected preset.

    Params:
    0: preset id string - "foot", "vehicle", "heli", "plane"
*/

disableSerialization;

params ["_presetId"];

private _display = findDisplay 6100;
if (isNull _display) exitWith {};

private _values = [] call FG2_CVD_fnc_dialogReadValues;
_values params ["_vd", "_ovd", "_shadow", "_pip"];

private _key = format ["FG2_CVD_preset_%1", _presetId];

profileNamespace setVariable [_key, [_vd, _ovd, _shadow, _pip]];
saveProfileNamespace;

systemChat format [
    "[FG2 VD] Preset '%1' saved: VD %2 | OVD %3 | PiP %4",
    _presetId,
    _vd,
    _ovd,
    _pip
];

diag_log format [
    "[FG2][ClientVD] Preset saved | Preset=%1 | Values=%2",
    _presetId,
    [_vd, _ovd, _shadow, _pip]
];