if (!hasInterface) exitWith {};

params [
    "_name",
    "_overwrite",
    "_pos",
    ["_type", "hd_dot"],
    ["_color", "Default"],
    ["_text", ""],
    ["_shape", "ICON"],
    ["_size", 1],
    ["_alpha", 1.0],
    ["_brush", "Solid"]
];

if (getMarkerType _name != "") then {
    if (_overwrite) then {
        deleteMarkerLocal _name;
    };
};



_marker = createMarkerLocal [_name, _pos];
_marker setMarkerAlphaLocal _alpha;
_marker setMarkerBrushLocal _brush;
_marker setMarkerColorLocal _color;
_marker setMarkerShapeLocal _shape;
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal _text;

if (typeName _size == "ARRAY") then {
    _marker setMarkerSizeLocal _size;
} else {
    _marker setMarkerSizeLocal [_size, _size];
};
