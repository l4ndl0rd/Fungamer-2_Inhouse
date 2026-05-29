class RscText;
class RscStructuredText;
class RscButton;
class RscEdit;

class FG2_CVD_Dialog
{
    idd = 6100;
    movingEnable = 0;
    enableSimulation = 1;

    onLoad = "(_this select 0) call FG2_CVD_fnc_dialogLoad";

    class controlsBackground
    {
        class Backdrop: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.245;
            y = safeZoneY + safeZoneH * 0.185;
            w = safeZoneW * 0.510;
            h = safeZoneH * 0.610;
            colorBackground[] = {0.224, 0.224, 0.224, 0.96};
            text = "";
        };

        class Header: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.245;
            y = safeZoneY + safeZoneH * 0.185;
            w = safeZoneW * 0.510;
            h = safeZoneH * 0.060;
            colorBackground[] = {0.8, 0.412, 0, 1};
            colorText[] = {1, 1, 1, 1};
            font = "RobotoCondensedBold";
            sizeEx = 0.043;
            style = 0;
            text = "  $STR_FG2_CVD_TITLE";
        };

        class InnerPanel: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.260;
            y = safeZoneY + safeZoneH * 0.265;
            w = safeZoneW * 0.480;
            h = safeZoneH * 0.355;
            colorBackground[] = {0.025, 0.025, 0.025, 0.80};
            text = "";
        };

        class LeftPanelTitle: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.280;
            y = safeZoneY + safeZoneH * 0.292;
            w = safeZoneW * 0.170;
            h = safeZoneH * 0.040;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {0.8, 0.412, 0, 1};
            font = "RobotoCondensed";
            sizeEx = 0.040;
            style = 0;
            text = "$STR_FG2_CVD_VALUES";
        };

        class RightPanelTitle: LeftPanelTitle
        {
            x = safeZoneX + safeZoneW * 0.515;
            w = safeZoneW * 0.190;
            text = "$STR_FG2_CVD_PRESETS";
        };

        class Divider: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.495;
            y = safeZoneY + safeZoneH * 0.300;
            w = safeZoneW * 0.0016;
            h = safeZoneH * 0.318;
            colorBackground[] = {0.8, 0.412, 0, 0.78};
            text = "";
        };

        class FooterLine: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.280;
            y = safeZoneY + safeZoneH * 0.635;
            w = safeZoneW * 0.440;
            h = safeZoneH * 0.002;
            colorBackground[] = {0.8, 0.412, 0, 0.78};
            text = "";
        };
    };

    class controls
    {
        class LabelVD: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.280;
            y = safeZoneY + safeZoneH * 0.350;
            w = safeZoneW * 0.115;
            h = safeZoneH * 0.046;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {1, 1, 1, 0.98};
            font = "RobotoCondensed";
            sizeEx = 0.043;
            style = 0;
            text = "$STR_FG2_CVD_VIEW";
        };

        class EditVD: RscEdit
        {
            idc = 6111;
            x = safeZoneX + safeZoneW * 0.405;
            y = safeZoneY + safeZoneH * 0.346;
            w = safeZoneW * 0.070;
            h = safeZoneH * 0.048;
            colorBackground[] = {0, 0, 0, 0.88};
            colorText[] = {1, 1, 1, 1};
            colorSelection[] = {0.8, 0.412, 0, 1};
            font = "RobotoCondensed";
            sizeEx = 0.040;
            style = 0;
            autocomplete = "";
            text = "";
        };

        class LabelOVD: LabelVD
        {
            y = safeZoneY + safeZoneH * 0.407;
            text = "$STR_FG2_CVD_OBJECTS";
        };

        class EditOVD: EditVD
        {
            idc = 6112;
            y = safeZoneY + safeZoneH * 0.403;
        };

        class LabelShadow: LabelVD
        {
            y = safeZoneY + safeZoneH * 0.464;
            text = "$STR_FG2_CVD_SHADOWS";
        };

        class EditShadow: EditVD
        {
            idc = 6113;
            y = safeZoneY + safeZoneH * 0.460;
        };

        class LabelPiP: LabelVD
        {
            y = safeZoneY + safeZoneH * 0.521;
            text = "$STR_FG2_CVD_PIP";
        };

        class EditPiP: EditVD
        {
            idc = 6114;
            y = safeZoneY + safeZoneH * 0.517;
        };

        class PresetFootLabel: RscText
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.515;
            y = safeZoneY + safeZoneH * 0.350;
            w = safeZoneW * 0.065;
            h = safeZoneH * 0.046;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {1, 1, 1, 0.98};
            font = "RobotoCondensed";
            sizeEx = 0.041;
            style = 0;
            text = "$STR_FG2_CVD_PRESET_FOOT_SHORT";
        };

        class PresetVehicleLabel: PresetFootLabel
        {
            y = safeZoneY + safeZoneH * 0.407;
            text = "$STR_FG2_CVD_PRESET_VEHICLE_SHORT";
        };

        class PresetHeliLabel: PresetFootLabel
        {
            y = safeZoneY + safeZoneH * 0.464;
            text = "$STR_FG2_CVD_PRESET_HELI_SHORT";
        };

        class PresetPlaneLabel: PresetFootLabel
        {
            y = safeZoneY + safeZoneH * 0.521;
            text = "$STR_FG2_CVD_PRESET_PLANE_SHORT";
        };

        class ButtonLoadFoot: RscButton
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.588;
            y = safeZoneY + safeZoneH * 0.350;
            w = safeZoneW * 0.058;
            h = safeZoneH * 0.042;
            text = "$STR_FG2_CVD_LOAD";
            font = "RobotoCondensed";
            sizeEx = 0.030;
            style = 2;
            colorText[] = {1, 1, 1, 1};
            colorDisabled[] = {0.4, 0.4, 0.4, 1};
            colorBackground[] = {0.08, 0.08, 0.08, 1};
            colorBackgroundDisabled[] = {0.05, 0.05, 0.05, 1};
            colorBackgroundActive[] = {0.8, 0.412, 0, 1};
            colorFocused[] = {0.8, 0.412, 0, 1};
            colorShadow[] = {0, 0, 0, 0};
            colorBorder[] = {0, 0, 0, 0};
            soundEnter[] = {"", 0, 1};
            soundPush[] = {"", 0, 1};
            soundClick[] = {"", 0, 1};
            soundEscape[] = {"", 0, 1};
            offsetX = 0;
            offsetY = 0;
            offsetPressedX = 0;
            offsetPressedY = 0;
            borderSize = 0;
            action = "['foot'] call FG2_CVD_fnc_presetLoad";
        };

        class ButtonSaveFoot: ButtonLoadFoot
        {
            x = safeZoneX + safeZoneW * 0.656;
            text = "$STR_FG2_CVD_SAVE";
            action = "['foot'] call FG2_CVD_fnc_presetSave";
        };

        class ButtonLoadVehicle: ButtonLoadFoot
        {
            y = safeZoneY + safeZoneH * 0.407;
            action = "['vehicle'] call FG2_CVD_fnc_presetLoad";
        };

        class ButtonSaveVehicle: ButtonSaveFoot
        {
            y = safeZoneY + safeZoneH * 0.407;
            action = "['vehicle'] call FG2_CVD_fnc_presetSave";
        };

        class ButtonLoadHeli: ButtonLoadFoot
        {
            y = safeZoneY + safeZoneH * 0.464;
            action = "['heli'] call FG2_CVD_fnc_presetLoad";
        };

        class ButtonSaveHeli: ButtonSaveFoot
        {
            y = safeZoneY + safeZoneH * 0.464;
            action = "['heli'] call FG2_CVD_fnc_presetSave";
        };

        class ButtonLoadPlane: ButtonLoadFoot
        {
            y = safeZoneY + safeZoneH * 0.521;
            action = "['plane'] call FG2_CVD_fnc_presetLoad";
        };

        class ButtonSavePlane: ButtonSaveFoot
        {
            y = safeZoneY + safeZoneH * 0.521;
            action = "['plane'] call FG2_CVD_fnc_presetSave";
        };

        class CurrentSettingsText: RscStructuredText
        {
            idc = 6301;
            x = safeZoneX + safeZoneW * 0.280;
            y = safeZoneY + safeZoneH * 0.650;
            w = safeZoneW * 0.440;
            h = safeZoneH * 0.040;
            colorBackground[] = {0, 0, 0, 0.52};
            size = 0.034;
            text = "";
            class Attributes
            {
                font = "RobotoCondensed";
                color = "#ffffff";
                align = "left";
                valign = "middle";
                shadow = 0;
            };
        };

        class ButtonSaveApply: RscButton
        {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.280;
            y = safeZoneY + safeZoneH * 0.720;
            w = safeZoneW * 0.205;
            h = safeZoneH * 0.048;
            text = "$STR_FG2_CVD_APPLY";
            font = "RobotoCondensed";
            sizeEx = 0.034;
            style = 2;
            colorText[] = {1, 1, 1, 1};
            colorDisabled[] = {0.4, 0.4, 0.4, 1};
            colorBackground[] = {0.8, 0.412, 0, 1};
            colorBackgroundDisabled[] = {0.2, 0.2, 0.2, 1};
            colorBackgroundActive[] = {0.95, 0.52, 0.05, 1};
            colorFocused[] = {0.95, 0.52, 0.05, 1};
            colorShadow[] = {0, 0, 0, 0};
            colorBorder[] = {0, 0, 0, 0};
            soundEnter[] = {"", 0, 1};
            soundPush[] = {"", 0, 1};
            soundClick[] = {"", 0, 1};
            soundEscape[] = {"", 0, 1};
            offsetX = 0;
            offsetY = 0;
            offsetPressedX = 0;
            offsetPressedY = 0;
            borderSize = 0;
            action = "[] call FG2_CVD_fnc_dialogSave";
        };

        class ButtonClose: ButtonSaveApply
        {
            x = safeZoneX + safeZoneW * 0.515;
            w = safeZoneW * 0.205;
            text = "$STR_FG2_CVD_CLOSE";
            colorBackground[] = {0.08, 0.08, 0.08, 1};
            colorBackgroundActive[] = {0.20, 0.20, 0.20, 1};
            colorFocused[] = {0.20, 0.20, 0.20, 1};
            action = "closeDialog 0";
        };
    };
};
