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

    {
        if (alive _x && (CBA_missionTime - (_x getVariable ["bj_lastTrackerTime",0])) > 60 && {_x distance2D _civ < 550}) then {
            [_civ,0.1,nil,nil,nil,nil,10,true] remoteExec ["grad_gpsTracker_fnc_openTitle",_x,false];
            _x setVariable ["bj_lastTrackerTime",CBA_missionTime];
        };
    } forEach [missionNamespace getVariable ["bj_indLeader",objNull],missionNamespace getVariable ["bj_indAssistant",objNull]];
},2,_civ] call CBA_fnc_addPerFrameHandler;
