/*
	File:		fn_resetDetection.sqf
				
	Author:		Shepard
	Version:	0.2
	Date:		08/11/2025

	Notes:		Reset des Status, falls die entdeckenden Gegner ausgeschaltet wurden.
*/


currentDetection = compile preprocessFile "fn_currentDetections.sqf"
params["_ourPlayer"];

_radiusPlayerDetected = ["RadiusDetected",100] call BIS_fnc_getParamValue;
_alarmTriggered = missionNamespace getVariable ["alarmTriggered", false];

while{!_alarmTriggered} do{
	_detectionEndedRequestID = missionNamespace getVariable ["detectionEndedRequestID", -1]
	if(_detectionEndedRequest != -1) then {
			_knowingEnemies = [_ourPlayer,_radiusPlayerDetected] call currentDetection;
			["detectionEndedResponse", [_detectionEndedRequestID, _knowingEnemies]]remoteExecCall[fn_setVariable,2];
		}
	_alarmTriggered = missionNamespace getVariable ["alarmTriggered", false];
	sleep 1;
}