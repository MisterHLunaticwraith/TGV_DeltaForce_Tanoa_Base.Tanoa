[] spawn {
	disableSerialization;
	createDialog "MRHDeathChoice";
#define FDIS(ARG) ((finddisplay 040918) displayCtrl ##ARG##)
_textZone = FDIS(1100);
_textZone ctrlSetStructuredText parseText "Choisir l'action à appliquer";
_combo = FDIS(2100);
waitUntil {ctrlShown _combo};
_index = _combo lbAdd "Amener tout le monde à la salle de briefing";
_combo lbSetData [_index,"BringToBrief"];
_index2 = _combo lbAdd "Lancer la cutscene de victoire";
_combo lbSetData [_index2,"VictoryCutScene"];
_combo lbSetCurSel _index2;
_button = FDIS(1600);
_button buttonSetAction "
_value = (lbData [2100,(lbcursel 2100)]);
[_value] call MRH_fnc_applyRTBAction;
closeDialog 0;
";
};