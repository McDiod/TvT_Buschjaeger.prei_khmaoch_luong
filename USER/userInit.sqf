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
        [] execVM "USER\scripts\killAssassinsTasks.sqf"
    },[]] call CBA_fnc_waitUntilAndExecute;

    BJ_CIVS = [];
    {BJ_CIVS pushBack []} forEach BJ_TARGETPOSITIONS;

    {
        if (side _x == CIVILIAN) then {
            _villageID = [getPos _x,BJ_TARGETPOSITIONS] call bj_fnc_findNearestPos;
            (BJ_CIVS select _villageID) pushBack _x;

            _x setVariable ["asr_ai_exclude",true];
            _x setVariable ["bj_villageID",_villageID];

            _grp = group _x;
            if (leader _grp == _x) then {
                {
                    _x setWaypointTimeOut [0,20,40];
                    _x setWaypointSpeed "LIMITED";
                } forEach (waypoints _grp);
            };
        };
    } forEach allUnits;

    _equipment = [0,1,2,3,4,5];
    {
        _villageArray = BJ_CIVS select _forEachIndex;
        _targetCiv = _villageArray deleteAt (round random (count _villageArray -1));

        _equipID = _equipment deleteAt (round random (count _equipment -1));
        _picturePath = [_targetCiv,_equipID] call bj_fnc_equipTargetCiv;

        _taskBlu = [format ["bj_taskProtect_%1",_forEachIndex],WEST,[format ["The Assassins are targeting %1. Protect him.<br/><br/><img width='128' height='256' image='%2' />",name _targetCiv,_picturePath],"Protect Civilian",""],_targetCiv,"AUTOASSIGNED",2,false] call BIS_fnc_setTask;
        _taskInd = [format ["bj_taskKill_%1",_forEachIndex],INDEPENDENT,[format ["Kill %1.<br/><br/><img width='128' height='256' image='%2' />",name _targetCiv,_picturePath],"Kill functionary",""],_x,"AUTOASSIGNED",2,false] call BIS_fnc_setTask;

        _targetCiv setVariable ["bj_taskBlu",_taskBlu];
        _targetCiv setVariable ["bj_taskInd",_taskInd];
        [_targetCiv] call bj_fnc_trackCiv;
    } forEach BJ_TARGETPOSITIONS;

    {{
        _x addEventHandler ["Killed",{_this call bj_fnc_handleCivKilled}];
    } forEach _x} forEach BJ_CIVS;

    [] execVM "USER\scripts\markBluforVehicles.sqf";
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
