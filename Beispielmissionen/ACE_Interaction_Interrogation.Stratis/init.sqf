//Call the script at mission start if we choose so
[priest] execVM "scripts\fg2_interrogate.sqf";

//Variables for our results - CAN BE MODIFIED, CONSULT README.md!
missionNamespace setVariable ["convinced", false, true];
missionNamespace setVariable ["notconvinced", false, true];

//Variable to store the result in - DO NOT CHANGE THIS!
missionNamespace setVariable ["fg2_rollResult", 0, true];
