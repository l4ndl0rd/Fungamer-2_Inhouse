/*
	File:			fg2_generator_hookup.sqf
	Init:			nul = [] execVM "scripts\fg2_gen\fg2_generator_hookup.sqf";
	Author:			l4ndl0rd
*/

_object = _this select 0;

a1 = _object addAction ["Anschlüsse überprüfen", "scripts\fg2_gen\fg2_gen_check.sqf", nil, 1.5, false, true,"", "_this == s1", 3]; //Erklärung der Parameter siehe unten

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
