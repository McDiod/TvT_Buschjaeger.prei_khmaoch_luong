params ["_unit","_killer","_instigator","_useEffects"];

private _dmgSource = _unit getVariable ["ACE_medical_lastDamageSource",_unit];
private _dmgSide = side (group _dmgSource);

if (missionNamespace getVariable ["bj_assassinsRevealed",false]) exitWith {};
if (isNil "bj_civKilledCounter") then {bj_civKilledCounter = 0};

if (_dmgSide == INDEPENDENT) then {
    bj_civKilledCounter = bj_civKilledCounter + 1;
};

if (_dmgSide == WEST) then {
    bj_civKilledCounter = bj_civKilledCounter - 1;
};

if (bj_civKilledCounter == 3) then {
    bj_assassinsRevealed = true;

    ["grad_notification1",["CIVILIANS KILLED","Assassins are now visible on the map."]] remoteExec ["bis_fnc_showNotification",0,false];

    ["bj_taskEliminate_1",bj_indLeader] call BIS_fnc_taskSetDestination;
    if (["bj_taskEliminate_2"] call BIS_fnc_taskExists) then {
        ["bj_taskEliminate_2",bj_indAssistant] call BIS_fnc_taskSetDestination;
    };
    if (["bj_taskEliminate_3"] call BIS_fnc_taskExists) then {
        ["bj_taskEliminate_3",bj_indLeader_1] call BIS_fnc_taskSetDestination;
    };
    if (["bj_taskEliminate_4"] call BIS_fnc_taskExists) then {
        ["bj_taskEliminate_4",bj_indAssistant_1] call BIS_fnc_taskSetDestination;
    };
};
