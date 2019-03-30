params ["_object"];


_action1 =["OpenSharedMap","Acceder à la carte", "",{execVM "temporarymapallow.sqf"},{true},{},[], [0,0,0], 5] call ace_interact_menu_fnc_createAction;
 [_object, 0, ["ACE_MainActions"], _action1] call ace_interact_menu_fnc_addActionToObject; 