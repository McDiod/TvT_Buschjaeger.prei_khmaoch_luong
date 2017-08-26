params ["_pos","_searchPositions"];

private _id = -1;
private _minDist = 999999;
{
    _dist = _pos distance2D _x;
    if (_dist < _minDist) then {
        _id = _forEachIndex;
        _minDist = _dist;
    };
} forEach _searchPositions;

_id
