// [this] execVM "isTrainingRoomCtrlComputer.sqf";
params ["_object"];


_action1 =["CommencerSimu","Lancer la simulation (cibles fixes)", "",{execVM "startsimu.sqf"},{true},{},[], [0,0,0], 5] call ace_interact_menu_fnc_createAction;
 [_object, 0, ["ACE_MainActions"], _action1] call ace_interact_menu_fnc_addActionToObject; 
 
 _action2 =["TerminerSimu","Terminer la simulation (cibles fixes)", "",{execVM "stopsimu.sqf"},{true},{},[], [0,0,0], 5] call ace_interact_menu_fnc_createAction;
 [_object, 0, ["ACE_MainActions"], _action2] call ace_interact_menu_fnc_addActionToObject;
 
 _action3 =["CommencerSimuReal","Lancer la simulation (A balles réelles)", "",{execVM "startsimu.sqf";execVM "livetargets.sqf";},{true},{},[], [0,0,0], 5] call ace_interact_menu_fnc_createAction;
 [_object, 0, ["ACE_MainActions"], _action3] call ace_interact_menu_fnc_addActionToObject; 
 
 _action4 =["TerminerSimuReal","Terminer la simulation (A balles réelles)", "",{execVM "stopsimu.sqf";execVM "endliveexercice.sqf";},{true},{},[], [0,0,0], 5] call ace_interact_menu_fnc_createAction;
 [_object, 0, ["ACE_MainActions"], _action4] call ace_interact_menu_fnc_addActionToObject; 
 
  _action5 =["CommencerSimuRealWithHost","Lancer la simulation (A balles réelles, avec otage à libérer)", "",{execVM "startsimu.sqf";[true] execVM "livetargets.sqf";},{true},{},[], [0,0,0], 5] call ace_interact_menu_fnc_createAction;
 [_object, 0, ["ACE_MainActions"], _action5] call ace_interact_menu_fnc_addActionToObject; 