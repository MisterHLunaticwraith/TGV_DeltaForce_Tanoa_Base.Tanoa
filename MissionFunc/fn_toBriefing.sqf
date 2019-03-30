if (isServer && isDedicated) exitWith {};
//revive & heal players
	[player] call MRH_fnc_MilsimTools_Core_SetRevived;
	[player,player] call ACE_medical_fnc_treatmentAdvanced_fullHeal;
// bring back the zeusses 
_isZeus = false;
if !(isNil "GameZeus") then {if (player == GameZeus) exitWith {
	findDisplay 312 closeDisplay 2;
	player setPosATL (getPosATL posZeus1);
	_isZeus = true;
	}};
if !(isNil "GameZeus_2") then {if (player == GameZeus_2) exitWith{
	findDisplay 312 closeDisplay 2;
	player setPosATL (getPosATL posZeus2);
	_isZeus = true;
	}};
if (_isZeus) exitWith {};
//sit players
	_allSeats = nearestObjects [briefingPos,["Land_CampingChair_V1_F"], 20];
	_availableSeats = [];
	{
		if !(_x getVariable ["TGV_SomeoneClaimedThisSeat",false]) then {_availableSeats pushBackUnique _x}; 
	}forEach _allSeats;
	_seat = selectRandom _availableSeats;
[_seat, player] call acex_sitting_fnc_sit;
_seat setVariable ["TGV_SomeoneClaimedThisSeat",true,true];
