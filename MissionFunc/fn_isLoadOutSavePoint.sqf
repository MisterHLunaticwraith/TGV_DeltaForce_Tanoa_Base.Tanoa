params ["_object"];

_statement = {
	call MRH_fnc_saveLoadOut;
	
	[{hintC "Equipement sauvegardé";}, [], 1] call CBA_fnc_waitAndExecute;
	};
_loc = "Sauvegarder l'équipement actuel"; 
_action =
["MRH_LoadOutSave_Action", 
_loc,
 "\MRHMarkers\paa\download.paa",
_statement , 
 {true},
 {},
 [],
 [0,0,1.7], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 

 _statement2 = {
	call MRH_fnc_loadLoadOut;
	
	};
_loc2 = "Charger l'équipement sauvegardé pour ce slot"; 
_action2 =
["MRH_LoadOutLoad_Action", 
_loc2,
 "\MRHMarkers\paa\changeclothes.paa",
_statement2 , 
 {true},
 {},
 [],
 [0,0,1.7], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action2] call ace_interact_menu_fnc_addActionToObject; 