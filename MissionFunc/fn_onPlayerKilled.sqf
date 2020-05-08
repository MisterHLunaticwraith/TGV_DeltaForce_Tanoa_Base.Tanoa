waitUntil {alive player};
_respawnScheme = missionNamespace getVariable ["TGV_DEVGRU_RespawnScheme","NormalRespawn"];
if (_respawnScheme == "NormalRespawn") exitWith {
		player setPosATL (getPosATL respawn_west);
	removeAllWeapons player;
	removeGoggles player;
	removeHeadgear player;
	removeVest player;
	removeUniform player;
	removeAllAssignedItems player;
	clearAllItemsFromBackpack player;
	removeBackpack player;
	player setUnitLoadout(player getVariable["Saved_Loadout",[]]);
	BIS_fnc_feedback_allowPP = false;

					[true] call acre_api_fnc_setSpectator;
						["exitSpect", "onEachFrame", {

						if (inputAction "ReloadMagazine" > 0) exitWith { 
						["Terminate"] call BIS_fnc_EGSpectator; 
						[false] call acre_api_fnc_setSpectator;
						BIS_fnc_feedback_allowPP = true;
						["exitSpect", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; //  Remove the stackedEventHandler as we no longer need it
						};
						}] call BIS_fnc_addStackedEventHandler;
					["Initialize", [player, [side player], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
					hintSilent "Appuyez sur R pour quitter le mode spectateur";
	
};
if (_respawnScheme == "RTBRespawn") exitWith {call MRH_fnc_RTBRespawn;};
if (_respawnScheme == "BodyBagRespawn") exitWith {};
if (_respawnScheme == "ReturnPlayerToBase") exitWith {
	[player] call MRH_fnc_MilsimTools_Core_SetRevived;
	player setPosATL (getPosATL jipaccess);
	[] spawn MRH_fnc_fastTravelMap;
};
//
_allEnemies = [];

{
	if (alive _x && (side _x == east) && ([_x] call ace_common_fnc_isAwake)&&((vehicle _x)== _x)) then {_allEnemies pushBackUnique _x};
} forEach allUnits;
if (_allEnemies isEqualTo []) exitWith {systemchat "no enemies found"};
//
_isZeus = false;
if !(isNil "GameZeus") then {if (player == GameZeus) exitWith {[player] call MRH_fnc_MilsimTools_Core_SetRevived;_isZeus = true;}};
if !(isNil "GameZeus_2") then {if (player == GameZeus_2) exitWith {[player] call MRH_fnc_MilsimTools_Core_SetRevived;_isZeus = true;}};
if (_isZeus) exitWith {};
//safety for zeus for some reason it unassigns the curator
[[player],{
	params ["_player"];
	_curator = getAssignedCuratorLogic _player;
	waitUntil {isNull (getAssignedCuratorLogic _player)};
	_player assignCurator _curator;
}] RemoteExec ["Spawn",2];
//
_loadout = getUnitLoadout player;
player setVariable ["TGV_DEVGRU_Mission_LoadOutBeforeCaptive", _loadout];
removeAllWeapons player;
sleep 0.5;
[player] call MRH_fnc_removeAcreRadios;
sleep 0.5;
[player, true] call ACE_captives_fnc_setHandcuffed;


["ace_captiveStatusChanged", {
	_loadout= player getVariable "TGV_DEVGRU_Mission_LoadOutBeforeCaptive";
	player setUnitLoadout _loadout;
	_taskName = "TGV_Free_" + name player;
	[_taskName, "SUCCEEDED", true] call BIS_fnc_taskSetState;
	deleteMarker (str player);
	_eh = player getVariable "TGV_RespawnCaptive_SpectatorAccessEH";
	(findDisplay 46) displayRemoveEventHandler ["keyDown",_eh];
	[[player],{ params ["_unit"];_unit switchMove ""}] remoteExec ["call",0];
	[_taskName] spawn {params ["_taskName"];sleep 10; [_taskName,true] call BIS_fnc_deleteTask };
}] call CBA_fnc_addEventHandler;





[[name player],
{
 params ["_captured"];

 _message = format ["%1 a été capturé par l'ennemi, il est détenu quelque part!", _captured];
 ["HasBeenCaptured",[_message]] call BIS_fnc_showNotification;
}] remoteExec ["Spawn",[0,-2] select isDedicated];


_pos = getPos (selectRandom _allEnemies);
_pos = _pos vectorAdd [0,2,0];
player setPos _pos;
[player] call MRH_fnc_MilsimTools_Core_SetRevived;

//[player, "Acts_ExecutionVictim_Loop", 1] call ace_common_fnc_doAnimation;
_marker = createMarker [str player, position player];
_marker setMarkerColor "ColorOrange";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [100, 100];
_marker setMarkerBrush "DIAGGRID";
_markerPosNew = (position player) vectorAdd [random [-70,35,70],random [-70,35,70],0];
_marker setMarkerPos _markerPosNew;
/*
_text = format ["Zone où est détenu %1",name player];
_marker setMarkerText _text;
*/
hintC "Laissé pour mort vous avez été capturé par l'ennemi. Vous ne pouvez plus agir avant d'avoir été libéré par vos alliés.Vos radios et armes ont été confisquées. Durant votre captivité vous pouvez cependant accéder au mode spectateur en ouvrant votre carte.";
_taskName = "TGV_Free_" + name player;
_taskTitle = format ["Libérez %1",name player];
_taskText = format ["%1 a subit de graves blessures, laissé pour mort il a été capturé par l'ennemi, vous devez le libérer.La zone générale dans laquelle il est retenu a été marquée sur votre carte.",name player];
_eh = (findDisplay 46) displayAddEventHandler ["KeyDown",{
	if (inputAction "showMap">0) then {
					openMap false;
					BIS_fnc_feedback_allowPP = false;

					[true] call acre_api_fnc_setSpectator;
						["exitSpect", "onEachFrame", {

						if (inputAction "ReloadMagazine" > 0) exitWith { 
						["Terminate"] call BIS_fnc_EGSpectator; 
						[false] call acre_api_fnc_setSpectator;
						BIS_fnc_feedback_allowPP = true;
						["exitSpect", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; //  Remove the stackedEventHandler as we no longer need it
						};
						}] call BIS_fnc_addStackedEventHandler;
					["Initialize", [player, [side player], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
					hintSilent "Appuyez sur R pour quitter le mode spectateur";
	};

}];
player setVariable ["TGV_RespawnCaptive_SpectatorAccessEH",_eh];
[[player],{ params ["_unit"];_unit switchMove "Acts_ExecutionVictim_Loop"}] remoteExec ["call",0];
sleep 5;
_taskCreated = [true, _taskName ,[_taskText,_taskTitle,_marker], _marker, true, 1, true, "search", false] call BIS_fnc_taskCreate;

