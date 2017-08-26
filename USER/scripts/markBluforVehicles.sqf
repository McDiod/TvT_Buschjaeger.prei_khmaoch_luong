_markedBoatsPos = [];
_markedCarsPos = [];
{
    _veh = _x;
    _type = "";
    _vehArray = nil;
    switch (true) do {
        case (_veh isKindOf "Ship"): {
            _type = "c_ship";
            _vehArray = _markedBoatsPos;
        };
        case (_veh isKindOf "Car"): {
            _type = "c_car";
            _vehArray = _markedCarsPos;
        };
    };

    if (_type != "") then {
        _nearestDist = 99999;
        {
            _dist = _x distance2D _veh;
            if (_dist < _nearestDist) then {
                _nearestDist = _dist;
            };
            false
        } count _vehArray;

        if (_nearestDist > 10) then {
            [format ["bj_vehicleMarker_%1",_forEachIndex],true,getPos _veh,_type,"COLORWEST"] remoteExec ["bj_fnc_createLocalMarker",WEST,true];
            _vehArray pushBack (getPos _veh);
        };
    };
} forEach vehicles;
