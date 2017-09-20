params ["_veh"];

_veh addEventHandler ["GetIn",{
    params ["_veh","","_unit"];

    if (!local _veh) exitWith {};
    if (INDEPENDENT countSide (crew _veh) > 0) then {
        [_veh,0] remoteExec ["setFuel",0,false];
    } else {
        [_veh,1] remoteExec ["setFuel",0,false];
    };
}];
