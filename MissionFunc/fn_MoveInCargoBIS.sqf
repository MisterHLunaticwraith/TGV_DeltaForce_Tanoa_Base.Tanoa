systemChat "over ride Func called";
Params ["_groupOfplayers", "_vehicle"];
{
["mrh_milsimtools_moveInCargoEvent", [_x, _vehicle], _x] call CBA_fnc_targetEvent;
} forEach _groupOfplayers;