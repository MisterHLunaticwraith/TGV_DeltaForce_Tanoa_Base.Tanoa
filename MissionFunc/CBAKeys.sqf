#include "\a3\editor_f\Data\Scripts\dikCodes.h"
["TGV - Admin","TGV_Admin_ChooseRSScheme_openKey" ,["Ouvrir le choix du type de respawn", ""],{if(serverCommandAvailable "#kick")then {call MRH_fnc_fillDeathChoiceInterface}},{},[DIK_NUMPADPLUS , [true, true, false]]] call CBA_fnc_addKeybind;

["TGV - Admin","TGV_Admin_endBriefingMenu_openKey" ,["Ouvrir le menu de rappel des joueurs", ""],{
	if (serverCommandAvailable "#kick") then {call MRH_fnc_fillRTBchoice}
	},{},[DIK_NUMPADSTAR , [true, true, false]]] call CBA_fnc_addKeybind;