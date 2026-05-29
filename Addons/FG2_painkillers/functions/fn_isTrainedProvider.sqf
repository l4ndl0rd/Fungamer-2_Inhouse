/*
    Returns true if the provider should receive the trained Tylenol action.

    Arguments:
    0: Medic <OBJECT>
*/

params [
    ["_medic", objNull, [objNull]]
];

if (isNull _medic) exitWith {false};

if (_medic getVariable ["fg2_isTrainedMedic", false]) exitWith {true};

// ACE medic class. Usually:
// 0 = normal soldier
// 1 = medic
// 2 = doctor
private _aceMedicClass = _medic getVariable ["ace_medical_medicClass", 0];

_aceMedicClass > 0