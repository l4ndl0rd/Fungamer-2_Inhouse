/*
	File:				fg2_checkVehicleTurret.sqf
	How To Use:			Place script in scripts folder in mission directory.
                        Place trigger with area in the mission.
                        ////////////////////////////////////////////////////
                        Set Trigger to:
                        
                        Type:               None
                        Activation:         AnyPlayer
                        Activation Type:    Present

                        Check Repeatable if the trigger is supposed to work more than once
                                        
                        Condition:          this
                        On Activation:      Call script via execVM.
                                            Make sure to pass the class of the vehicle to be checked to the script as parameter.
                                        
                        For example:        typeOf (vehicle player) 
                                            ==> This will return the class of the vehicle the player is currently in and pass it to BIS function
                        ////////////////////////////////////////////////////
                        Full Example:       [typeOf (vehicle player)] execVM "scripts\fg2_checkVehicleTurret.sqf";
                        ////////////////////////////////////////////////////
    Notes:              Does only work for ground vehicles!
	Author:				l4ndl0rd
    Version:            0.0.1
    Date:               2025/06/02
*/
// === Initialize params ===
params ["_playerVic", "_runCheck"];

// === Determine what to do based on the turretNumber of the vehicle ===
_runCheck = switch (true) do {
    case ([_playerVic] call BIS_fnc_allTurrets isEqualTo []) : {
        hint "This vehicle has no turret!";
    };
    case ([_playerVic] call BIS_fnc_allTurrets isNotEqualTo []) : {
        hint "This vehicle does have a turret!";
    };
    default { hint "default"};
};
