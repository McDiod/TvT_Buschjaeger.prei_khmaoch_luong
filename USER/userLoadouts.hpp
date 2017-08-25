/*  Hier können eigene factions für grad-loadout eingetragen werden.
*   Anleitung im Wiki
*/


class bj_assassins {
    class AllUnits {
		primaryWeaponPointer = "";
		primaryWeaponUnderbarrel = "";
		primaryWeaponUnderbarrelMagazine = "";
		secondaryWeapon = "";
		secondaryWeaponMagazine = "";
		handgunWeapon = "hgun_Rook40_F";
        handgunWeaponMuzzle = "muzzle_snds_L";
        handgunWeaponMagazine = "16Rnd_9x21_Mag";
		uniform = "U_B_T_Sniper_F";
        vest = "V_PlateCarrier1_tna_F";
		backpack = "";
		headgear = "";
		nvgoggles = "";
		radio = "tf_anprc148jem";
		binoculars = "ACE_VectorDay";
		map = "ItemMap";
		gps = "ItemGPS";
		compass = "ItemCompass";
        addItemsToUniform[] = {
            LIST_10("ACE_fieldDressing"),
			LIST_4("ACE_morphine"),
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "ACE_ATragMX",
			"ACE_epinephrine",
			"ACE_Flashlight_XL50",
			"ACE_MapTools"
        };
        addItemsToVest[] = {};
        addItemsToBackpack[] = {};
	};

	class Type {
		class Sniper_F {
            primaryWeapon = "hgun_PDW2000_F";
            primaryWeaponMagazine = "30Rnd_9x21_Mag";
    		primaryWeaponMuzzle = "muzzle_snds_L";
    		primaryWeaponOptics = "FHQ_optic_AC11704";
            backpack = "B_ViperHarness_oli_F";

            addItemsToVest[] = {
                LIST_7("30Rnd_9x21_Mag"),
                LIST_12("rhs_5Rnd_338lapua_t5000"),
                LIST_2("16Rnd_9x21_Mag"),
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white")
            };
		};
        class Spotter_F {
            primaryWeapon = "rhs_weap_m21a_pr";
            primaryWeaponMagazine = "rhsgref_30rnd_556x45_m21";
    		primaryWeaponMuzzle = "";
    		primaryWeaponOptics = "rhs_acc_rakursPM";

            addItemsToVest[] = {
                LIST_8("rhsgref_30rnd_556x45_m21"),
                LIST_2("16Rnd_9x21_Mag"),
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white")
            };

            backpack = "B_ViperLightHarness_oli_F";
            addItemsToBackpack[] = {
                "ACE_EntrenchingTool",
                "ACE_SpottingScope",
                "ACE_Tripod",
                "ACE_wirecutter"
            };
        };
    };
};

class bj_marines {
	class AllUnits {
        primaryWeapon = "rhs_weap_m16a4";
        primaryWeaponMagazine = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
		primaryWeaponMuzzle = "";
		primaryWeaponOptics = "rhsusf_acc_compm4";
		primaryWeaponPointer = "";
		primaryWeaponUnderbarrel = "";
		primaryWeaponUnderbarrelMagazine = "";
		secondaryWeapon = "";
		secondaryWeaponMagazine = "";
		handgunWeapon = "rhsusf_weap_m9";
        handgunWeaponMagazine = "rhsusf_mag_15Rnd_9x19_JHP";

		uniform = "rhs_uniform_FROG01_wd";
        vest = "rhsusf_spc_rifleman";
		backpack = "";
		headgear = "rhs_booniehat2_marpatwd";
		nvgoggles = "";
		radio = "tf_anprc152";
		binoculars = "Binocular";
		map = "ItemMap";
		gps = "ItemGPS";
		compass = "ItemCompass";
        addItemsToUniform[] = {
            LIST_10("ACE_fieldDressing"),
			LIST_4("ACE_morphine"),
			"ACE_epinephrine",
			"ACE_Flashlight_MX991",
			"ACE_key_west",
			"ACE_MapTools"
        };
        addItemsToVest[] = {};
        addItemsToBackpack[] = {};
	};

	class Type {
        class Soldier_F {
            addItemsToVest[] = {
				LIST_8("rhs_mag_30Rnd_556x45_Mk318_Stanag"),
				LIST_2("rhs_mag_an_m8hc"),
				LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
				LIST_2("rhs_mag_m67")
			};
        };
        class Soldier_SL_F: Soldier_F {
            vest = "rhsusf_spc_squadleader";
            backpack = "tf_rt1523g";
        };
        class medic_F: Soldier_F {
            vest = "rhsusf_spc_corpsman";
            addItemsToVest[] = {
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_6("rhs_mag_30Rnd_556x45_Mk318_Stanag"),
                LIST_4("rhs_mag_an_m8hc"),
            };

            backpack = "rhsusf_falconii_coy";
            addItemsToBackpack[] = {
                LIST_18("ACE_fieldDressing"),
                LIST_10("ACE_epinephrine"),
                LIST_15("ACE_morphine"),
                LIST_4("ACE_salineIV")
            };
        };
        class Soldier_TL_F: Soldier_F {
            primaryWeapon = "rhs_weap_m16a4_carryhandle_M203";
            primaryWeaponUnderbarrelMagazine = "rhs_mag_m714_White";
            vest = "rhsusf_spc_teamleader";
            addItemsToVest[] = {
				LIST_7("rhs_mag_30Rnd_556x45_Mk318_Stanag"),
				LIST_2("rhs_mag_an_m8hc"),
				LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
				LIST_2("rhs_mag_m67"),
                LIST_2("rhs_mag_m713_Red"),
                LIST_2("rhs_mag_m714_White"),
                LIST_2("rhs_mag_m715_Green")
			};
        };
        class soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_m249";
            primaryWeaponMagazine = "rhs_200rnd_556x45_M_SAW";
            handgunWeapon = "";
            handgunWeaponMagazine = "";

            vest = "rhsusf_spc_mg";
            addItemsToVest[] = {
                LIST_3("rhs_200rnd_556x45_M_SAW")
            };
        };
        class soldier_AAR_F: Soldier_F {
            backpack = "rhsusf_falconii_coy";
            addItemsToBackpack[] = {
                LIST_3("rhs_200rnd_556x45_M_SAW")
            };
        };
        class Helipilot_F: Soldier_F {
            primaryWeaponOptics = "";
            handgunWeapon = "";
            handgunWeaponMagazine = "";

            vest = "rhsusf_spc";
            headgear = "H_HelmetCrew_I";
            goggles = "G_Aviator";
            backpack = "tf_rt1523g";

            addItemsToVest[] = {
                "rhs_mag_30Rnd_556x45_Mk318_Stanag",
                "rhs_mag_an_m8hc"
            };
        };
    };
};
