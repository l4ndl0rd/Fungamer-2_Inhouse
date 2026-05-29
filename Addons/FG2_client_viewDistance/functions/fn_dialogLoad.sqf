/*
    Initializes FG2 Client View Distance dialog.
*/

disableSerialization;

params ["_display"];

private _vd = profileNamespace getVariable ["FG2_CVD_viewDistance", 4500];
private _ovd = profileNamespace getVariable ["FG2_CVD_objectViewDistance", 3000];
private _shadow = profileNamespace getVariable ["FG2_CVD_shadowDistance", 100];
private _pip = profileNamespace getVariable ["FG2_CVD_pipDistance", 1500];

(_display displayCtrl 6111) ctrlSetText str _vd;
(_display displayCtrl 6112) ctrlSetText str _ovd;
(_display displayCtrl 6113) ctrlSetText str _shadow;
(_display displayCtrl 6114) ctrlSetText str _pip;

{
    (_display displayCtrl _x) ctrlAddEventHandler ["KeyUp", {
        private _display = ctrlParent (_this select 0);
        [_display] call FG2_CVD_fnc_dialogUpdateText;
    }];
} forEach [6111, 6112, 6113, 6114];

[_display] call FG2_CVD_fnc_dialogUpdateText;