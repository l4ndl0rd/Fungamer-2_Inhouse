/*
	File:		fg2_randomArtillery.sqf
				In einen Ordner namens "scripts" packen
	Init:		In die Init der Einheit, die feuern soll
				nul = [this, s1, 40, 10, 50] execVM "scripts\fg2_randomArtillery.sqf";
				this => die konkrete Einheit, die feuern soll (Mörser, Artillery oder was auch immer)
				s1 => Variablenname der Einheit auf die gefeuert werden soll
				40 => Zahl der Muni, die das Geschütz haben soll (Default: 10)
				10 => Sekunden zwischen den Schüssen (Default: 5)
				50 => Radius um das Ziel herum (Default: 100)
	Author:		l4ndl0rd
	Version:    0.0.2
	Date:       23/01/2023
*/

if (!isDedicated) exitWith {};

private ["_arty", "_target", "_rounds","_pause", "_radius", "_ammo", "_tgt"];
_arty = _this select 0;
_target = _this select 1;
_rounds = param [2, 10, [0]];
_pause = param [3, 5, [0]];
_radius = param [4, 100, [0]];
_ammo = getArtilleryAmmo [_arty] select 0; 


while {_rounds >0} do {
	_tgt = [[[position _target, _radius]], []] call BIS_fnc_randomPos;
	_arty setVehicleAmmo 1;
	_arty doArtilleryFire[_tgt, _ammo, 1]; 
	/*debug
	hint "Shot Fired";
	*/
	_rounds = _rounds - 1; 
	sleep _pause;
};