params [
	["_includePlayers", false, [false]],
	["_reason", "manual_all", [""]]
];

if (!isServer) exitWith {
	diag_log "[FG2][DCP] ResetAll denied: not server.";
	0
};

private _resetCount = 0;

{
	if ([_x] call FG2_DCP_fnc_isProtected) then {
		if (!_includePlayers && {isPlayer _x}) then {
			diag_log format [
				"[FG2][DCP] ResetAll skipped active player unit. unit=%1 name=%2",
				_x,
				name _x
			];
		} else {
			if ([_x, _reason] call FG2_DCP_fnc_resetUnit) then {
				_resetCount = _resetCount + 1;
			};
		};
	};
} forEach allUnits;

diag_log format [
	"[FG2][DCP] ResetAll completed. resetCount=%1 includePlayers=%2 reason=%3",
	_resetCount,
	_includePlayers,
	_reason
];

_resetCount