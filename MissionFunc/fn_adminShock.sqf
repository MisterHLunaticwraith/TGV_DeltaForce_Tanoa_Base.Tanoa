params ["_player"];
_condition = {
	params ["_unit","_serverTime"];
	(serverTime < (_serverTime +60))
};
_pm = [_player,serverTime];

[[_player,_condition,_pm],MRH_fnc_electricShock] remoteExec ["Call",_player];