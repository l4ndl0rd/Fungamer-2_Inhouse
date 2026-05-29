/*
	File:		fn_setVariable.sqf
	Author:     Shepard
	Version:    0.2
	Date:       08/11/2025

    Notes:      Tracking System soll nur auf dem Server und nacheinander ausgeführt werden, dieses Script sorgt dafür, 
                dass die Abfragen nacheinander abgearbeitet werden - Failsafe für den unwahrscheinlichen Fall, dass zwei 
                Spieler gleichzeitig die Abfrage an den Server senden.
*/

params ["_name","_value"];
_temp = missionNamespace getVariable [_name,[]];
_temp append _value;
missionNamespace setVariable [_name, _temp];
