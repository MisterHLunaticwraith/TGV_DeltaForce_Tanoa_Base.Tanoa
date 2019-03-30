params ["_scheme"];
_text = "";

switch (true) do 
{
	case (_scheme == "NormalRespawn"):{_text = format ["%1 a changé le mode de respawn: Respawn normal",name player]};
	case (_scheme == "CapturedRespawn"):{_text = format ["%1 a changé le mode de respawn: Capture par l'ennemi",name player]};
	case (_scheme == "RTBRespawn"):{_text = format ["%1 a changé le mode de respawn: Retour à la base de tous les joueurs",name player]};
	case (_scheme == "BodyBagRespawn"):{_text = format ["%1 a changé le mode de respawn: Respawn sur base des joueurs placés dans sac mortuaire",name player]};
	case (_scheme == "ReturnPlayerToBase"):{_text = format ["%1 a changé le mode de respawn: Respawn sur base",name player]};
};

[[_text],
	{
		params ["_message"];
       ["TGVRespChanged",[_message]] call BIS_fnc_showNotification;
	}
] remoteExec ["Call",[0,-2] select isDedicated];