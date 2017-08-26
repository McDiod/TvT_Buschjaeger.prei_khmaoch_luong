params ["_civ","_id"];


removeAllWeapons _civ;
removeAllItems _civ;
removeAllAssignedItems _civ;
removeUniform _civ;
removeVest _civ;
removeBackpack _civ;
removeHeadgear _civ;
removeGoggles _civ;

private _face = "";
private _picPath = "";

switch (_id) do {
    case (0): {
        _civ forceAddUniform "U_C_Poloshirt_blue";
        _civ addHeadgear "H_Cap_blk";
        _civ addGoggles "G_Squares_Tinted";

        _civ linkItem "ItemMap";
        _civ linkItem "ItemCompass";
        _civ linkItem "ItemWatch";

        _face = "AsianHead_A3_02";
        _civ setSpeaker "";

        _picPath = "USER\data\target_0.jpg";
    };

    case (1): {
        _civ forceAddUniform "U_C_Poloshirt_redwhite";
        _civ addHeadgear "H_Booniehat_khk";
        _civ addGoggles "G_Aviator";

        _civ linkItem "ItemMap";
        _civ linkItem "ItemCompass";
        _civ linkItem "ItemWatch";

        _face = "AsianHead_A3_04";
        _civ setSpeaker "";

        _picPath = "USER\data\target_1.jpg";
    };

    case (2): {
        _civ forceAddUniform "U_I_C_Soldier_Bandit_2_F";
        _civ addGoggles "G_Shades_Black";

        _civ linkItem "ItemMap";
        _civ linkItem "ItemCompass";
        _civ linkItem "ItemWatch";

        _face = "AsianHead_A3_05";
        _civ setSpeaker "";

        _picPath = "USER\data\target_2.jpg";
    };

    case (3): {
        _civ forceAddUniform "U_C_Man_casual_6_F";
        _civ addHeadgear "H_Hat_tan";

        _civ linkItem "ItemMap";
        _civ linkItem "ItemCompass";
        _civ linkItem "ItemWatch";

        _face = "AsianHead_A3_06";
        _civ setSpeaker "";

        _picPath = "USER\data\target_3.jpg";
    };

    case (4): {
        _civ forceAddUniform "U_BG_Guerilla2_3";
        _civ addHeadgear "H_Bandanna_gry";

        _civ linkItem "ItemMap";
        _civ linkItem "ItemCompass";
        _civ linkItem "ItemWatch";

        _face = "AsianHead_A3_07";
        _civ setSpeaker "";

        _picPath = "USER\data\target_4.jpg";
    };

    case (5): {
        _civ forceAddUniform "U_I_C_Soldier_Bandit_3_F";

        _civ linkItem "ItemMap";
        _civ linkItem "ItemCompass";
        _civ linkItem "ItemWatch";

        _face = "AsianHead_A3_03";
        _civ setSpeaker "";

        _picPath = "USER\data\target_5.jpg";
    };
};

[_civ,_face] remoteExec ["setFace",0,_civ];

_picPath
