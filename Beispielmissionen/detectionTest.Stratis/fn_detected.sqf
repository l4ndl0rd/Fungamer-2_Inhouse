fn_detection = compile preprocessFile "fn_currentDetections.sqf";

params["_ourPlayer"];
_radiusPlayerDetected = ["RadiusDetected",100] call BIS_fnc_getParamValue;
_isDetected = missionNamespace getVariable ["isDetected", false];
while{alive player && !(missionNamespace getVariable ["alarmTriggered",false])} do {
	_isDetected = missionNamespace getVariable ["isDetected", false];
	//hint str(_isDetected);
	if !_isDetected then {
		_knowingEnemies = ([_ourPlayer,_radiusPlayerDetected] call fn_detection);
		if !((count _knowingEnemies) == 0) then {
			missionNamespace setVariable ["isDetected", true];
			_timeOfDetection = serverTime;
			if !_isDetected then {
				_playerID = clientOwner;
				["newDetection", [[_playerID, _knowingEnemies, _timeOfDetection]]]remoteExec["fn_setVariable",2];
			};
		};
	} else {
		_derID = missionNamespace getVariable ["detectionEndedRequestID",-1];
		if !(_derID == -1) then {
			_knowingEnemies = ([_ourPlayer,_radiusPlayerDetected] call fn_detection);
			if (count(_knowingEnemies) == 0) then {
				_isDetected = false;
			};
			["detectionEndedResponse", [[_derID, _knowingEnemies]]]remoteExec["fn_setVariable",2];
			missionNamespace setVariable ["detectionEndedRequestID",-1];
			
		};
	};
	sleep 2;
}