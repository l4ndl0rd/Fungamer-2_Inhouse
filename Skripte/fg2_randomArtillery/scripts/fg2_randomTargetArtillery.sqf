/*
	File:		fg2_randomTargetArtillery.sqf
				put in a folder called "scripts" in mission directory
	Init:		either put into the init of the artillery unit:
				nul = [this, 40, 10, 50] execVM "scripts\fg2_randomTargetArtillery.sqf";
				or:
				nul = [m1, 40, 10, 50] execVM "scripts\fg2_randomTargetArtillery.sqf";
				into the "On Activation"-Box of a trigger
	___________________________________________________________________________
	Parameters:
	this/m1 => unit that is supposed to fire
	40 => ammocount (default: 10)
	10 => time between shots (default: 5)
	50 => radius around target (default: 100)
	___________________________________________________________________________
	Author:l4ndl0rd
	Version:0.0.1
	date:01/02/2026
*/

if (!isServer) exitWith {};

params ["_arty", "_rounds", "_pause", "_radius", "_allPlayers", "_randomTarget", "_ammoArty", "_tgt"];
_rounds = param [1, 10, [0]];
_pause = param [2, 5, [0]];
_radius = param [3, 100, [0]];
_allPlayers = call BIS_fnc_listPlayers;						// Get a list of all players that are connected to the mission
_randomTarget = selectRandom _allPlayers;					// Select a random player as target				
_ammoArty = getArtilleryAmmo [_arty] select 0;				// Get the round that is fired

while { _rounds > 0 } do {
	_tgt = [[[position _randomTarget, _radius]], []] call BIS_fnc_randomPos;
	_arty setVehicleAmmo 1;
	_arty doArtilleryFire [_tgt, _ammoArty, 1];
	/*debug
		hint "Shot Fired";
	*/
	_rounds = _rounds - 1;
	sleep _pause;
};
