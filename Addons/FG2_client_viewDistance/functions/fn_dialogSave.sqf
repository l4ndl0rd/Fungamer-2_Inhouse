/*
    Saves current dialog values and applies them.
*/

disableSerialization;

private _display = findDisplay 6100;
if (isNull _display) exitWith {};

private _values = [] call FG2_CVD_fnc_dialogReadValues;
_values params ["_vd", "_ovd", "_shadow", "_pip"];

profileNamespace setVariable ["FG2_CVD_viewDistance", _vd];
profileNamespace setVariable ["FG2_CVD_objectViewDistance", _ovd];
profileNamespace setVariable ["FG2_CVD_shadowDistance", _shadow];
profileNamespace setVariable ["FG2_CVD_pipDistance", _pip];

saveProfileNamespace;

setViewDistance _vd;
setObjectViewDistance [_ovd, _shadow];

if (_pip <= 0) then {
    setPiPViewDistance -1;
} else {
    setPiPViewDistance _pip;
};

[_display] call FG2_CVD_fnc_dialogUpdateText;

diag_log format [
    "[FG2][ClientVD] Saved and applied | VD=%1 | OVD=%2 | Shadow=%3 | PiP=%4",
    viewDistance,
    getObjectViewDistance,
    _shadow,
    getPiPViewDistance
];

systemChat format [
    "[FG2 VD] Saved | VD %1 | OVD %2 | PiP %3",
    round viewDistance,
    getObjectViewDistance,
    round getPiPViewDistance
];