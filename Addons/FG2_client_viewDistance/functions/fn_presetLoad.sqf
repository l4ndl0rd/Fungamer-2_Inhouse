/*
    Loads selected preset and applies it.

    Params:
    0: preset id string - "foot", "vehicle", "heli", "plane"
*/

disableSerialization;

params ["_presetId"];

private _defaults = switch (_presetId) do {
    case "foot":    {[4500, 3000, 100, 1500]};
    case "vehicle": {[5000, 3500, 100, 1500]};
    case "heli":    {[7000, 5000, 100, 2000]};
    case "plane":   {[10000, 7000, 100, 2500]};
    default         {[4500, 3000, 100, 1500]};
};

private _key = format ["FG2_CVD_preset_%1", _presetId];
private _values = profileNamespace getVariable [_key, _defaults];

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

private _display = findDisplay 6100;
if (!isNull _display) then {
    (_display displayCtrl 6111) ctrlSetText str _vd;
    (_display displayCtrl 6112) ctrlSetText str _ovd;
    (_display displayCtrl 6113) ctrlSetText str _shadow;
    (_display displayCtrl 6114) ctrlSetText str _pip;

    [_display] call FG2_CVD_fnc_dialogUpdateText;
};

systemChat format [
    "[FG2 VD] Loaded '%1' | VD %2 | OVD %3 | PiP %4",
    _presetId,
    _vd,
    _ovd,
    _pip
];

diag_log format [
    "[FG2][ClientVD] Preset loaded | Preset=%1 | Values=%2",
    _presetId,
    _values
];