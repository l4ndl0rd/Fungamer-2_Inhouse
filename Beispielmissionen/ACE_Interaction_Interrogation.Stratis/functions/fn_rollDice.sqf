/*
	File:		fn_rollDice.sqf
				In einen Ordner namens "functions" packen
	
	Prereq:		In der description.ext als Funktion definieren:

				class CfgFunctions
				{
					class FG2
					{
						tag = "FG2";
						class customInteractions {
							file = "functions";
								
							class rollDice {};
						};
					};
				};

	Init:		call FG2_fnc_rollDice
	Author:		l4ndl0rd
	Version:	0.1
	Date:		29/11/2024
*/

_possibleResults = [1, 2]; 							//Keine Strings, sonst Fehler kann theoretisch beliebig erweitert werden

fg2_rollResult = selectRandom _possibleResults; 	//Zufällig aus Array ein Resultat erwürfeln
fg2_rollResult;										//Return Value, der zurück an die fg2_interrogate.sqf geschickt wird
