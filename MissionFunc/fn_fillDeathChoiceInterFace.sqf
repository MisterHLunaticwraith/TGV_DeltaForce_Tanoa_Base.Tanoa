[] spawn {
	
	disableSerialization;
	createDialog "MRHDeathChoice";
#define FDIS(ARG) ((finddisplay 040918) displayCtrl ##ARG##)
_combo = FDIS(2100);
waitUntil {ctrlShown _combo};
_index = _combo lbAdd "Rien (retour au respawn bunker,défaut)";
_combo lbSetData [_index,"NormalRespawn"];
_index2 = _combo lbAdd "Capturé par l'ennemi";
_combo lbSetData [_index2,"CapturedRespawn"];
_index3 = _combo lbAdd "Retour de tous les joueurs à la base (échec de la mission)";
_combo lbSetData [_index3,"RTBRespawn"];
_index4 = _combo lbAdd "Respawn sur base si sac mortuaire";
_combo lbSetData [_index4,"BodyBagRespawn"];
_index5 = _combo lbAdd "Retour du joueur sur base.";
_combo lbSetData [_index5,"ReturnPlayerToBase"];


_combo lbSetCurSel _index;
_button = FDIS(1600);
_button buttonSetAction "
_value = (lbData [2100,(lbcursel 2100)]);
missionNameSpace setVariable ['TGV_DEVGRU_RespawnScheme',_value,true];
systemChat format ['Mode de respawn sélectionné:%1',_value];
[_value] call MRH_fnc_changedRSPScheme;
closeDialog 0;
";
};