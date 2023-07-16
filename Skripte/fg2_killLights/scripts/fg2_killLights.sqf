/*
	File:		fg2_killLights.sqf
				In einen Ordner namens "scripts" packen
	Prereq:		Logic (Systems > LogicEntities > Objects > Game Logic) auf der Map im Bereich um den herum die Lichter 
				ausgeschaltet werden sollen platzieren und Variablennamen vergeben
	Init:		Wenn die Lichter von Anbeginn an ausgeschaltet sein sollen:

				In eine initServer.sqf:

				[Variablenname, Radius] execVM "scripts\fg2_killLights.sqf";
				
				Alternativ ist auch ein normaler Aufruf per Trigger über den Befehl möglich.
	_______________________________________________________________________________________________________________________________
	Parameter:	Variablenname 	=>	 Name der Spiellogik 
									(könnte auch durch einen Spieler oder ein Objekt, wie z.B.  einen Generator ersetzt werden)
				Radius			=>	in Metern - optional (Default 20000) - in diesem Bereich werden die Lichter abgeschaltet ohne
									diesen Parameter werden auf der ganzen Karte die Lichter ausgeschaltet, wenn die Map nicht 
									größer ist.
	_______________________________________________________________________________________________________________________________
	Author:		l4ndl0rd
	Version:	0.1
	Date:		16/07/2023
*/

if !(hasInterface) exitWith {}; 								/* Lights are shut down locally, so running this anywhere other 
																than the players computers would not make any sense */

params ["_killCenter", "_killRadius"];
_killCenter = _this select 0;
_killRadius = param [1, 20000];

//////////////////////////////////// DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING //////////////////////////////////////////
{
	if (_x distance _killCenter <= _killRadius) then {			// Check radius	
	_x switchLight "OFF"										// Lights out
	};


} forEach (63 allObjects 0);									// (63 allObjects 0) is all lamps on the map