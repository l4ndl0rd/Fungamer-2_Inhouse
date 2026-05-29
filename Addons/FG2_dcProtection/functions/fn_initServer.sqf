if (!isServer) exitWith {};

if (missionNamespace getVariable ["FG2_DCP_initialized", false]) exitWith {
	diag_log "[FG2][DCP] Already initialized. Skipping duplicate init.";
};

missionNamespace setVariable ["FG2_DCP_initialized", true];

diag_log "[FG2][DCP] Initializing addon server protection.";


FG2_DCP_handleDisconnectEH = addMissionEventHandler [
	"HandleDisconnect",
	{
		_this call FG2_DCP_fnc_handleDisconnect;
	}
];

FG2_DCP_onUserSelectedPlayerEH = addMissionEventHandler [
	"OnUserSelectedPlayer",
	{
		_this call FG2_DCP_fnc_handleUserSelectedPlayer;
	}
];

diag_log format [
	"[FG2][DCP] Addon initialized. HandleDisconnectEH=%1 OnUserSelectedPlayerEH=%2",
	FG2_DCP_handleDisconnectEH,
	FG2_DCP_onUserSelectedPlayerEH
];