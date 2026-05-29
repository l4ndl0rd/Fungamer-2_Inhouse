/*
    Author: Ampersand
    Edited by: Rabbit, l4ndl0rd

    Description:
    Starts the ClearTree action from the local client.
    The actual tree destruction is validated by the server and then applied on all machines.

    Scope:
    - TREE
    - SMALL TREE
    - no BUSH
    - no grass / clutter cutting

    Arguments:
    None

    Return:
    Intersected tree object <OBJECT>

    Example:
    [] call ClearTree_fnc_clearTree
*/

private _distance = missionNamespace getVariable ["ClearTree_interactionDistance", 3];

private _position0 = AGLToASL positionCameraToWorld [0, 0, 0];
private _position1 = AGLToASL positionCameraToWorld [0, 0, _distance];

private _intersections = lineIntersectsSurfaces [
    _position0,
    _position1,
    cameraOn,
    objNull,
    true,
    1,
    "VIEW"
];

if (_intersections isEqualTo []) exitWith {
    ["CLEAR", "Abort: no lineIntersectsSurfaces result", [_position0, _position1, _distance]] call ClearTree_fnc_debugLog;
    objNull
};

(_intersections # 0) params [
    ["_intersectPosASL", [0, 0, 0], [[]]],
    ["_surfaceNormal", [0, 0, 1], [[]]],
    ["_intersectObj", objNull, [objNull]],
    ["_parentObject", objNull, [objNull]]
];

if (isNull _intersectObj) exitWith {
    ["CLEAR", "Abort: intersect object is null", [_intersectPosASL, _parentObject]] call ClearTree_fnc_debugLog;
    objNull
};

private _types = missionNamespace getVariable ["ClearTree_types", ["TREE", "SMALL TREE"]];
private _validationRadius = missionNamespace getVariable ["ClearTree_targetValidationRadius", 0.25];

private _nearTrees = nearestTerrainObjects [
    _intersectObj,
    _types,
    _validationRadius
];

private _targetIndex = _nearTrees findIf {
    _x isEqualTo _intersectObj
};

if (_targetIndex < 0) exitWith {
    ["CLEAR", "Abort: intersect object is not validated as tree", [_intersectObj, _intersectPosASL, _nearTrees, _validationRadius]] call ClearTree_fnc_debugLog;
    objNull
};

private _targetTree = _intersectObj;

if !([player] call ClearTree_fnc_canClearTree) exitWith {
    ["CLEAR", "Abort: canClearTree returned false", [_targetTree, _intersectPosASL]] call ClearTree_fnc_debugLog;
    objNull
};

private _actionTime = missionNamespace getVariable ["ClearTree_actionTime", 22];

["CLEAR", "Started chopping", [_targetTree, _intersectPosASL, _actionTime]] call ClearTree_fnc_debugLog;

/*
    Sound on all machines at the visual interaction position.
*/
[
    _intersectPosASL,
    _actionTime + 5
] remoteExecCall ["ClearTree_fnc_playChopSound", 0, false];

[
    _actionTime,
    [
        _targetTree,
        _intersectPosASL,
        player
    ],
    {
        params ["_args"];

        _args params [
            ["_targetTree", objNull, [objNull]],
            ["_intersectPosASL", [0, 0, 0], [[]]],
            ["_player", objNull, [objNull]]
        ];

        if (isNull _player) exitWith {
            ["CLEAR", "Progress success but player is null", [_targetTree, _intersectPosASL]] call ClearTree_fnc_debugLog;
        };

        ["CLEAR", "Progress success: sending request to server", [_targetTree, _intersectPosASL, _player]] call ClearTree_fnc_debugLog;

        [
            _targetTree,
            _intersectPosASL,
            _player
        ] remoteExecCall ["ClearTree_fnc_serverClearTree", 2];
    },
    {
        params ["_args"];

        ["CLEAR", "Progress cancelled", _args] call ClearTree_fnc_debugLog;
    },
    "Chopping Tree"
] call ace_common_fnc_progressBar;

_targetTree