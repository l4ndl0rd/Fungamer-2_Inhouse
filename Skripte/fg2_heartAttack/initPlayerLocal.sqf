
a1 = ["Herzinfarkt","Herzinfarkt starten","", {[player]execVM "scripts\fg2_heartAttack.sqf"}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], a1] call ace_interact_menu_fnc_addActionToObject;
