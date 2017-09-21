if (missionNamespace getVariable ["bj_respawnedAsCiv",false]) exitWith {
    ["Terminate"] call BIS_fnc_EGSpectator;
    ["Initialize", [player, [WEST,EAST,INDEPENDENT], true]] call BIS_fnc_EGSpectator;
};

bj_respawnedAsCiv = true;
[] call bj_fnc_moveIntoCiv;
