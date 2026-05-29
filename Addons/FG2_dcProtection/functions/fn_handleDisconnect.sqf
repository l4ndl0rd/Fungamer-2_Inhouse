params ["_unit", "_id", "_uid", "_name"];

if (isNull _unit) exitWith {
	diag_log format [
		"[FG2][DCP] HandleDisconnect ignored: null unit. id=%1 uid=%2 name=%3",
		_id,
		_uid,
		_name
	];

	false
};

if (!alive _unit) exitWith {
	diag_log format [
		"[FG2][DCP] HandleDisconnect ignored: dead unit. unit=%1 uid=%2 name=%3",
		_unit,
		_uid,
		_name
	];

	false
};

_unit allowDamage false;

_unit setVariable ["FG2_DCP_protected", true, true];
_unit setVariable ["FG2_DCP_disconnectId", _id, true];
_unit setVariable ["FG2_DCP_disconnectUID", _uid, true];
_unit setVariable ["FG2_DCP_disconnectName", _name, true];
_unit setVariable ["FG2_DCP_disconnectTime", serverTime, true];

diag_log format [
	"[FG2][DCP] Protected disconnected unit. unit=%1 id=%2 uid=%3 name=%4 time=%5",
	_unit,
	_id,
	_uid,
	_name,
	serverTime
];

false