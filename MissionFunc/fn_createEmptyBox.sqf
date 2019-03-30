params ["_refObjPos",["_inHands",false]];
_pos = "";
if (typeName _refObjPos == "ARRAY") then {_pos = _refObjPos};
if (typeName _refObjPos == "OBJECT") then {_pos = getPosATL _refObjPos};
_box = "TGV_emptyBox" createVehicle _pos;
_box setPosATL _pos;
if (_inHands) then {[player, _box] call ace_dragging_fnc_startCarry;};
_box