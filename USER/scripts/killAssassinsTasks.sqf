["bj_taskEliminate_1",WEST,["Kill the Assassin's leader, the sniper.","Kill Sniper",""],objNull,"AUTOASSIGNED",2,false] call BIS_fnc_setTask;
[bj_indLeader,["Killed",{
    ["bj_taskEliminate_1","SUCCEEDED",true] remoteExec ["BIS_fnc_taskSetState",2,false];
}]] remoteExec ["addEventHandler",bj_indLeader,false];


if (!isNull (missionNamespace getVariable ["bj_indAssistant",objNull])) then {
    ["bj_taskEliminate_2",WEST,["Kill the Sniper's assistant, the spotter.","Kill Spotter",""],objNull,"AUTOASSIGNED",2,false] call BIS_fnc_setTask;
    [bj_indAssistant,["Killed",{
        ["bj_taskEliminate_2","SUCCEEDED",true] remoteExec ["BIS_fnc_taskSetState",2,false];
    }]] remoteExec ["addEventHandler",bj_indAssistant,false];
};
