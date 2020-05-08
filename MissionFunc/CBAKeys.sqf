#include "\a3\editor_f\Data\Scripts\dikCodes.h"
["TGV - Admin","TGV_Admin_ChooseRSScheme_openKey" ,["Ouvrir le choix du type de respawn", ""],{if(serverCommandAvailable "#kick")then {call MRH_fnc_fillDeathChoiceInterface}},{},[DIK_NUMPADPLUS , [true, true, false]]] call CBA_fnc_addKeybind;

["TGV - Admin","TGV_Admin_endBriefingMenu_openKey" ,["Ouvrir le menu de rappel des joueurs", ""],{
	if (serverCommandAvailable "#kick") then {call MRH_fnc_fillRTBchoice}
	},{},[DIK_NUMPADSTAR , [true, true, false]]] call CBA_fnc_addKeybind;
/*
///---tostransfer
["MRH_MilsimTools_ST_BriefingRemote_overlay", "EDITBOX", ["Special overlay for briefing screens",""], "MRH_MilsimTools - Tablet settings","bandeauNewsTGV_ca.paa",1] call cba_settings_fnc_init;
["MRH_MilsimTools_ST_BriefingRemote_videosToPlay", "EDITBOX", ["Path to videos you can play on the screen",""], "MRH_MilsimTools - Tablet settings","\TGV_Assets\videos\TGVDeltaForceTanoIntro.ogv,\TGV_Assets\videos\TGV.ogv",1] call cba_settings_fnc_init;
*/