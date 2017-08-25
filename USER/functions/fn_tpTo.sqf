params ["","_caller","_searchPos"];

diag_log _this;

private _pos = [];
private _maxDist = 15;
for [{_i=0},{_i<50},{_i=_i+1}] do {
    _pos = _searchPos findEmptyPosition [0,_maxDist,"B_Soldier_F"];
    if (count _pos > 0) exitWith {};
    _maxDist = _maxDist + 5;
};

if (count _pos == 0) exitWith {
    systemChat "No empty position found. Please try again or contact an admin.";
};

_caller allowDamage false;
_caller setPos _pos;
[{_this allowDamage true},_caller,10] call CBA_fnc_waitAndExecute;
