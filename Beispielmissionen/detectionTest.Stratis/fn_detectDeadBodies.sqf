[] spawn {
	_deadBodyDetectionDistance = ["DeadBodyDetectionDistance",20] call BIS_fnc_getParamValue;


	{
		_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			db = missionNamespace getVariable ["deadBodysToCheck",[]];
			db pushBack _unit;
			missionNamespace setVariable ["deadBodysToCheck",db];
		}];
		
	} forEach units EAST;


	while {! (missionNamespace getVariable ["alarmTriggered", false])} do {
		{
			_dead = _x;
			{
				if ((((_dead distance _x) < _deadBodyDetectionDistance)) && (([objNull, "VIEW"] checkVisibility [eyePos _dead, eyePos _x]) > 0.2)) then {
					_timeOfDetection = serverTime;
					_rd = _x getVariable ["reportedDead",[]];
					if !(_dead in _rd) then {
						["newDetection", [[2, [_x], _timeOfDetection]]]remoteExec["fn_setVariable",2];
						_rd pushBackUnique _dead;
						_x setVariable ["reportedDead",_rd]
					};
				};
				
			} forEach units EAST;
			_derID = missionNamespace getVariable ["detectionEndedRequestID",-1];
			if !(_derID == -1) then {
				["detectionEndedResponse", [[_derID, []]]]remoteExec["fn_setVariable",2];
				missionNamespace setVariable ["detectionEndedRequestID",-1];
			};
		} forEach (missionNamespace getVariable ["deadBodysToCheck",[]]); 
		sleep 1;
	};
}; 