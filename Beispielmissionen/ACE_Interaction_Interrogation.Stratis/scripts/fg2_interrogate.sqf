/*
	File:		fg2_interrogate.sqf
				In einen Ordner namens "scripts" packen
	
	Prereq:		Funktion FG2_fnc_rollDice muss exisitieren
	
	Init:		in die init.sqf der Mission:
				[variablenname] execVM "scripts\fg2_interrogate.sqf";
	
				Oder in die Init der Einheit:
				[this] execVM "scripts\fg2_interrogate.sqf";

				UND in die Init unserer Einheit:
				this setVariable ["fg2_Action_executed", false, true];
				
	Authors:l4ndl0rd, Shepard
	Version:0.1
	date:29/11/2024
*/

// ACE_Actions and ACE_SelfActions can be added via config or by calling functions. Be aware that the functions modify the UI, and therefore need to be executed on client-side to take effect.
if !(hasInterface) exitWith {};

params ["_ourPriest"];// Make param available in script

// Scheduled environment else suspension-issues
[_ourpriest] spawn {
	params ["_ourPriest"]; // Make param available in scope

	// Create main action (what we see, when we open the interaction menu)
	_action0 = ["Verhandeln", "Verhandeln", "", {}, {
		true
	}] call ace_interact_menu_fnc_createAction;
	// Add action to our unit
	[_ourPriest, 0, ["ACE_MainActions"], _action0] call ace_interact_menu_fnc_addActionToObject;

	// Create option 1 as child of the above main action and add it to our unit
	_action1 = // ActionID
	[
		"Obstkörbe_anbieten", // action name <STRING>
		"Obstkörbe anbieten", // name of the action shown in the menu <STRING>
		"", // Icon <STRING>
		// Statement <CODE>
		{
			call FG2_fnc_rollDice; // call function
			// Depending on result, do this
			switch (fg2_rollResult) do {
				case 1: {
					missionNamespace setVariable ["convinced", true, true];
				};
				case 2: {
					missionNamespace setVariable ["notconvinced", true, true];
				};
				// Failsafe (should never happen)
				default {
					hint "Something went terribly wrong!"
				};
			};
			_target setVariable ["fg2_Action_executed", true, true]; // set executed-variable to true and broadcast to all clients so that the action can be removed on all of them
		},
		// Condition <CODE>
		{
			!(_target getVariable ["fg2_Action_executed", false]); // Only show action before it has been executed
		}
	] call ace_interact_menu_fnc_createAction;
	[_ourPriest, 0, ["ACE_MainActions", "Verhandeln"], _action1] call ace_interact_menu_fnc_addActionToObject;

	// Create option 2 as child of the above main action and add it to our unit
	_action2 = // ActionID
	[
		"Gleichberechtigung_anbieten", // action name <STRING>
		"Gleichberechtigung anbieten", // name of the action shown in the menu <STRING>
		"", // Icon <STRING>
		// Statement <CODE>
		{
			call FG2_fnc_rollDice;// call function
			// Depending on result, do this
			switch (fg2_rollResult) do {
				case 1: {
					missionNamespace setVariable ["convinced", true, true];
				};
				case 2: {
					missionNamespace setVariable ["notconvinced", true, true];
				};
				// Failsafe (should never happen)
				default {
					hint "Something went terribly wrong!"
				};
			};
			_target setVariable ["fg2_Action_executed", true, true]; // set executed-variable to true and broadcast to all clients so that the action can be removed on all of them
		},
		// Condition <CODE>
		{
			!(_target getVariable ["fg2_Action_executed", false]); // Only show action before it has been executed
		}
	] call ace_interact_menu_fnc_createAction;
	[_ourPriest, 0, ["ACE_MainActions", "Verhandeln"], _action2] call ace_interact_menu_fnc_addActionToObject;
};