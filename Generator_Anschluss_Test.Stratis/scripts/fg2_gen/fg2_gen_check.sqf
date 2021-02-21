/*
	File:			fg2_gen_check.sqf
	Author:			l4ndl0rd
*/

//Objekt definieren, welches an das Script weitergeleitet wird
_object = _this select 0;

/*
//Sollte Sound gewünscht werden, dann hier hinzufügen
playMusic "Titelname";
*/

//Fortschrittsbalken starten
			1 cutRsc ["Progress_Bar","PLAIN"];
					 [] spawn {
									for "_ia"	from 1 to 10 do { 2 cutText  ["überprüfe Anschlüsse","PLAIN"]; sleep 1; }; 2 cutText  ["","PLAIN"];
								};
 
						for "_i" from 0 to 1 step 0.01		do //--- 0 ist links und 1 ist rechts, quasi voll, mit Step werden die Sprünge gezeigt [je kleiner der step, desto langsamer der Balken]
						{
						 sleep 0.1;
						 ((uiNamespace getVariable "ProgressBar") displayCtrl 1001) progressSetPosition _i; //-- 1001 ist die IDC aus der definition
						 };
			//--- Layer 1, was der Balken ist, schliessen
			1 cutText ["Anschlüsse überprüft","PLAIN"];

//Add-Action entfernen, nachdem  der Fortschrittsbalken durchgelaufen ist
_object removeAction a1;			

//Folge-Add-Action hinzufügen			
a2 = _object addAction ["Anschlüsse verbinden", "scripts\fg2_gen\fg2_gen_connect.sqf", nil, 1.5, false, true,"", "true", 3];