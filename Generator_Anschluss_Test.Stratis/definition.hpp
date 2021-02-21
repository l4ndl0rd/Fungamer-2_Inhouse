//---- DISPLAY

class RscProgress				//-- Definition Fortschrittsbalken
{
	type = 8;
	style = 0;
	colorFrame[] = {0,0,0,1};					//-- Definition Farbe Rahmen in aRGB
	colorBar[] = {1,0.65,0,1};				//-- Definition Farbe Fortschrittsbalken in aRGB
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	w = 1;
	h = 0.03;
};

class RscTitles 
{
	class Progress_Bar
		{
			movingEnable = false;
			idd = 1000;
			duration = 9999999;  //-- to open you can show it with 1 cutrsc ["Progress_Bar", "PLAIN"] and to close 1 cutText ["","PLAIN"] ;; 1 is the layer
			fadeIn = 1;
			fadeOut = 1;
			name = "ProgressBar";
			onLoad = "uiNamespace setVariable ['ProgressBar', (_this select 0)];";
			class Controls
				{
					class Bar: RscProgress
						{
							idc = 1001; //-- wird später benötigt um den Balken zu laden
							text = "#(argb,8,8,3)color(0,0,0,0.8)";
							x = 0.2 * safezoneW + safezoneX;
							y = 0.08 * safezoneH + safezoneY;
							w = 0.6 * safezoneW;
							h = 0.04 * safezoneH;
						};
				};
		};


}; //-- END RSCTITLES
