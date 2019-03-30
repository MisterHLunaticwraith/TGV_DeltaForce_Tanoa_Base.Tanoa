_allSeats = nearestObjects [briefingPos,["Land_CampingChair_V1_F"], 20];
{
	_x setVariable ["TGV_SomeoneClaimedThisSeat",false,true];
} forEach _allSeats;