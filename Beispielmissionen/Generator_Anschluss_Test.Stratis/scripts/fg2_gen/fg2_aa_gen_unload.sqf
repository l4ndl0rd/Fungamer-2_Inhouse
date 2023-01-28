/*
	File:			fg2_aa_gen_unload.sqf
	Init:			nul = [Fahrzeugname, Generatorname 1, Generatorname 2] execVM "scripts\fg2_gen\fg2_aa_gen_unload.sqf";
	Author:			CanisLupus & l4ndl0rd
*/

_lkw = _this select 0;
_gen_1 = _this select 1;
_gen_2 = _this select 2;
_index = _this select 3;

numGen = [0, 0];

a0 = _lkw addAction ["Generator abladen", "scripts\fg2_gen\fg2_check_engine.sqf", [_gen_1, _gen_2, _index], 1.5, false, false,"", "_this == driver _target", -1]; //Erklärung der Parameter siehe unten


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* 
[
"Was soll in der AddAction stehen", 
"Verweise auf andere Scripte?", 
Argumente die an das Script weitergeleitet werden, 
Priorität (0 - 6, Standard 1.5), 
Anzeige auf Objekt, 
AddAction wird bei Benutzen versteckt (scheint aber nicht zu funktionieren),
Abkürzung? siehe Wiki, 
"Bedingung (z.B. Bindung an bestimmten Spieler)", 
Entfernung zum Objekt in Metern
];
*/
