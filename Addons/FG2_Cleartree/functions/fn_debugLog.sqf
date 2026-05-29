/*
    Author: l4ndl0rd

    Description:
    Central ClearTree debug logger.

    Arguments:
    0: Category <STRING>
    1: Message <STRING>
    2: Data <ANY> Optional

    Return:
    Nothing

    Example:
    ["CLIENT", "Started chopping", [_targetTree, _intersectPosASL]] call ClearTree_fnc_debugLog
*/

params [
    ["_category", "GENERAL", [""]],
    ["_message", "", [""]],
    ["_data", nil]
];

if !(missionNamespace getVariable ["ClearTree_debugLogging", false]) exitWith {};

private _machine = "UNKNOWN";

if (isDedicated) then {
    _machine = "DEDICATED";
} else {
    if (isServer) then {
        _machine = "HOST";
    } else {
        _machine = "CLIENT";
    };
};

private _playerName = "NO_PLAYER";

if (hasInterface && {!isNull player}) then {
    _playerName = name player;
};

if (isNil "_data") then {
    diag_log format [
        "[ClearTree][%1][%2][%3] %4",
        _machine,
        _category,
        _playerName,
        _message
    ];
} else {
    diag_log format [
        "[ClearTree][%1][%2][%3] %4 | Data: %5",
        _machine,
        _category,
        _playerName,
        _message,
        _data
    ];
};