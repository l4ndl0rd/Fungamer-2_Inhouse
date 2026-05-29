class CfgPatches
{
    class FG2_556_Custom
    {
        name = "FG2 Custom 5.56 Ammunition";
        author = "l4ndl0rd";
        requiredVersion = 2.14;

        requiredAddons[] =
        {
            "A3_Weapons_F",
            "cba_main",
            "rhsusf_c_weapons"
        };

        units[] = {};
        weapons[] = {};

        magazines[] =
        {
            "FG2_30Rnd_556x45_Custom_PMAG_Black",
            "FG2_30Rnd_556x45_Custom_PMAG_Black_Tracer",
            "FG2_30Rnd_556x45_Custom_PMAG_Tan",
            "FG2_30Rnd_556x45_Custom_PMAG_Tan_Tracer"
        };

        ammo[] =
        {
            "FG2_B_556x45_Custom",
            "FG2_B_556x45_Custom_Tracer_Red"
        };

        version = "1.0.5";
        versionStr = "1.0.5";
        versionAr[] = {1, 0, 5};
    };
};

class CfgAmmo
{
    class rhs_ammo_556x45_M855A1_Ball;
    class rhs_ammo_556x45_M855A1_Ball_Red;

    class FG2_B_556x45_Custom: rhs_ammo_556x45_M855A1_Ball
    {
        author = "l4ndl0rd";
        displayName = "FG2 Custom5.56x45mm";

        hit = 8.2;
        caliber = 1.9;
        typicalSpeed = 930;

        deflecting = 15;

        tracerScale = 0;
        tracerStartTime = 0;
        tracerEndTime = 0;
        nvgOnly = 0;
    };

    class FG2_B_556x45_Custom_Tracer_Red: rhs_ammo_556x45_M855A1_Ball_Red
    {
        author = "l4ndl0rd";
        displayName = "FG2 Custom 5.56x45mm Tracer";

        hit = 8.2;
        caliber = 1.9;
        typicalSpeed = 930;

        deflecting = 15;

        tracerScale = 1;
        tracerStartTime = 0.05;
        tracerEndTime = 1.2;
        nvgOnly = 0;
    };
};

class CfgMagazines
{
    class rhs_mag_30Rnd_556x45_Mk318_PMAG;
    class rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan;

    class FG2_30Rnd_556x45_Custom_PMAG_Black: rhs_mag_30Rnd_556x45_Mk318_PMAG
    {
        author = "l4ndl0rd";
        scope = 2;
        scopeArsenal = 2;

        displayName = "FG2 Custom 5.56mm 30Rnd PMAG";
        displayNameShort = "FG2 Custom";
        descriptionShort = "Caliber: 5.56x45mm NATO<br/>Rounds: 30<br/>Type: FG2 Custom";

        ammo = "FG2_B_556x45_Custom";
        count = 30;

        tracersEvery = 0;
        lastRoundsTracer = 0;
    };

    class FG2_30Rnd_556x45_Custom_PMAG_Black_Tracer: rhs_mag_30Rnd_556x45_Mk318_PMAG
    {
        author = "l4ndl0rd";
        scope = 2;
        scopeArsenal = 2;

        displayName = "FG2 Custom 5.56mm 30Rnd PMAG Tracer";
        displayNameShort = "FG2 Custom-T";
        descriptionShort = "Caliber: 5.56x45mm NATO<br/>Rounds: 30<br/>Type: FG2 Custom Tracer";

        ammo = "FG2_B_556x45_Custom_Tracer_Red";
        count = 30;

        tracersEvery = 1;
        lastRoundsTracer = 30;
    };

    class FG2_30Rnd_556x45_Custom_PMAG_Tan: rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan
    {
        author = "l4ndl0rd";
        scope = 2;
        scopeArsenal = 2;

        displayName = "FG2 Custom 5.56mm 30Rnd PMAG Tan";
        displayNameShort = "FG2 Custom";
        descriptionShort = "Caliber: 5.56x45mm NATO<br/>Rounds: 30<br/>Type: FG2 Custom";

        ammo = "FG2_B_556x45_Custom";
        count = 30;

        tracersEvery = 0;
        lastRoundsTracer = 0;
    };

    class FG2_30Rnd_556x45_Custom_PMAG_Tan_Tracer: rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan
    {
        author = "l4ndl0rd";
        scope = 2;
        scopeArsenal = 2;

        displayName = "FG2 Custom 5.56mm 30Rnd PMAG Tan Tracer";
        displayNameShort = "FG2 Custom-T";
        descriptionShort = "Caliber: 5.56x45mm NATO<br/>Rounds: 30<br/>Type: FG2 Custom Tracer";

        ammo = "FG2_B_556x45_Custom_Tracer_Red";
        count = 30;

        tracersEvery = 1;
        lastRoundsTracer = 30;
    };
};

class CfgMagazineWells
{
    class CBA_556x45_STANAG
    {
        FG2_556_Custom_PMAGs[] =
        {
            "FG2_30Rnd_556x45_Custom_PMAG_Black",
            "FG2_30Rnd_556x45_Custom_PMAG_Black_Tracer",
            "FG2_30Rnd_556x45_Custom_PMAG_Tan",
            "FG2_30Rnd_556x45_Custom_PMAG_Tan_Tracer"
        };
    };

    class STANAG_556x45
    {
        FG2_556_Custom_PMAGs[] =
        {
            "FG2_30Rnd_556x45_Custom_PMAG_Black",
            "FG2_30Rnd_556x45_Custom_PMAG_Black_Tracer",
            "FG2_30Rnd_556x45_Custom_PMAG_Tan",
            "FG2_30Rnd_556x45_Custom_PMAG_Tan_Tracer"
        };
    };
};