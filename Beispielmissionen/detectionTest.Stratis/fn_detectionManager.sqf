/*
	File:		fn_detectionManager.sqf
				
	Author:		Shepard
	Version:	0.2
	Date:		08/11/2025

	Notes:		Reset des Status, falls die entdeckenden Gegner ausgeschaltet wurden.
*/

_detectionTimeLimit = ["TimeToCallInContact",20] call BIS_fnc_getParamValue;
_detectionID = 0;
_checkedDetections = [];
_alarmTriggered = missionNamespace getVariable ["alarmTriggered", false];

{
	_x setCombatMode "BLUE";
} forEach groups EAST;


while {!_alarmTriggered} do {
	_IDsToRemove = [];
	_helperArray = [];
	_responses = missionNamespace getVariable ["detectionEndedResponse",[]];
	missionNamespace setVariable ["detectionEndedResponse",[]];
	_preCount = count _checkedDetections;
	{
		_ID = (_x select 0);
		_newEnemiesKnowing = (_x select 1);
		if (count(_newEnemiesKnowing) != 0) then {
			{
				if ((_x select 3) == _ID) then {
					_x set [1,_newEnemiesKnowing];
				};
			}forEach _checkedDetections;
		} else {
			_IDsToRemove pushBack _ID;
		};

	}forEach _responses;

	{
		if (_IDsToRemove find (_x select 3) == -1) then {
			_helperArray pushBack _x;
		}
	}forEach _checkedDetections;
	//hint str(_helperArray);
	_checkedDetections = _helperArray;

	_newDetections = missionNamespace getVariable ["newDetection",[]];
	missionNamespace setVariable ["newDetection",[]];
	{
		//hint str(_x);
		_x pushBack _detectionID;
		_detectionID = _detectionID + 1;
		_checkedDetections pushBack _x;
	}forEach _newDetections;
	
	_postCount = count _checkedDetections;

	if (_preCount == 0 && _postCount > 0) then {
		"Ich glaube Wir wurden entdeckt!" remoteExec["hint",0];
	};
	if (_preCount > 0 && _postCount == 0) then {
		"Puh, das war knapp!" remoteExec["hint",0];
		{
			_grp = _x;
			{	
				_grp forgetTarget _x;
			}forEach allPlayers;
		}forEach groups East;
	};

	//hint str(_checkedDetections);

	{
		_player = (_x select 0);
		_knowingEnemies = (_x select 1);
		_timeOfDetection = (_x select 2);
		_ID = _x select 3;
		_newAlives = [];
		if ((serverTime - _timeOfDetection) > _detectionTimeLimit) then {
			_alarmTriggered = true;
			[missionNamespace,["alarmTriggered", [_player, _knowingEnemies, _timeOfDetection]]]remoteExec["setVariable",-2];
			"Das Team wurde entdeckt! In 2 Minuten wird die erste Geisel hingerichtet!" remoteExec["hint",0];
			{
				_unit = _x;
				{
					_unit reveal [_x, 4];
				} forEach allPlayers;
			} forEach units EAST;

			{
				_x setCombatMode "RED";
			} forEach groups EAST;

			//TODO: Geiseln toeten

		};

		{
			if (alive _x) then{
				_newAlives pushBack _x;
			}
		}forEach _knowingEnemies;

		if (count(_newAlives) == 0) then {
			[missionNamespace, ["detectionEndedRequestID", _ID]]remoteExec["setVariable",_player];
		}
	}forEach _checkedDetections;
	sleep 2;
}