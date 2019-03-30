params ["_unit","_bodyBag"];
systemChat str _unit;
sleep 10;

_toMove = "";
{
	if (str _x == _unit) then {_toMove = _x};
} forEach allplayers;
Diag_Log str _toMove;
if (typeName _toMove == "STRING") exitWith {diag_log "No one to Move"};
[[_toMove],
	{
		params ["_respawnee"];
		_message = format ["%1 a été placé dans un sac mortuaire et est autorisé à respawner sur base", name _respawnee];
       ["TGVRespAllowed",[_message]] call BIS_fnc_showNotification;
	}
] remoteExec ["Call",[0,-2] select isDedicated];
_toMove setPos (getPos briefingPos);
_allbags = nearestObjects [position graveyard,["ACE_bodyBagObject"],50];
_bodyBag setPosATL  (graveyard modelToWorld [-3 -((count _allbags)*2),0,0]);
Diag_log format ["%1 , %2", str _bodyBag, position _bodyBag];
//player setPos (getPos _bodyBag);
[_toMove] call MRH_fnc_MilsimTools_Core_SetRevived;