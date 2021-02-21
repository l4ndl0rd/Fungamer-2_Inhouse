disableSerialization;
params[ "_picture" ];

//Get the main display
_display = [] call BIS_fnc_displayMission;
//Get any current document reference
_document = _display getVariable "document";

//If we dont have a current document OR the document picture is different
if ( isNil "_document" || { !( ctrlText _document isEqualTo _picture ) } ) then {

	//If there is no current document
	if ( isNil "_document" ) then {

		//Create the picture control
		_document = _display ctrlCreate [ "RscPictureKeepAspect", 1000 ];
		//Center it in the middle of the screen
		_document ctrlSetPosition[
			0.5 - ( 512 * pixelW ),
			0.5 - ( 512 * pixelH ),
			1024 * pixelW,
			1024 * pixelH
		];
		//Commit the position change
		_document ctrlCommit 0;

		//Save a reference to the document on the main display
		_display setVariable[ "document", _document ];

		//Add event for when the map is closed
		addMissionEventHandler [ "Map", {
			params[ "_mapOpen" ];

			//If the map is closed
			if !( _mapOpen ) then {
				//Delete the picture control
				ctrlDelete (( [] call BIS_fnc_displayMission ) getVariable "document" );
				//Set the saved reference to nil
				( [] call BIS_fnc_displayMission ) setVariable [ "document", nil ];
				//Remove this EH
				removeMissionEventHandler[ "Map", _thisEventHandler ];
			};
		}];
	};

	//Set the current document picture
	_document ctrlSetText _picture;

};
