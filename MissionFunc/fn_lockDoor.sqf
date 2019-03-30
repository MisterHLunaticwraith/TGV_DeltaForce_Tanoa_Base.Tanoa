// [this,1,keypadOne,{true},true] call MRH_fnc_lockDoor;
params ["_building","_doorNumber","_keypad",["_conditionOpen",{true}],["_isLocked",false]];
_parametersToPass = [_building,_doorNumber,_keypad,_conditionOpen];
_building setVariable ["TGV_Door_InitParams",_parametersToPass,true];
/*
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */
 _doorNumber = str _doorNumber;
 _DoorString = "BIS_disabled_Door_" + _doorNumber;
 _doorAnimString = "Door_"+_doorNumber + "_rot";
 if (_isLocked) then {
	 _building setVariable [_DoorString, 1, true];
	 _building setVariable ["TGV_isLocked",true,true];
	 };
_isLockedVar = _building getVariable ["TGV_isLocked",false];

 _statementActionOpen = {
	 _parameters = _this select 2;
	 _building = _parameters select 0;
	 _keypad = _parameters select 1;
	 _DoorString = _parameters select 2;
	 _building setVariable [_DoorString, 0, true];
	 _building setVariable ["TGV_isLocked",false,true];
	 playSound3D [MISSION_ROOT +"media\sounds\MRH_DOOR_AccessGranted.ogg",_keypad];
	 [[_building,_keypad],{
		 params ["_building","_keypad"];
		 [_keypad, 0,["ACE_MainActions","TGV_OpenDoor"]] call ace_interact_menu_fnc_removeActionFromObject;
		_parameters = _building getVariable "TGV_Door_InitParams";
		_parameters call MRH_fnc_lockDoor;
	 }] remoteExec ["Call",0,true];
	 };
 _actionOpen = ["TGV_OpenDoor","Dévérouiller la porte","",_statementActionOpen,_conditionOpen,{},[_building,_keypad,_DoorString],[0,0,0],1,[false, false, false, false, false],{}];
 _statementActionLock = {
	 _parameters = _this select 2;
	 _building = _parameters select 0;
	 _keypad = _parameters select 1;
	 _DoorString = _parameters select 2;
	 _doorAnimString = _parameters select 3;
	 _building setVariable [_DoorString, 1, true];
	 _building animate [_doorAnimString, 0];
	 _building setVariable ["TGV_isLocked",true,true];
	  playSound3D [MISSION_ROOT +"media\sounds\MRH_DOOR_DoorLocked.ogg",_keypad];
	 [[_building,_keypad],{
		 params ["_building","_keypad"];
		 [_keypad, 0,["ACE_MainActions","TGV_LockDoor"]] call ace_interact_menu_fnc_removeActionFromObject;
		_parameters = _building getVariable "TGV_Door_InitParams";
		_parameters call MRH_fnc_lockDoor;
	 }] remoteExec ["Call",0,true];
 };
  _actionLock = ["TGV_LockDoor","Vérouiller la porte","",_statementActionLock,_conditionOpen,{},[_building,_keypad,_DoorString,_doorAnimString],[0,0,0],1,[false, false, false, false, false],{}];
  _action = [_actionLock,_actionOpen] select _isLockedVar;
  _action call ace_interact_menu_fnc_createAction;
/*
 * Argument:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY> (Example: `["ACE_SelfActions", "ACE_Equipment"]`)
 * 3: Action <ARRAY>
 */
 [_keypad,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;