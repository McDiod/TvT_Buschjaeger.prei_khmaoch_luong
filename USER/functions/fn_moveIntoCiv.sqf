private _type = selectRandom [
    "C_Man_casual_4_F_asia",
    "C_Man_casual_5_F_asia",
    "C_Man_casual_6_F_asia",
    "C_man_polo_1_F_asia",
    "C_man_polo_2_F_asia",
    "C_man_polo_3_F_asia",
    "C_man_polo_4_F_asia",
    "C_man_polo_5_F_asia",
    "C_man_polo_6_F_asia",
    "C_man_shorts_1_F_asia"
];

private _targetCivs = (missionNamespace getVariable ["BJ_TARGETCIVS",[]]) select {alive _x};
private _searchPos = if (count _targetCivs == 0) then {
    _westPlayers = playableUnits select {alive _x && side _x == WEST};
    if (count _westPlayers == 0) then {
        [0,0,0]
    } else {
        getPos selectRandom _westPlayers
    };
} else {
    getPos selectRandom _targetCivs
};

private _pos = [_searchPos,[50,350]] call grad_civs_fnc_findRandomPos;

private _civ = (createGroup CIVILIAN) createUnit [_type,_pos,[],0,"NONE"];
private _face = face _civ;

selectPlayer _civ;
[player,_face] remoteExec ["setFace",0,player];

player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ACE_key_civ"
