/*
	File:			fg2_check_engine.sqf
	Author:			CanisLupus & l4ndl0rd
*/
//hint str _this; // Debug

_lkw = _this select 0;
_array = _this select 3; // Parameter, der über addAction (fg2_aa_gen_unload.sqf) weitergegeben wird.

_index = _array select 2; // Index des LKW in dem wir uns befinden.
_numGen = numGen select _index; // Anzahl der bereits abgeladenen Generatoren. (Von *diesem* LKW)
_gen = _array select _numGen; // Der nächste abzuladene Generator.

if ( (speed _lkw > 0.01) or (isEngineOn _lkw) ) then 
{
	_lkw vehicleChat "Zum Entladen bitte anhalten und den Motor ausschalten";
	uiSleep 10
} else {
	//Abladen des Generators
	_lkw vehicleChat "Generator wird abgeladen";
	sleep 3;
	detach _gen;
	_gen attachTo [_lkw, [2,0,-1]];
	sleep 1;
	detach _gen;
	_gen setDir getDir _lkw;
	_lkw vehicleChat "Generator abgeladen";
	
	numGen set [_index, _numGen+1];
	if (_numGen == 1) then // Hier Anzahl der Generatoren-1
	{
		// Wenn der letzte Generator abgeladen ist
		_lkw removeAction a0;
	}
};

/*
//Sollte Sound gewünscht werden, dann hier hinzufügen
playMusic "Titelname";
*/

