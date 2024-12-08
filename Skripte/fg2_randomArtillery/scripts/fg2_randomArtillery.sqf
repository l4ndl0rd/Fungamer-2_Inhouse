/*
	File:		fg2_randomArtillery.sqf
				put in a folder called "scripts" in mission directory
	Init:		either put into the init of the artillery unit:
				nul = [this, s1, 40, 10, 50] execVM "scripts\fg2_randomArtillery.sqf";
				or:
				nul = [m1, s1, 40, 10, 50] execVM "scripts\fg2_randomArtillery.sqf";
				into the "On Activation"-Box of a trigger
	___________________________________________________________________________
	Parameters:
	this/m1 => unit that is supposed to fire
	s1 => variablename of the target
	40 => ammocount (default: 10)
	10 => time between shots (default: 5)
	50 => radius around target (default: 100)
	___________________________________________________________________________
	Author:l4ndl0rd
	Version:0.0.5
	date:08/12/2024
*/

if (!isServer) exitWith {};

params ["_arty", "_target", "_rounds", "_pause", "_radius", "_ammoArty", "_tgt"];
_rounds = param [2, 10, [0]];
_pause = param [3, 5, [0]];
_radius = param [4, 100, [0]];								
_ammoArty = getArtilleryAmmo [_arty] select 0;				//get the round that is fired

while { _rounds > 0 } do {
	_tgt = [[[position _target, _radius]], []] call BIS_fnc_randomPos;
	_arty setVehicleAmmo 1;
	_arty doArtilleryFire [_tgt, _ammoArty, 1];
	/*debug
		hint "Shot Fired";
	*/
	_rounds = _rounds - 1;
	sleep _pause;
};
