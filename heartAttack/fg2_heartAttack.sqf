/*
	File:			fg2_heartAttack.sqf
				In einen Ordner namens "scripts" packen
	InitPlayerLocal:	Per Skript:
				nul = [player] execVM "scripts\fg2_heartAttack.sqf";
				Selbstinteraktion an Spieler:
				a0 = ["Herzinfarkt","Herzinfarkt starten","", {[player]execVM "scripts\fg2_heartAttack.sqf"}, {true}] call ace_interact_menu_fnc_createAction;
				[player, 1, ["ACE_SelfActions"], a0] call ace_interact_menu_fnc_addActionToObject;
	Author:			l4ndl0rd
	Version:        	0.0.2
	Date:           	2022/09/06
*/

//Make sure the player is a player
if (!isServer && (player != player)) then
{
	waitUntil { player == player };
	waitUntil { time > 0 };
};

private ["_caller"];
_caller = _this select 0;

//Remove selfinteraction
[_caller, 1, ["ACE_SelfActions", "Herzinfarkt"]] call ace_interact_menu_fnc_removeActionFromObject;

//Random trigger time - 1 to 3 minutes, can be adjusted
sleep (60 + random 120);

//hint for player
hint "Du spürst plätzlich einen stechenden Schmerz in der Brust. Dir bleibt die Luft weg und der linke Arm fühlt sich merkwürdig an.";
sleep 0.5;

//Set pain level
[_caller, 0.95] call ace_medical_fnc_adjustPainLevel;
sleep (60 + random 180); //1 to 4 minutes delay

//Make unit go unconscious
[_caller, true] call ace_medical_fnc_setUnconscious;
sleep 0.5;

//Stop the heart
[_caller] call ace_medical_statemachine_fnc_enteredStateCardiacArrest;
sleep (240 + random 120);

//50:50 chance of survival
fg2_patientstate = selectRandom ["survive", "death"];
publicVariable "fg2_patientstate";

switch (fg2_patientstate) do
{
	case "survive":								//YAY
	{
		[_caller] call ace_medical_statemachine_fnc_leftStateCardiacArrest;
	};
	case "death": 								//NAY
	{
		_caller setDamage 1;
	};
};
