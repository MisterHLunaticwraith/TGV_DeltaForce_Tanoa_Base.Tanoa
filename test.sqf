params [
			"_remote",
			["_screens",[]],
			["_extraSlides",[]]
		];

if (_screens isEqualTo []) exitWith {};
_screens pushBackUnique _remote;

_remote setVariable ["MRH_BriefingApp_ControlledScreens",_screens,true];
_remote setVariable ["MRH_BriefingApp_extraSlides",_extraSlides,true];

private _statement = {systemChat "dqsd"};
private _insertChildren ={
	private _actionConnect = ["MRH_connect_to","Connect Toconsole", "",{systemchat _this}, {true}, {},_this] call ace_interact_menu_fnc_createAction;
	[_actionConnect]
};
private _action =
[
	"MRH_BriefingRemotes_Actions", 
	"Controles de briefing",
 	"jipicon.paa",
	_statement, 
 	{true},
 	{},//_insertChildren, //insertChildrenCode
 	_this,
 	[0,0,0], 
 	5
 ] call ace_interact_menu_fnc_createAction;
 ////
 [_remote, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
