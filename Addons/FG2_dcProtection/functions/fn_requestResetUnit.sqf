params [
	["_unit", objNull, [objNull]],
	["_reason", "zen_context_restore_damage", [""]]
];

if (!isServer) exitWith {
	diag_log "[FG2][DCP] RequestResetUnit denied: not server.";
	false
};

private _callerOwner = remoteExecutedOwner;

/*
	remoteExecutedOwner:
	- 2 = Server
	- 0 kann in lokalen/SP-Umgebungen auftreten
	- Client-Owner-ID auf Dedicated Server
*/

private _allowed = _callerOwner in [0, 2];

if (!_allowed) then {
	{
		private _curatorUnit = getAssignedCuratorUnit _x;

		if (
			!isNull _curatorUnit
			&& {owner _curatorUnit isEqualTo _callerOwner}
		) exitWith {
			_allowed = true;
		};
	} forEach allCurators;
};

if (!_allowed) exitWith {
	diag_log format [
		"[FG2][DCP] RequestResetUnit denied: caller is not curator. callerOwner=%1 unit=%2",
		_callerOwner,
		_unit
	];

	false
};

diag_log format [
	"[FG2][DCP] RequestResetUnit accepted. callerOwner=%1 unit=%2 reason=%3",
	_callerOwner,
	_unit,
	_reason
];

[_unit, _reason] call FG2_DCP_fnc_resetUnit