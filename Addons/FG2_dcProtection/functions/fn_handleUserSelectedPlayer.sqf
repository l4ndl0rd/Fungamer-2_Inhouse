params ["_networkId", "_playerObject"];

if (isNull _playerObject) exitWith {
	diag_log format [
		"[FG2][DCP] OnUserSelectedPlayer ignored: null player object. networkId=%1",
		_networkId
	];
};

if (!(_playerObject getVariable ["FG2_DCP_protected", false])) exitWith {};

diag_log format [
	"[FG2][DCP] Protected unit selected. unit=%1 networkId=%2 local=%3",
	_playerObject,
	_networkId,
	local _playerObject
];

if (local _playerObject) exitWith {
	[_playerObject, "user_selected_player_immediate"] call FG2_DCP_fnc_resetUnit;

	diag_log format [
		"[FG2][DCP] Damage restored immediately after user selected player. unit=%1",
		_playerObject
	];
};

_playerObject addEventHandler [
	"Local",
	{
		params ["_unit", "_isLocal"];

		if (!_isLocal) exitWith {};

		_unit removeEventHandler ["Local", _thisEventHandler];

		if (!(_unit getVariable ["FG2_DCP_protected", false])) exitWith {};

		[_unit, "user_selected_player_locality"] call FG2_DCP_fnc_resetUnit;

		diag_log format [
			"[FG2][DCP] Damage restored after locality change. unit=%1",
			_unit
		];
	}
];