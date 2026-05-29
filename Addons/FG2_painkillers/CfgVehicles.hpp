class CfgVehicles {
    class WeaponHolder_Single_limited_item_F;

    class fg2_tylenolItem: WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_FG2_Tylenol_Pack_Name";
        author = "l4ndl0rd";
        vehicleClass = "Magazines";

        class TransportItems {
            class xx_fg2_tylenol {
                name = "fg2_tylenol";
                count = 1;
            };
        };
    };
};