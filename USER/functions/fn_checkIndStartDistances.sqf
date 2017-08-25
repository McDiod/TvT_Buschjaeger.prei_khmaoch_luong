params ["_pos"];

private _check = true;
{
    _minDist = BJ_STARTDISTANCES select _forEachIndex;
    if (_x distance2D _pos < _minDist) exitWith {_check = false};
} forEach BJ_TARGETPOSITIONS;

_check
