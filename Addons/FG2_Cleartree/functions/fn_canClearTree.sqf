/*
    Author: Ampersand
    Edited by: Rabbit, l4ndl0rd

    Description:
    Checks whether the player can use the ClearTree ACE self action.

    Scope:
    - TREE
    - SMALL TREE
    - no BUSH
    - no grass / clutter cutting

    Arguments:
    0: Unit trying to use the action <OBJECT>

    Return:
    Can cut the looked-at tree <BOOL>

    Example:
    [player] call ClearTree_fnc_canClearTree
*/

params [
    ["_player", objNull, [objNull]]
];

if (isNull _player) exitWith {
    ["CAN", "Denied: player is null"] call ClearTree_fnc_debugLog;
    false
};

private _requireAxe = missionNamespace getVariable ["ClearTree_requireAxe", true];

if (
    _requireAxe &&
    {!("bunwell_axe" in (_player call ace_common_fnc_uniqueItems))}
) exitWith {
    ["CAN", "Denied: missing axe", [_player, items _player]] call ClearTree_fnc_debugLog;
    false
};

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
    ["CAN", "Denied: no lineIntersectsSurfaces result", [_position0, _position1, _distance]] call ClearTree_fnc_debugLog;
    false
};

(_intersections # 0) params [
    ["_intersectPosASL", [0, 0, 0], [[]]],
    ["_surfaceNormal", [0, 0, 1], [[]]],
    ["_intersectObj", objNull, [objNull]],
    ["_parentObject", objNull, [objNull]]
];

if (isNull _intersectObj) exitWith {
    ["CAN", "Denied: intersect object is null", [_intersectPosASL, _parentObject]] call ClearTree_fnc_debugLog;
    false
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
    ["CAN", "Denied: intersect object is not validated as tree", [_intersectObj, _intersectPosASL, _nearTrees, _validationRadius]] call ClearTree_fnc_debugLog;
    false
};

true