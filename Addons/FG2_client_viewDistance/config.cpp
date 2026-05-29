class CfgPatches
{
    class FG2_Client_ViewDistance
    {
        name = "FG2 Client View Distance";
        author = "l4ndl0rd";
        requiredVersion = 2.14;
        requiredAddons[] =
        {
            "A3_UI_F",
            "cba_main",
            "ace_interact_menu"
        };
        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions
{
    class FG2_CVD
    {
        tag = "FG2_CVD";

        class Functions
        {
            file = "\fg2_client_viewdistance\functions";

            class apply {};
            class openMenu {};
            class dialogLoad {};
            class dialogUpdateText {};
            class dialogSave {};
            class attachPauseButton {};
            class addAceSelfInteraction {};

            class dialogReadValues {};
            class presetLoad {};
            class presetSave {};
        };
    };
};

class Extended_PostInit_EventHandlers
{
    class FG2_Client_ViewDistance
    {
        init = "call compile preprocessFileLineNumbers '\fg2_client_viewdistance\XEH_postInit.sqf'";
    };
};

#include "ui\FG2_CVD_Dialog.hpp"