params ["_civ"];

[{
    params ["_civ","_handle"];

    if (!alive _civ) exitWith {
        [_civ getVariable ["bj_taskInd",""],"Succeeded",true] call BIS_fnc_taskSetState;
        [_civ getVariable ["bj_taskBlu",""],"Failed",true] call BIS_fnc_taskSetState;

        bj_civsTargetsKilledCounter = (missionNamespace getVariable ["bj_civsTargetsKilledCounter",0]) + 1;
        if (bj_civsTargetsKilledCounter >= count BJ_TARGETPOSITIONS) then {
            bj_civTargetsKilled = true;
        };

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
},2,_civ] call CBA_fnc_addPerFrameHandler;
