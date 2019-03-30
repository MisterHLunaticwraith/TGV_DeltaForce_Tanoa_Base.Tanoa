params ["_action"];
switch (true) do
{
	case (_action =="BringToBrief"):
	{
		[[],
			{
					//send notif 
					_message = format ["Vous êtes rappelé à la base"];
					["TGVtoBrief",[_message]] call BIS_fnc_showNotification;
					call MRH_fnc_toBriefing;
					sleep 10;
					call MRH_fnc_resetSeats;
			}] RemoteExec ["Spawn",[0,-2]select isDedicated];
	};
	case (_action =="VictoryCutScene"):{call MRH_fnc_victoryRTB};
};