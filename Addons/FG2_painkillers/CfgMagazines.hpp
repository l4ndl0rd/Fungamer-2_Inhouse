class CfgMagazines {
    class CA_Magazine;

    class fg2_tylenol: CA_Magazine {
        author = "l4ndl0rd";
        scope = 2;

        displayName = "$STR_FG2_Tylenol_Pack_Name";
        descriptionShort = "$STR_FG2_Tylenol_Pack_Desc";
        descriptionUse = "$STR_FG2_Tylenol_Desc_Use";

        model = "\A3\Structures_F_EPA\Items\Medical\Painkillers_F.p3d";
        picture = "\FG2_painkillers\ui\icon_painkillers.paa";

        ACE_isMedicalItem = 1;
        ACE_asItem = 1;

        ammo = "";
        count = 10;
        initSpeed = 0;
        tracersEvery = 0;
        lastRoundsTracer = 0;
        mass = 1;
    };
};