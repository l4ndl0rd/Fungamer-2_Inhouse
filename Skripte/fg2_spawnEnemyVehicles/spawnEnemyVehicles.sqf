/*
	File:					spawnEnemyVehicles.sqf
	
	InitServer:				missionNamespace setVariable ["allowSpawn", false, true];
							[] execVM "scripts\spawnEnemyVehicles.sqf";

	Trigger onActivation:	At the end of the file
							Starting in line 112 - change the vehicle array to your needs
	
	Author:					Shepard
	Modified:				l4ndl0rd
	
	Last update:          	20/02/2025
	Description:          	Spawns Vehicles randomly around the player
*/

SHP_fnc_spawnEnemyVehicles = {
		params ["_minRadius","_maxRadius","_amount","_sideToSpawnIn","_maxVehiclesToSpawn","_vehiclesToChooseFrom","_maxDistanceBeforeDeletion"];
	/*
		_minRadius = Minimum Radius to spawn units away from
		_maxRadius = Maximum Radius to spawn enemies in
		_amount = Amount of units to spawn
		_sideToSpawnIn = Side to spawn units on
		_maxVehicles = How many vehicles per group
	
	*/
	spawnedVehicles = [];
	
	//Condition to enable/disable spawning to your liking
	while {missionNamespace getVariable ["allowSpawn",false]} do {
		//Check for all units that are still alive
		_spawnedVehiclesStillAlive = [];
		{	
			if (alive _x) then {
				_spawnedVehiclesStillAlive pushBack _x;
			};
			
		} forEach spawnedVehicles;

		//Check for all units that are too far away
		{
			_vehicle = _x;
			_tooFar = true;
			{
				if ((_vehicle distance _x) < _maxDistanceBeforeDeletion) exitWith {
					_tooFar = false;
				};
			} forEach allPlayers;
			
			if (_tooFar) then {
				{_vehicle deleteVehicleCrew _x} forEach crew _vehicle;
				deleteVehicle _vehicle;
			};
		} forEach _spawnedVehiclesStillAlive;

		//If still room to spawn AI
		if ((count _spawnedVehiclesStillAlive) < _amount) then {
			
			//Search around a random player
			_playerToSpawnAround = selectRandom(allPlayers);
			_positionToSpawnIn = [];
			_positionFound = false;
			//Recalculate new position as long as no suitable one is found
			while {! _positionFound} do {
				_distance = (random (_maxRadius - _minRadius) + _minRadius);
				//_positionToSpawnIn = [center, minDist, maxDist, objDist, waterMode, maxGrad, shoreMode, blacklistPos, defaultPos] call BIS_fnc_findSafePos
				_positionToSpawnIn = [getPos _playerToSpawnAround, _minRadius, _maxRadius, 0, 0, 5, 0, [], []] call BIS_fnc_findSafePos;
				_positionFound = true;
				_allPlayerEyePos = [];
				
				//Check if any player can fire at position
				{
					if((([objNull,"FIRE"] checkVisibility [eyePos _x, _positionToSpawnIn]) != 0) or (_x distance _positionToSpawnIn < _minRadius)) then {
						_positionFound = false;
					};		
				} forEach allPlayers;
			};
			
			//Spawn an enemy vehicle
			_vehicleToSpawn = selectRandom _vehiclesToChooseFrom;

			_veh = [_positionToSpawnIn, 0, _vehicleToSpawn, _sideToSpawnIn] call BIS_fnc_spawnVehicle;
			
			//Make spawned vehicle, crew and the group available
			_spawnedVehicle = _veh# 0;
			_spawnedVehicleCrew = _veh# 1;
			_spawnedVehicleGroup = _veh# 2;
			
			//Push spawned vehicle into our vehicles array
			spawnedVehicles pushBack _spawnedVehicle;
			
			//Select stalked player
			_stalked = (group (selectRandom allPlayers));
			
			//Set Time between the waypoint updates and the radius
			_refreshStalk = 15;
			_radiusStalk = 50;
			
			//DeleteGroupWhenEmpty and stalk playerss group
			_spawnedVehicleGroup deleteGroupWhenEmpty true;
			[_spawnedVehicleGroup, _stalked, _refreshStalk, _radiusStalk] spawn BIS_fnc_stalk;
			
		};
		sleep 5;
	};	
};

//params = ["_minRadius","_maxRadius","_amount","_sideToSpawnIn","_maxVehiclesToSpawn","_vehiclesToChooseFrom","_maxDistanceBeforeDeletion"];
/*
===== TRIGGER CODE STARTS HERE: =====

missionNamespace setVariable ["allowSpawn", true, true];

_vehicles =   
[   
 "rhs_btr80_vdv",  
 "rhs_bmp2_vdv",  
 "rhsgref_BRDM2_vdv",  
 "rhsgref_BRDM2_vdv",  
 "rhs_tigr_m_vdv",  
 "rhs_tigr_m_vdv",  
 "rhsgref_cdf_reg_uaz_dshkm",  
 "rhsgref_cdf_reg_uaz_dshkm" 
];  
 
[800,1200,3,east,1,_vehicles, 1500] spawn SHP_fnc_spawnEnemyVehicles;
*/