if (missionNamespace getVariable ["bj_chooseIndSpawnOpen",false]) exitWith {};
bj_chooseIndSpawnOpen = true;

openMap [true,true];

["bj_radius_1",true,BJ_TARGETPOSITIONS select 0,nil,"COLORYELLOW","","ELLIPSE",BJ_STARTDISTANCES select 0,1,"BORDER"] call bj_fnc_createLocalMarker;
["bj_radius_2",true,BJ_TARGETPOSITIONS select 1,nil,"COLORYELLOW","","ELLIPSE",BJ_STARTDISTANCES select 1,1,"BORDER"] call bj_fnc_createLocalMarker;
["bj_radius_3",true,BJ_TARGETPOSITIONS select 2,nil,"COLORYELLOW","","ELLIPSE",BJ_STARTDISTANCES select 2,1,"BORDER"] call bj_fnc_createLocalMarker;
["bj_radius_4",true,BJ_TARGETPOSITIONS select 3,nil,"COLORYELLOW","","ELLIPSE",BJ_STARTDISTANCES select 3,1,"BORDER"] call bj_fnc_createLocalMarker;

[true,"CHOOSE SPAWN (LMOUSE)","CONFIRM (ENTER)"] call bj_ui_fnc_twoLineHint;

//MAPCLICK EVENT ===============================================================
mcd_chooseSpawnClick = [
    "mcd_chooseSpawn",
    "onMapSingleClick",
    {
        ["bj_spawnMarker",true,_pos,"mil_start","colorIndependent"] call bj_fnc_createLocalMarker;
        BJ_INDSPAWN = _pos;
    }
] call BIS_fnc_addStackedEventHandler;

//CONFIRM SELECTION ============================================================
mcd_onSpawnKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {

    if ((_this select 1 == 28)||(_this select 1 == 156)) then {
        if (isNil "BJ_INDSPAWN") then {
            ["PLEASE CHOOSE A POSITION BY CLICKING ON THE MAP"] call bj_ui_fnc_confirmHint;

        } else {

            //distances check
            if !([BJ_INDSPAWN] call bj_fnc_checkIndStartDistances) then {
                ["PLEASE CHOOSE A POSITION OUTSIDE THE YELLOW CIRCLES"] call bj_ui_fnc_confirmHint;
            } else {

                //position in water
                if (surfaceIsWater BJ_INDSPAWN) then {
                    ["PLEASE CHOOSE A POSITION ON LAND"] call bj_ui_fnc_confirmHint;
                } else {

                    player say "taskSucceeded";
                    [false] call bj_ui_fnc_twoLineHint;
                    openMap [false,false];

                    BJ_GAMESTARTED = true;
                    publicVariable "BJ_GAMESTARTED";
                    publicVariable "BJ_INDSPAWN";

                    ["grad_notification1",["IND SPAWNED","Independent has spawned."]] remoteExec ["bis_fnc_showNotification",WEST,false];

                    [objNull,player,BJ_INDSPAWN] call bj_fnc_tpTo;
                    if (!isNull (missionNamespace getVariable ["bj_indAssistant",objNull])) then {
                        [{[objNull,bj_indAssistant,BJ_INDSPAWN] remoteExec ["bj_fnc_tpTo",bj_indAssistant,false]},[],1.5] call CBA_fnc_waitAndExecute;
                    };
                    if (!isNull (missionNamespace getVariable ["bj_indLeader_1",objNull])) then {
                        [{[objNull,bj_indLeader_1,BJ_INDSPAWN] remoteExec ["bj_fnc_tpTo",bj_indLeader_1,false]},[],1.5] call CBA_fnc_waitAndExecute;
                    };
                    if (!isNull (missionNamespace getVariable ["bj_indAssistant_1",objNull])) then {
                        [{[objNull,bj_indAssistant_1,BJ_INDSPAWN] remoteExec ["bj_fnc_tpTo",bj_indAssistant_1,false]},[],1.5] call CBA_fnc_waitAndExecute;
                    };

                    {deleteMarkerLocal _x} forEach ["bj_radius_1","bj_radius_2","bj_radius_3","bj_radius_4","bj_spawnMarker"];

                    ["mcd_chooseSpawn", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
                    (findDisplay 46) displayRemoveEventHandler ["KeyDown", mcd_onSpawnKeyDown];
                };
            };
        };
    };
}];
