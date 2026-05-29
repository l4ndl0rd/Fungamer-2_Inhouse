/*
    Function: FG2_CVD_fnc_attachPauseButton
    Adds FG2 View Distance button to ESC menu.

    Fix:
    - No RscButton hitbox. RscButton draws its own black hover state above the label.
    - Click / hover handling is attached to the visible RscText controls instead.
    - Result: gray normal background, orange hover background, readable text.
*/

disableSerialization;

private _display = findDisplay 49;
if (isNull _display) exitWith {};

// Existing background means the full button already exists.
private _existing = _display displayCtrl 6600;
if (!isNull _existing) exitWith {};

private _rhsButton = controlNull;

{
    private _txt = toUpper (ctrlText _x);

    if (_txt isEqualTo "RHS - GAME OPTIONS") exitWith {
        _rhsButton = _x;
    };
} forEach allControls _display;

// Fallback position if RHS is not present/found.
private _x = safeZoneX + (0.010 * safeZoneW);
private _y = safeZoneY + (0.540 * safeZoneH);
private _w = 0.170 * safeZoneW;
private _h = 0.030 * safeZoneH;

if (!isNull _rhsButton) then {
    private _pos = ctrlPosition _rhsButton;

    _x = _pos select 0;
    _y = (_pos select 1) - (_pos select 3) - (0.002 * safeZoneH);
    _w = _pos select 2;
    _h = _pos select 3;
};

private _padX = _w * 0.01; // RscText has its own small internal left inset; extra safeZone padding makes it sit too far right vs RHS.

private _fnc_setNormal = {
    params ["_display"];

    private _bg = _display displayCtrl 6600;
    private _label = _display displayCtrl 6601;

    if (!isNull _bg) then {
        _bg ctrlSetBackgroundColor [0.224, 0.224, 0.224, 0.98]; // #393939
    };

    if (!isNull _label) then {
        _label ctrlSetTextColor [1, 1, 1, 1];
    };
};

private _fnc_setHover = {
    params ["_display"];

    private _bg = _display displayCtrl 6600;
    private _label = _display displayCtrl 6601;

    if (!isNull _bg) then {
        _bg ctrlSetBackgroundColor [0.8, 0.412, 0, 1]; // #cc6900
    };

    if (!isNull _label) then {
        _label ctrlSetTextColor [1, 1, 1, 1];
    };
};

private _fnc_click = {
    params ["_ctrl"];

    private _display = ctrlParent _ctrl;
    _display closeDisplay 2;

    [] spawn {
        uiSleep 0.05;
        [] call FG2_CVD_fnc_openMenu;
    };
};

// Background block. This is also the clickable hover area.
private _bg = _display ctrlCreate ["RscText", 6600];
_bg ctrlSetText "";
_bg ctrlSetPosition [_x, _y, _w, _h];
_bg ctrlSetBackgroundColor [0.224, 0.224, 0.224, 0.98]; // #393939
_bg ctrlEnable true;
_bg ctrlCommit 0;

// Visible label. RscText avoids the default centered/black-hover RscButton behavior.
private _label = _display ctrlCreate ["RscText", 6601];
_label ctrlSetText "FG2 VIEW DISTANCE";
_label ctrlSetFont "RobotoCondensed";
_label ctrlSetFontHeight (_h * 1.00);
_label ctrlSetTextColor [1, 1, 1, 1];
_label ctrlSetBackgroundColor [0, 0, 0, 0];
_label ctrlSetPosition [
    _x + _padX,
    _y - (_h * 0.015),
    _w - (_padX * 2),
    _h
];
_label ctrlEnable true;
_label ctrlCommit 0;

{
    _x ctrlAddEventHandler ["MouseEnter", {
        params ["_ctrl"];
        [ctrlParent _ctrl] call (_ctrl getVariable "FG2_CVD_fnc_setHover");
    }];

    _x ctrlAddEventHandler ["MouseExit", {
        params ["_ctrl"];
        [ctrlParent _ctrl] call (_ctrl getVariable "FG2_CVD_fnc_setNormal");
    }];

    _x ctrlAddEventHandler ["MouseButtonUp", {
        params ["_ctrl", "_button"];
        if (_button isEqualTo 0) then {
            [_ctrl] call (_ctrl getVariable "FG2_CVD_fnc_click");
        };
    }];

    _x setVariable ["FG2_CVD_fnc_setHover", _fnc_setHover];
    _x setVariable ["FG2_CVD_fnc_setNormal", _fnc_setNormal];
    _x setVariable ["FG2_CVD_fnc_click", _fnc_click];
} forEach [_bg, _label];
