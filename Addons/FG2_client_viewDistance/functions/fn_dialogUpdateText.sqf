/*
    Updates FG2 Client View Distance dialog labels.
*/

disableSerialization;

params ["_display"];

private _objectView = getObjectViewDistance;
_objectView params ["_currentOVD", "_currentShadow"];

private _pip = getPiPViewDistance;
private _pipText = if (_pip < 0) then {localize "STR_FG2_CVD_OFF"} else {str round _pip};

private _settingsText = format [
    "<t font='RobotoCondensed' size='1.05' color='#ffffff'>%1:</t> <t font='RobotoCondensed' size='1.05' color='#cc6900'>%2 %3</t>  |  <t font='RobotoCondensed' size='1.05' color='#cc6900'>%4 %5</t>  |  <t font='RobotoCondensed' size='1.05' color='#cc6900'>%6 %7</t>  |  <t font='RobotoCondensed' size='1.05' color='#cc6900'>%8 %9</t>",
    localize "STR_FG2_CVD_CURRENT_SETTINGS",
    localize "STR_FG2_CVD_VD_SHORT",
    round viewDistance,
    localize "STR_FG2_CVD_OVD_SHORT",
    round _currentOVD,
    localize "STR_FG2_CVD_SHD_SHORT",
    round _currentShadow,
    localize "STR_FG2_CVD_PIP",
    _pipText
];

(_display displayCtrl 6301) ctrlSetStructuredText parseText _settingsText;
