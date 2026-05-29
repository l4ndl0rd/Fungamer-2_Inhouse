/*
    Removes exactly one tablet from a magazine-style medical item.

    Arguments:
    0: Unit owning the magazine <OBJECT>
    1: Magazine classname <STRING>
*/

params [
    ["_unit", objNull, [objNull]],
    ["_magazine", "fg2_tylenol", [""]]
];

if (isNull _unit) exitWith {false};
if (_magazine isEqualTo "") exitWith {false};

if (!local _unit) exitWith {
    [_unit, _magazine] remoteExecCall ["fg2_fnc_removePill", _unit];
    false
};

private _matches = magazinesAmmo _unit select {(_x # 0) == _magazine};

if (_matches isEqualTo []) exitWith {
    diag_log format [
        "[FG2][Tylenol][WARN] No matching magazine found | Unit: %1 | Magazine: %2 | MagazinesAmmo: %3",
        _unit,
        _magazine,
        magazinesAmmo _unit
    ];
    false
};

private _oldMag = _matches # 0;
private _oldCount = _oldMag # 1;

_unit removeMagazine _magazine;

if (_oldCount > 1) then {
    _unit addMagazine [_magazine, _oldCount - 1];
};

diag_log format [
    "[FG2][Tylenol][INFO] Pill removed | Unit: %1 | Magazine: %2 | OldCount: %3 | NewCount: %4",
    _unit,
    _magazine,
    _oldCount,
    (_oldCount - 1) max 0
];

true