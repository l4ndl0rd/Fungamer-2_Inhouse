// Starte das Detection System
fn_setVariable = compile preprocessFile "fn_setVariable.sqf";
if isServer then{
	[] execVM "fn_detectionManager.sqf";
	[] execVM "fn_detectDeadBodies.sqf";
	//[player] execVM "fn_detected.sqf"; 		// Nur im lokalen Multiplayer oder Singleplayer nötig, um die Scripte zu testen
}else {
	[player] execVM "fn_detected.sqf";
};

