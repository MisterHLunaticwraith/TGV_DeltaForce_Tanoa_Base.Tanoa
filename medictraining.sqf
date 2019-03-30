params ["_mat"];
_allNearByDummies = [];
_allmen = entities "Man";

{
	if ((_x distance _mat < 5) && (_x getVariable ["MRH_WasCreatedForMedicalTrainingPurposes",false])) then {_allNearByDummies pushBackUnique _x};

} ForEach _allmen;
{
	deleteVehicle _x;
} forEach _allNearByDummies;
_grp = createGroup west;
_dummy = _grp createUnit ["C_man_polo_5_F", getPos _mat , [], 0, "CAN_COLLIDE"];
_dummy switchMove "AinjPpneMstpSnonWnonDnon";
[_dummy, "body", 0.3, objNull, "vehiclecrash", 0.3, objNull] call ace_medical_fnc_handleDamage;
_dummy setVariable ["MRH_WasCreatedForMedicalTrainingPurposes",true,true];