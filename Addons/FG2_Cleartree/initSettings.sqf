/*
    ClearTree CBA Settings

    Scope:
    - TREE
    - SMALL TREE
    - no BUSH
    - no grass / clutter cutting
    - contextual ACE self interaction
*/

missionNamespace setVariable ["ClearTree_types", ["TREE", "SMALL TREE"], true];

[
    "ClearTree_requireAxe",
    "CHECKBOX",
    [
        "Require Axe Tool",
        "Requires the player to have the axe item in their inventory before cutting trees."
    ],
    "ClearTree",
    true,
    true
] call CBA_fnc_addSetting;

[
    "ClearTree_actionTime",
    "TIME",
    [
        "Cutting Time",
        "Time it takes to cut a tree."
    ],
    "ClearTree",
    [5, 120, 22],
    true
] call CBA_fnc_addSetting;

[
    "ClearTree_interactionDistance",
    "SLIDER",
    [
        "Interaction Distance",
        "Maximum camera distance used to detect trees."
    ],
    "ClearTree",
    [1, 6, 3, 1],
    true
] call CBA_fnc_addSetting;

[
    "ClearTree_targetValidationRadius",
    "SLIDER",
    [
        "Target Validation Radius",
        "Small radius used to verify that the object you are looking at is a TREE or SMALL TREE. Keep this low to avoid selecting nearby trees."
    ],
    "ClearTree",
    [0.05, 1, 0.25, 2],
    true
] call CBA_fnc_addSetting;

[
    "ClearTree_applyRadius",
    "SLIDER",
    [
        "Apply Radius",
        "Fallback radius used when each machine resolves the tree locally at the visual interaction position."
    ],
    "ClearTree",
    [0.5, 6, 4, 1],
    true
] call CBA_fnc_addSetting;

[
    "ClearTree_debugLogging",
    "CHECKBOX",
    [
        "Debug Logging",
        "Writes ClearTree debug information to the RPT via diag_log."
    ],
    "ClearTree",
    false,
    true
] call CBA_fnc_addSetting;