class ACE_Medical_Treatment {
    class Medication {
        class Tylenol {
            painReduce = 1;

            hrIncreaseLow[] = {0, 0};
            hrIncreaseNormal[] = {0, 0};
            hrIncreaseHigh[] = {0, 0};

            timeInSystem = 900;
            timeTillMaxEffect = 120;

            maxDose = 10;
            maxDoseDeviation = 2;
            dose = 1;
            
            incompatibleMedication[] = {};
            viscosityChange = 0;
            onOverDose = "";
        };
    };
};