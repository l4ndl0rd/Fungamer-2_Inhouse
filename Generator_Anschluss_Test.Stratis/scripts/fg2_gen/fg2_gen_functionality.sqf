/*
	File:			fg2_gen_functionality.sqf
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
									for "_ia"	from 1 to 10 do { 2 cutText  ["Generator Testlauf","PLAIN"]; sleep 1; }; 2 cutText  ["","PLAIN"];
								};
 
						for "_i" from 0 to 1 step 0.001 	do //--- 0 ist links und 1 ist rechts, quasi voll, mit Step werden die Sprünge gezeigt [je kleiner der step, desto langsamer der Balken]
						{
						 sleep 0.1;
						 ((uiNamespace getVariable "ProgressBar") displayCtrl 1001) progressSetPosition _i; //-- 1001 ist die IDC aus der definition
						 };
			//--- Layer 1, was der Balken ist, schliessen
			1 cutText ["Der Generator funktioniert tadellos","PLAIN"];

//Add-Action entfernen, nachdem  der Fortschrittsbalken durchgelaufen ist
_object removeAction a3;