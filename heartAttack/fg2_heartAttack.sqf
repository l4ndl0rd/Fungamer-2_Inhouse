/*
	File:			fg2_heartAttack.sqf
	InitPlayerLocal:	nul = [player] execVM "scripts\fg2_heartAttack.sqf";
				Selbstinteraktion an civ1:
				a0 = ["Herzinfarkt","Herzinfarkt starten","", {[player]execVM "scripts\fg2_heartAttack.sqf"}, {true}] call ace_interact_menu_fnc_createAction;
				[name of unit, 1, ["ACE_SelfActions"], a0] call ace_interact_menu_fnc_addActionToObject;
	Author:			l4ndl0rd
	Version:        	0.0.1
	Date:           	2021/01/15
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

//Random trigger time
sleep (60 + random 120);

//Set Damage to torso
[_caller, 0.11, "Body", "punch"] call ace_medical_fnc_addDamageToUnit;
sleep 0.5;
//Set pain level
[_caller, 0.95] call ace_medical_fnc_adjustPainLevel;
sleep (60 + random 120);
//Make unit go unconscious
[_caller, true] call ace_medical_fnc_setUnconscious;
sleep 0.5;
//Stop the heart
[_caller] call ace_medical_statemachine_fnc_enteredStateCardiacArrest;
sleep (240 + random 120);

//50:50 chance of survival
patientstate = selectRandom ["survive", "death"];
publicVariable "patientstate";

switch (patientstate) do
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
