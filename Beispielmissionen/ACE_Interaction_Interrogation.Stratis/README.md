# Zu Beachten:

Aktuell ist die Mission nur darauf ausgerichtet, dass es ein einziges Resultat gibt, 
	convinced = true 
	oder 
	notconvinced = true

Es wird nicht unterschieden, ob es sich um das Obst oder um die Gleichberechtigung handelt.
Sollte das erforderlich sein, müsste das Script um weitere Variablen erweitert werden.
	
In die Init käme dann der folgende Code:
	missionNamespace setVariable ["obstYay", false, true];
	missionNamespace setVariable ["obstNay", false, true];
	missionNamespace setVariable ["gleichberechtigungYay", false, true];
	missionNamespace setVariable ["gleichberechtigungNay", false, true];

Und in der fg2_interrogate.sqf müsste der Code ebenfalls angepasst werden:

	Zeile 48 von:
		missionNamespace setVariable ["convinced", true, true];
	zu:
		missionNamespace setVariable ["obstYay", true, true];

	Zeile 51 von:
		missionNamespace setVariable ["notconvinced", true, true];
	zu:
		missionNamespace setVariable ["obstNay", true, true];
		

	Zeile 79 von:
		missionNamespace setVariable ["convinced", true, true];
	zu:
		missionNamespace setVariable ["gleichberechtigungYay", true, true];

	Zeile 51 von:
		missionNamespace setVariable ["notconvinced", true, true];
	zu:
		missionNamespace setVariable ["gleichberechtigungNay", true, true];


Im Trigger wären dann 
	obstYay == true
	obstNay == true
und
	gleichberechtigungYay == true
	gleichberechtigungNay == true
ansprechbar.