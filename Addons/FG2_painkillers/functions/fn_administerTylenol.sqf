/*
    FG2 Tylenol - ACE medication wrapper

    ACE callbackSuccess arguments:
    0: Medic <OBJECT>
    1: Patient <OBJECT>
    2: Body Part <STRING>
    3: Treatment Class <STRING>
    4: Item User <OBJECT>
    5: Used Item <STRING>
    6: Create Litter <BOOL>
*/

params [
    ["_medic", objNull, [objNull]],
    ["_patient", objNull, [objNull]],
    ["_bodyPart", "Head", [""]],
    ["_className", "Tylenol", [""]],
    ["_itemUser", objNull, [objNull]],
    ["_usedItem", "fg2_tylenol", [""]],
    ["_createLitter", false, [false]]
];

if (isNull _medic || {isNull _patient}) exitWith {};
if (!alive _patient) exitWith {};

if (_usedItem isEqualTo "") then {
    _usedItem = "fg2_tylenol";
};

// ACE Basic Medication only has hardcoded handling for Morphine, Epinephrine and Painkillers.
// Custom class "Tylenol" only gets config-driven effects when advanced medication is enabled.
private _effectClass = ["Painkillers", "Tylenol"] select (
    missionNamespace getVariable ["ace_medical_treatment_advancedMedication", true]
);

// Let ACE do triage card, log entry and patient-local medication effect.
[_medic, _patient, _bodyPart, _effectClass, _itemUser, _usedItem] call ace_medical_treatment_fnc_medication;

diag_log format [
    "[FG2][Tylenol][INFO] Administered %1 | Medic: %2 | Patient: %3 | ItemUser: %4 | EffectClass: %5",
    _usedItem,
    _medic,
    _patient,
    _itemUser,
    _effectClass
];