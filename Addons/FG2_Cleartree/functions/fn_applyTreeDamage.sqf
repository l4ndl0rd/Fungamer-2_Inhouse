/*
    Author: l4ndl0rd

    Description:
    Applies tree damage locally.

    This function is executed on every machine after server validation.

    It first tries the transmitted terrain object directly.
    If that does not work locally, it falls back to resolving a TREE / SMALL TREE
    near the visual interaction position.

    Scope:
    - TREE
    - SMALL TREE
    - no BUSH
    - no grass / clutter cutting

    Arguments:
    0: Target tree object <OBJECT>
    1: Visual interaction position ASL <ARRAY>

    Return:
    Nothing
*/

params [
    ["_targetTree", objNull, [objNull]],
    ["_intersectPosASL", [0, 0, 0], [[]]]
];

private _types = missionNamespace getVariable ["ClearTree_types", ["TREE", "SMALL TREE"]];
private _validationRadius = missionNamespace getVariable ["ClearTree_targetValidationRadius", 0.25];
private _applied = false;

/*
    First attempt:
    Use the transmitted object directly if it exists locally.
*/
if (!isNull _targetTree) then {
    private _nearTreesByObject = nearestTerrainObjects [
        _targetTree,
        _types,
        _validationRadius
    ];

    private _targetIndex = _nearTreesByObject findIf {
        _x isEqualTo _targetTree
    };

    if (_targetIndex >= 0) then {
        ["APPLY", "Applying damage via transmitted object", [_targetTree, _intersectPosASL, damage _targetTree]] call ClearTree_fnc_debugLog;

        _targetTree setDamage 1;

        ["APPLY", "Damage applied via transmitted object", [_targetTree, damage _targetTree]] call ClearTree_fnc_debugLog;

        _applied = true;
    } else {
        ["APPLY", "Transmitted object failed validation, using fallback", [_targetTree, _nearTreesByObject, _validationRadius]] call ClearTree_fnc_debugLog;
    };
} else {
    ["APPLY", "No transmitted object, using fallback", [_intersectPosASL]] call ClearTree_fnc_debugLog;
};

/*
    Stop here if the transmitted object was successfully damaged.
*/
if (_applied) exitWith {};

/*
    Fallback:
    Resolve by visual interaction position.

    This radius must be larger than the strict ACE validation radius because the
    visible hit point and the terrain object origin are often offset from each other.
*/
private _applyRadius = missionNamespace getVariable ["ClearTree_applyRadius", 4];
private _hitPosAGL = ASLToAGL _intersectPosASL;

private _nearTreesByPosition = nearestTerrainObjects [
    _hitPosAGL,
    _types,
    _applyRadius
];

if (_nearTreesByPosition isEqualTo []) exitWith {
    ["APPLY", "Fallback failed: no tree found near interaction position", [_intersectPosASL, _applyRadius]] call ClearTree_fnc_debugLog;
};

private _bestTree = objNull;
private _bestDistance = 999999;

{
    private _tree = _x;

    if (isNull _tree) then {
        continue;
    };

    /*
        Important:
        Do not skip already-damaged trees here silently.
        Log them so we can see whether setDamage already happened but the visual fall animation failed.
    */
    if (damage _tree >= 1) then {
        ["APPLY", "Fallback candidate already damaged, skipping", [_tree, damage _tree, _intersectPosASL]] call ClearTree_fnc_debugLog;
        continue;
    };

    private _distanceToHit = _tree distance _hitPosAGL;

    if (_distanceToHit < _bestDistance) then {
        _bestTree = _tree;
        _bestDistance = _distanceToHit;
    };
} forEach _nearTreesByPosition;

if (isNull _bestTree) exitWith {
    ["APPLY", "Fallback failed: best tree is null", [_nearTreesByPosition, _intersectPosASL]] call ClearTree_fnc_debugLog;
};

["APPLY", "Applying damage via fallback position", [_bestTree, _bestDistance, _intersectPosASL, _applyRadius, damage _bestTree]] call ClearTree_fnc_debugLog;

_bestTree setDamage 1;

["APPLY", "Damage applied via fallback position", [_bestTree, damage _bestTree]] call ClearTree_fnc_debugLog;