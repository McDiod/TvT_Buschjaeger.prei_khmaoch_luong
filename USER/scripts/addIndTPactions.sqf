params ["_obj"];

private _act = ["tp_mainNode","Teleport Menu","",{
    [] call bj_fnc_chooseIndSpawn;
},{missionNamespace getVariable ["GRAD_MISSIONSTARTED",false] && ((_this select 1) getVariable ["bj_isIndLeader",false])},{},[],[-0.13,-0.4,-2.8],5,[true,false,false,false,true]] call ace_interact_menu_fnc_createAction;
[_obj,0,[],_act] call ace_interact_menu_fnc_addActionToObject;
