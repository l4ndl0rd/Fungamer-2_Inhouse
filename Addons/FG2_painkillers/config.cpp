//#include "BIS_AddonInfo.hpp"
class CfgPatches {
    class fg2_tylenol {
        name = "Tylenol";
        units[] = {"fg2_tylenolItem"};
        weapons[] = {"fg2_tylenolItem"};
        magazines[] = {"fg2_tylenol"};
        requiredAddons[] = {
            "cba_main",
            "ace_common",
            "ace_medical_engine",
            "ace_medical_status",
            "ace_medical_treatment"
        };
        author = "l4ndl0rd";
    };
};

#include "CfgReplacementItems.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgMagazines.hpp"
#include "CfgFunctions.hpp"
#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"


