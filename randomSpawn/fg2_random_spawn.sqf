/*
	File:			fg2_random_spawn.sqf
	Init:			[] execVM "scripts\randomspawn.sqf" in die >>>init.sqf<<<
	Author:			l4ndl0rd
*/

_player = player;
_randompos = [nil, ["water"]] call BIS_fnc_randomPos; // erster Parameter Whitelist, zweiter Parameter Blacklist

if (!isServer && (player != player)) then
{
	waitUntil { player == player };
	waitUntil { time > 0 };
};

_startingpos = _player setPosATL _randompos;