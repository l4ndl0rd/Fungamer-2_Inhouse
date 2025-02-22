/*
	File:					spawnEnemiesNear.sqf
	
	InitServer:				missionNamespace setVariable ["allowSpawn", false, true];
							[] execVM "scripts\spawnEnemiesNear.sqf";

	Trigger onActivation:	At the end of the file
							Starting in line 110 - change the enemy array to your needs

	Author:					Shepard
	Last update:          	20/02/2025
	Description:          	Spawns Infantry randomly around a random player and makes them chase them
*/

SHP_fnc_spawnEnemiesNearby = {
	params ["_minRadius","_maxRadius","_amount", "_sideToSpawnIn", "_unitsToChooseFrom", "_packSize","_spawnOnlyFullPack","_maxDistanceBeforeDeletion"];
	/*
		_minRadius = Minimum Radius to spawn units away from
		_maxRadius = Maximum Radius to spawn enemies in
		_amount = Amount of units to spawn at once
		_sideToSpawnIn = Side to spawn units on
		_packSize = Size of Groups to be spawned at once
		_spawnOnlyFullPack = Should only groups of _packsize spawn? Can be true or false
	
	*/
	_spawnedUnits = [];
	
	//Condition to enable/disable spawning to your liking
	while {missionNamespace getVariable ["allowSpawn",false]} do {
		//Check for all units that are still alive
		_spawnedUnitsStillAlive = [];
		{	
			if (alive _x) then {
				_spawnedUnitsStillAlive pushBack _x;
			};
			
		} forEach _spawnedUnits;
		
		//Check for all units that are too far away
		{
			_unit = _x;
			_tooFar = true;
			{
				if ((_unit distance _x) < _maxDistanceBeforeDeletion) exitWith {
					_tooFar = false;
				};
			} forEach allPlayers;
			
			if (_tooFar) then {
				deleteVehicle _unit;
			};
		} forEach _spawnedUnitsStillAlive;
		
		//If still room to spawn AI
		if ((count _spawnedUnitsStillAlive) < _amount) then {
			
			//Search around a random player
			_playerToSpawnAround = selectRandom(allPlayers);
			_positionToSpawnIn = [];
			_positionFound = false;
			//Recalculate new position as long as no suitable one is found
			while {! _positionFound} do {
				_distance = (random (_maxRadius - _minRadius) + _minRadius);
				_positionToSpawnIn = [getPos _playerToSpawnAround, _minRadius, _maxRadius, 3, 0, 10, 0, [], []] call BIS_fnc_findSafePos;
				_positionFound = true;
				_allPlayerEyePos = [];
				
				//Check if any player can fire at position
				{
					if((([objNull,"FIRE"] checkVisibility [eyePos _x, _positionToSpawnIn]) != 0) or (_x distance _positionToSpawnIn < _minRadius)) then {
						_positionFound = false;
					};		
				} forEach allPlayers;
			};
			
			//Spawn a group of enemies of desired size
			_realPackSize = _packSize;
			if (!_spawnOnlyFullPack) then {
				_realPackSize = random (_packSize - 1) + 1;
			};
			
			_unitsToSpawn = [];
			for "_i" from 1 to _realPackSize do {
				_unitsToSpawn pushBack (selectRandom _unitsToChooseFrom);
			};
			
			_grp = [_positionToSpawnIn, _sideToSpawnIn, _unitsToSpawn] call BIS_fnc_spawnGroup;
			
			_spawnedUnits append (units _grp);
			
			_stalked = (group (selectRandom allPlayers));
			_refreshStalk = 15;
			_radiusStalk = 50;
			
			//DeleteGroupWhenEmpty and stalk playerss group
			_grp deleteGroupWhenEmpty true;
			[_grp, _stalked, _refreshStalk, _radiusStalk] spawn BIS_fnc_stalk;
			
		};
		sleep 5;
	};
};

//params = ["_minRadius","_maxRadius","_amount", "_side", "_units", "_packSize","_spawnOnlyFullPack","_maxDistanceBeforeDeletion"];
/*
===== TRIGGER CODE STARTS HERE: =====

missionNamespace setVariable ["allowSpawn", true, true];

_units = 
[ 
 "rhs_vdv_flora_sergeant", 
 "rhs_vdv_flora_junior_sergeant", 
 "rhs_vdv_flora_grenadier", 
 "rhs_vdv_flora_rifleman", 
 "rhs_vdv_flora_machinegunner", 
 "rhs_vdv_flora_at", 
 "rhs_vdv_flora_strelok_rpg_assist", 
 "rhs_vdv_flora_medic" 
]; 
 
[800,1200,30,east,_units, 6, false, 1500] spawn SHP_fnc_spawnEnemiesNearby;
*/