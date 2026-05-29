params [
	["_unit", objNull, [objNull]],
	["_reason", "manual", [""]]
];

if (!isServer) exitWith {
	diag_log "[FG2][DCP] ResetUnit denied: not server.";
	false
};

if (isNull _unit) exitWith {
	diag_log "[FG2][DCP] ResetUnit failed: null unit.";
	false
};

if (!(_unit isKindOf "CAManBase")) exitWith {
	diag_log format [
		"[FG2][DCP] ResetUnit failed: object is not a unit. object=%1 type=%2",
		_unit,
		typeOf _unit
	];

	false
};

if (!([_unit] call FG2_DCP_fnc_isProtected)) exitWith {
	diag_log format [
		"[FG2][DCP] ResetUnit skipped: unit is not protected. unit=%1 name=%2",
		_unit,
		name _unit
	];

	false
};

_unit allowDamage true;

_unit setVariable ["FG2_DCP_protected", false, true];
_unit setVariable ["FG2_DCP_resetReason", _reason, true];
_unit setVariable ["FG2_DCP_resetTime", serverTime, true];

diag_log format [
	"[FG2][DCP] ResetUnit completed. unit=%1 name=%2 reason=%3",
	_unit,
	name _unit,
	_reason
];

true