params ["_obj"];

private _act = ["tp_mainNode","Teleport to","",{true},{true},{},[],[-0.13,-0.4,-2.8],5,[true,false,false,false,true]] call ace_interact_menu_fnc_createAction;
[_obj,0,[],_act] call ace_interact_menu_fnc_addActionToObject;

private _act = ["tp_1","Phoum Srei Aphsok","",bj_fnc_tpTo,{!(missionNamespace getVariable ["GRAD_MISSIONSTARTED",false])},{},[4394.17,6383.13,0]] call ace_interact_menu_fnc_createAction;
[_obj,0,["tp_mainNode"],_act] call ace_interact_menu_fnc_addActionToObject;

private _act = ["tp_2","Sainte Clementine","",bj_fnc_tpTo,{!(missionNamespace getVariable ["GRAD_MISSIONSTARTED",false])},{},[4575.04,4620.43,0]] call ace_interact_menu_fnc_createAction;
[_obj,0,["tp_mainNode"],_act] call ace_interact_menu_fnc_addActionToObject;

private _act = ["tp_3","Kanleng Sreuv Samnang","",bj_fnc_tpTo,{!(missionNamespace getVariable ["GRAD_MISSIONSTARTED",false])},{},[4826.21,2824.74,0]] call ace_interact_menu_fnc_createAction;
[_obj,0,["tp_mainNode"],_act] call ace_interact_menu_fnc_addActionToObject;

private _act = ["tp_4","Phoumi moattonle","",bj_fnc_tpTo,{!(missionNamespace getVariable ["GRAD_MISSIONSTARTED",false])},{},[5938.38,1602.79,0]] call ace_interact_menu_fnc_createAction;
[_obj,0,["tp_mainNode"],_act] call ace_interact_menu_fnc_addActionToObject;
