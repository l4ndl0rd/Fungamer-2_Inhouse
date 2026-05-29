/*
    Author: l4ndl0rd

    Description:
    Server-side validation for ClearTree.

    The server validates the request and then broadcasts both the target object and
    the visual interaction position to all machines.

    Scope:
    - TREE
    - SMALL TREE
    - no BUSH
    - no grass / clutter cutting

    Arguments:
    0: Target tree object <OBJECT>
    1: Visual interaction position ASL <ARRAY>
    2: Player who requested the cut <OBJECT>

    Return:
    Nothing

    Example:
    [_targetTree, _intersectPosASL, player] remoteExecCall ["ClearTree_fnc_serverClearTree", 2]
*/

if (!isServer) exitWith {};

params [
    ["_targetTree", objNull, [objNull]],
    ["_intersectPosASL", [0, 0, 0], [[]]],
    ["_player", objNull, [objNull]]
];

if (isNull _player) exitWith {
    ["SERVER", "Denied: player is null", [_targetTree, _intersectPosASL]] call ClearTree_fnc_debugLog;
};

private _distance = missionNamespace getVariable ["ClearTree_interactionDistance", 3];

private _playerDistanceToHit = _player distance (ASLToAGL _intersectPosASL);

if (_playerDistanceToHit > (_distance + 2)) exitWith {
    ["SERVER", "Denied: player too far from interaction position", [_player, _playerDistanceToHit, _distance, _intersectPosASL]] call ClearTree_fnc_debugLog;
};

["SERVER", "Accepted: broadcasting tree damage", [_targetTree, _intersectPosASL, _player, _playerDistanceToHit]] call ClearTree_fnc_debugLog;

/*
    Apply tree damage locally on every machine.
    Target 0 is intentional:
    - server applies it too
    - all clients apply it locally
    - SP/editor/listen-host works
*/
[
    _targetTree,
    _intersectPosASL
] remoteExecCall ["ClearTree_fnc_applyTreeDamage", 0, false];