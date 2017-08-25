/*  Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

BJ_TARGETPOSITIONS = [
    getMarkerPos "bj_targetmarker_1",
    getMarkerPos "bj_targetmarker_2",
    getMarkerPos "bj_targetmarker_3",
    getMarkerPos "bj_targetmarker_4"
];

BJ_STARTDISTANCES = [
    900,
    600,
    650,
    750
];


if (isServer) then {
    [{missionNamespace getVariable ["GRAD_MISSIONSTARTED",false]},{
        ["grad_notification1",["GAME STARTED","Choose your spawn position (flag)."]] remoteExec ["bis_fnc_showNotification",INDEPENDENT,false];
    },[]] call CBA_fnc_waitUntilAndExecute;

    {
        _x setVariable ["asr_ai_exclude",true];

        _grp = group _x;
        if (leader _grp == _x) then {
            {
                _x setWaypointTimeOut [0,20,40];
                _x setWaypointSpeed "LIMITED";
            } forEach (waypoints _grp);
        };
    } forEach allUnits;
};

if (hasInterface) then {
    [] spawn {
        waitUntil {!isNull player && player getVariable ["GRAD_loadout_applicationCount",0] > 0};
        if (player getVariable ["bj_isIndLeader",false]) then {
            player addItemToBackpack "rhs_weap_t5000";
            player addItemToBackpack "optic_LRPS";
            player addItemToBackpack "bipod_01_F_blk";
        };
    };
};
