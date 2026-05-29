/*
    FG2 Client View Distance
    PostInit
*/

if (!hasInterface) exitWith {};

[] spawn {
    waitUntil { !isNull findDisplay 46 };

    // ESC menu button watcher immediately.
    [] spawn {
        while {true} do {
            [] call FG2_CVD_fnc_attachPauseButton;
            uiSleep 0.20;
        };
    };

    // ACE self interaction as early as possible.
    [] spawn {
        waitUntil {
            !isNil "ace_interact_menu_fnc_createAction" &&
            {!isNil "ace_interact_menu_fnc_addActionToClass"}
        };

        [] call FG2_CVD_fnc_addAceSelfInteraction;
    };

    // Apply after MP init fallback.
    [] spawn {
        sleep 5;
        [] call FG2_CVD_fnc_apply;
    };

    // Re-apply after respawn.
    waitUntil { !isNull player };

    player addEventHandler ["Respawn", {
        [] spawn {
            sleep 1;
            [] call FG2_CVD_fnc_apply;
        };
    }];
};