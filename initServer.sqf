waitUntil{time>1};
//[[],{systemchat "Initserver lancé"}] RemoteExec["Spawn",0,true];
missionNameSpace setVariable ["TGV_DEVGRU_RespawnScheme","NormalRespawn",true];
execVM "ambientflybys.sqf";
"UnlockDummy" addPublicVariableEventHandler {
if(!isServer) exitWith {};
	{[[],{
         [5, dummycomputer, "DummyFile"] call MRH_fnc_DownloadFile; 
	}] RemoteExec["Spawn",_x,true];} forEach allplayers;
};

"DummyFile" addPublicVariableEventHandler {
if(!isServer) exitWith {};
	{[[],{
	//systemchat "EHfired";
         [5, dummycomputer, "UnlockDummy"] call MRH_fnc_Hack;
	}] RemoteExec["Spawn",_x,true];} forEach allplayers;
};

["ace_placedInBodyBag",{
	if !(isServer) exitWith {};
	_respawnScheme = missionNamespace getVariable ["TGV_DEVGRU_RespawnScheme","CapturedRespawn"];
	if (_respawnScheme != "BodyBagRespawn") exitWith {diag_log "pas de respawn par sac mortuaire"};
//_this  params [_target,_bodybag];
Diag_log format ["bodybag target %1", _target];
[str _target,_bodybag] spawn MRH_fnc_placedInBodyBag;
}] call CBA_fnc_addEventHandler;
[zomega,["TGV_V_JeanClaudeDiBongo"]] call MRH_fnc_MilsimTools_SoldierTab_attributeData;
[zomega,["TGV_V_JeanClaudeDiBongo","TGV_1_Situation","TGV_2_Mission","TGV_3_Execution","TGV_4_Personnels","TGV_5_PointsParticuliers"]] call MRH_fnc_MilsimTools_SoldierTab_attributePictures;
private _handle = [
	{
		params ["_proj"];
		["TGV_VideoProj",_proj]call MRH_fnc_MilsimTools_Core_playSound3Dlocal;
	},
	[videoProj],
	{},
	{params ["_proj"];(alive _proj && _proj getVariable ["TGV_projIsOn",true])},
	7
]call MRH_fnc_MilsimTools_Core_conditionalPFEH;