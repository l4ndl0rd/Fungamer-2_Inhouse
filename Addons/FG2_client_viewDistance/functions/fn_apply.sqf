/*
    FG2_CVD_fnc_apply
    Applies locally stored client view distance settings.
*/

if (!hasInterface) exitWith {};

private _vd = round (profileNamespace getVariable ["FG2_CVD_viewDistance", 4500]);
private _ovd = round (profileNamespace getVariable ["FG2_CVD_objectViewDistance", 3000]);
private _shadow = round (profileNamespace getVariable ["FG2_CVD_shadowDistance", 100]);
private _pip = round (profileNamespace getVariable ["FG2_CVD_pipDistance", 1500]);

_vd = _vd max 0;
_ovd = _ovd max 0;
_shadow = _shadow max 0;
_pip = _pip max 0;

setViewDistance _vd;
setObjectViewDistance [_ovd, _shadow];

if (_pip <= 0) then {
    setPiPViewDistance -1;
} else {
    setPiPViewDistance _pip;
};

diag_log format [
    "[FG2][ClientVD] Applied | Player=%1 | VD=%2 | OVD=%3 | Shadow=%4 | PiP=%5",
    profileName,
    viewDistance,
    getObjectViewDistance,
    _shadow,
    getPiPViewDistance
];

systemChat format [
    "[FG2 VD] VD %1 | OVD %2 | PiP %3",
    viewDistance,
    getObjectViewDistance,
    getPiPViewDistance
];