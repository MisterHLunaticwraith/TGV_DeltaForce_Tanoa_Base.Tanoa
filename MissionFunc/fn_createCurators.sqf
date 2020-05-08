if !(isServer) ExitWith {};




_MRH_Zeus_logicSide = createCenter sideLogic;
missionNamespace setVariable ["TGV_Zeus_SideLogic",_MRH_Zeus_logicSide,true];
_MRH_Zeus_logicGrp = createGroup _MRH_Zeus_logicSide;
missionNamespace setVariable ["TGV_Zeus_logicGrp",_MRH_Zeus_logicGrp,true];



_MRH_Zeus_Module = _MRH_Zeus_logicGrp createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];
_MRH_Zeus_Module setVariable ["showNotification", false, true];
_MRH_Zeus_Module setVariable ["birdType", "", true];
_MRH_Zeus_Module setVariable ["Owner", "76561197973693960", true];
_MRH_Zeus_Module setVariable ["Addons", 3, true];
_MRH_Zeus_Module setVariable ["Forced", 0, true];
_MRH_Zeus_Module setVariable ["name", "Zeus Mister H.", true];
missionNamespace setVariable ["MRH_Zeus_Module",_MRH_Zeus_Module,true];
_MRH_Zeus_Module setVehicleVarName "MRH_Zeus_Module";
_MRH_Zeus_Module call BIS_fnc_objectVar;


_ADMIN_Zeus_Module = _MRH_Zeus_logicGrp createUnit ["ModuleCurator_F",[1,0,0] , [], 0, ""];
_ADMIN_Zeus_Module setVariable ["showNotification", false, true];
_ADMIN_Zeus_Module setVariable ["birdType", "", true];
_ADMIN_Zeus_Module setVariable ["Owner", "#adminLogged", true];
_ADMIN_Zeus_Module setVariable ["Addons", 3, true];
_ADMIN_Zeus_Module setVariable ["Forced", 0, true];
_ADMIN_Zeus_Module setVariable ["name", "Zeus Admin", true];
missionNamespace setVariable ["TGV_Admin_Zeus_Module",_Admin_Zeus_Module,true];
_ADMIN_Zeus_Module setVehicleVarName "TGV_Admin_Zeus_Module";
_ADMIN_Zeus_Module call BIS_fnc_objectVar;

/*
_PLAYERSLOT_Zeus_Module = _MRH_Zeus_logicGrp createUnit ["ModuleCurator_F",[2,0,0] , [], 0, ""];
_PLAYERSLOT_Zeus_Module setVariable ["showNotification", false, true];
_PLAYERSLOT_Zeus_Module setVariable ["birdType", "", true];
_PLAYERSLOT_Zeus_Module setVariable ["Owner", "GameZeus", true];
_PLAYERSLOT_Zeus_Module setVariable ["Addons", 3, true];
_PLAYERSLOT_Zeus_Module setVariable ["Forced", 0, true];
_PLAYERSLOT_Zeus_Module setVariable ["name", "Zeus joueur", true];
missionNamespace setVariable ["TGV_Player_Zeus_Module",_PLAYERSLOT_Zeus_Module,true];
_PLAYERSLOT_Zeus_Module setVehicleVarName "TGV_Player_Zeus_Module";
_PLAYERSLOT_Zeus_Module call BIS_fnc_objectVar;

_PLAYERSLOT2_Zeus_Module = _MRH_Zeus_logicGrp createUnit ["ModuleCurator_F",[2,0,0] , [], 0, ""];
_PLAYERSLOT2_Zeus_Module setVariable ["showNotification", false, true];
_PLAYERSLOT2_Zeus_Module setVariable ["birdType", "", true];
_PLAYERSLOT2_Zeus_Module setVariable ["Owner", "GameZeus_2", true];
_PLAYERSLOT2_Zeus_Module setVariable ["Addons", 3, true];
_PLAYERSLOT2_Zeus_Module setVariable ["Forced", 0, true];
_PLAYERSLOT2_Zeus_Module setVariable ["name", "Zeus joueur 2", true];
missionNamespace setVariable ["TGV_Player_Zeus_Module_2",_PLAYERSLOT2_Zeus_Module,true];
_PLAYERSLOT2_Zeus_Module setVehicleVarName "TGV_Player_Zeus_Module_2";
_PLAYERSLOT2_Zeus_Module call BIS_fnc_objectVar;
*/
{

_x addCuratorEditableObjects [(allMissionObjects "All"),true];
_x addEventHandler ["CuratorObjectPlaced", 
	{
		params ["_curator", "_entity"];
		{
			_x addCuratorEditableObjects [[_entity],true];
		} forEach allCurators;

	}];
} forEach allCurators;

[[],{
waitUntil {time >1};
{
	[_x, ["MRHJipMenu\gui\jipicon.paa", [1,1,1,1], position briefingguy, 2, 2, 0, "Prenez possession de cet officier pour les briefings", 1, 0.05, "TahomaB"], true ] call BIS_fnc_addCuratorIcon;
} forEach allCurators;

}]remoteExec ["Spawn",0];