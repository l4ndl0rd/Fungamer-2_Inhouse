/*
    Author: l4ndl0rd

    Description:
    Plays the chopping sound locally at a given ASL position.

    This function is intended to be executed globally via remoteExecCall.
    It uses a local non-visual helper object and the existing CfgSounds class.

    Important:
    The helper object must stay alive for the whole sound.
    If the helper is deleted too early, say3D stops.

    Arguments:
    0: Sound position ASL <ARRAY>
    1: Helper lifetime in seconds <NUMBER>

    Return:
    Nothing
*/

if (!hasInterface) exitWith {};

params [
    ["_positionASL", [0, 0, 0], [[]]],
    ["_helperLifetime", 30, [0]]
];

private _positionAGL = ASLToAGL _positionASL;

/*
    Local-only sound proxy.

    Do not use hideObject here.
    Hidden objects can be unreliable as say3D sound sources.

    Land_HelipadEmpty_F is already non-visual, so it does not need to be hidden.
*/
private _soundHelper = "Land_HelipadEmpty_F" createVehicleLocal _positionAGL;

if (isNull _soundHelper) exitWith {
    ["SOUND", "Failed to create local sound helper", [_positionASL, _positionAGL]] call ClearTree_fnc_debugLog;
};

_soundHelper allowDamage false;
_soundHelper setPosASL _positionASL;

["SOUND", "Playing chopping sound", [_positionASL, _helperLifetime, _soundHelper]] call ClearTree_fnc_debugLog;

/*
    Uses CfgSounds:
        class choppingTree
*/
_soundHelper say3D "choppingTree";

/*
    Delete the local helper only after the expected action/sound duration.
    Minimum lifetime prevents accidental early cleanup if a bad value is passed.
*/
private _cleanupDelay = (_helperLifetime max 15);

[
    {
        params [
            ["_helper", objNull, [objNull]]
        ];

        ["SOUND", "Cleaning up sound helper", [_helper]] call ClearTree_fnc_debugLog;

        if (!isNull _helper) then {
            deleteVehicle _helper;
        };
    },
    [_soundHelper],
    _cleanupDelay
] call CBA_fnc_waitAndExecute;