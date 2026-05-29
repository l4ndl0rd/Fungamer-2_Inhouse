class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class fg2_tylenolItem: ACE_ItemCore {
        scope = 2;
        scopeArsenal = 0;
        author = "l4ndl0rd";
        displayName = "$STR_FG2_Tylenol_Pack_Name";
        picture = "\FG2_painkillers\ui\icon_painkillers.paa";
        descriptionShort = "$STR_FG2_Tylenol_Pack_Desc";

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};