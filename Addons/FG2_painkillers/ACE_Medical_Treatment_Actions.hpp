class ACE_Medical_Treatment_Actions {
    class Painkillers;

    class Tylenol: Painkillers {
        displayName = "$STR_FG2_TylenolPack_ACE_Medical";
        displayNameProgress = "$STR_FG2_TylenolPack_ACE_Medical_Progress";

        icon = "\FG2_painkillers\ui\icon_painkillers_action.paa";
        category = "medication";

        allowedSelections[] = {"Head"};
        medicRequired = 0;
        allowSelfTreatment = 1;

        // Let ACE choose the inventory according to ace_medical_treatment_allowSharedEquipment.
        items[] = {"fg2_tylenol"};
        consumeItem = 1;

        condition = "!([_medic] call fg2_fnc_isTrainedProvider)";

        treatmentTime = 23;
        treatmentTimeTrained = 23;

        callbackSuccess = "call fg2_fnc_administerTylenol";

        sounds[] = {{"\FG2_painkillers\sounds\taking_pills_untrained.ogg", 4, 1, 50}};
        litter[] = {{"Land_PainKillers_F"}};
    };

    class Tylenol_Trained: Tylenol {
        condition = "([_medic] call fg2_fnc_isTrainedProvider)";

        treatmentTime = 11;
        treatmentTimeTrained = 11;

        sounds[] = {{"\FG2_painkillers\sounds\taking_pills_trained.ogg", 4, 1, 50}};
    };
};