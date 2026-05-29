/*
    Function: FG2_CVD_fnc_addAceSelfInteraction
    Adds ACE self interaction entries for FG2 Client View Distance.

    Registered on CAManBase, not on player object.
*/

if (!hasInterface) exitWith {};

if (missionNamespace getVariable ["FG2_CVD_aceClassInteractionAdded", false]) exitWith {};

if (isNil "ace_interact_menu_fnc_createAction") exitWith {
    diag_log "[FG2][ClientVD] ACE interaction skipped: ace_interact_menu not available.";
};

missionNamespace setVariable ["FG2_CVD_aceClassInteractionAdded", true];

private _category = [
    "FG2_CVD_Category",
    localize "STR_FG2_CVD_ACE_CATEGORY",
    "",
    {},
    {true}
] call ace_interact_menu_fnc_createAction;

[
    "CAManBase",
    1,
    ["ACE_SelfActions"],
    _category,
    true
] call ace_interact_menu_fnc_addActionToClass;

private _openMenu = [
    "FG2_CVD_OpenMenu",
    localize "STR_FG2_CVD_ACE_OPEN_MENU",
    "",
    {
        [] call FG2_CVD_fnc_openMenu;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[
    "CAManBase",
    1,
    ["ACE_SelfActions", "FG2_CVD_Category"],
    _openMenu,
    true
] call ace_interact_menu_fnc_addActionToClass;

{
    private _presetId = _x select 0;
    private _label = _x select 1;

    private _loadPreset = [
        format ["FG2_CVD_Load_%1", _presetId],
        format [localize "STR_FG2_CVD_ACE_LOAD_PRESET", _label],
        "",
        {
            params ["", "", "_presetId"];
            [_presetId] call FG2_CVD_fnc_presetLoad;
        },
        {true},
        {},
        _presetId
    ] call ace_interact_menu_fnc_createAction;

    [
        "CAManBase",
        1,
        ["ACE_SelfActions", "FG2_CVD_Category"],
        _loadPreset,
        true
    ] call ace_interact_menu_fnc_addActionToClass;

} forEach [
    ["foot", localize "STR_FG2_CVD_PRESET_FOOT"],
    ["vehicle", localize "STR_FG2_CVD_PRESET_VEHICLE"],
    ["heli", localize "STR_FG2_CVD_PRESET_HELI"],
    ["plane", localize "STR_FG2_CVD_PRESET_PLANE"]
];

diag_log "[FG2][ClientVD] ACE self interaction registered on CAManBase.";