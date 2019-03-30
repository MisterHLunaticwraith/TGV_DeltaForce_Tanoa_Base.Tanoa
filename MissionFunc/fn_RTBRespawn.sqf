[[player],{params ["_killedPlayer"];
//send notif 
_message = format ["%1 a été tué, échec de la mission", name _killedPlayer];
 ["HasBeenKilled",[_message]] call BIS_fnc_showNotification;
// setBriefScreenTexture
briefScreen setObjectTexture [0,"media\img\deathscreen.jpg"];
call MRH_fnc_toBriefing;
}] remoteExec ["Spawn",[0,-2]select isDedicated];
