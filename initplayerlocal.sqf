waitUntil {(player == player) && (time>1)};
///Texte d'intro
//[] execVM "CoreScripts\introtext.sqf";
[] spawn {
["media\img\splashscreen.paa", 15] call MRH_fnc_SplashScreen;
};
/////=== ajoute des bouchons d'oreilles à l'inventaire du joueur
player addItemToUniform "ACE_EarPlugs";

 ///===execute la vidéo du logo TGV
//call TGV_fnc_splashVideoSkippable;

_goggles = [
	"G_Balaclava_blk", //Balaclava (Black)
	"G_Bandanna_aviator", //Bandana Aviator
	"G_Bandanna_beast", //Bandana Beast
	"G_Bandanna_blk", //Bandana Black
	"rhs_ess_black", // Ballistic goggles (Black)
	"rhsusf_shemagh_grn", //Shemag green
	"rhsusf_shemagh2_grn", //SHemag Green/Alt
	"rhsusf_shemagh_gogg_grn", //shemag w/Goggles green
	"rhsusf_shemagh2_gogg_grn", //shemag w/Goggles green/alt
	"rhsusf_oakley_goggles_blk", //SI Ballistic 2.0 Black
	"rhsusf_oakley_goggles_clr",  //SI Ballistic 2.0 clear
	"rhs_balaclava", //Balaclava
	"rhs_balaclava1_olive" //Balaclava (olive)
];
 [player,(selectRandom _goggles)] call MRH_fnc_forceFaceWear;


//spotter specific items
if !(isNil "spotter") then { //isNil "spotter"
if (player == spotter) then {
	{ 
		player addItem _x; 
	} forEach ["rhsusf_bino_lerca_1200_black","rhsusf_bino_leopold_mk4","rhsusf_bino_m24_ARD"];
};
};
//sniper specific items
if !(isNil "sniper") then {
if (player == sniper) then {
	{ 
	player addItemToBackpack _x; 
	} forEach ["rhsusf_acc_premier_low","rhsusf_bino_lerca_1200_black","rhsusf_bino_leopold_mk4","rhsusf_bino_m24_ARD","rhsusf_acc_premier"];
};
};
//marksman specific items
if ((str player) in  ["p7","p7_2"]) then {
	player addItemToUniform "rhsusf_acc_premier_low";
};

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_respawnScheme = missionNamespace getVariable ["TGV_DEVGRU_RespawnScheme","NormalRespawn"];
	if (_respawnScheme == "CapturedRespawn") then {
		[_corpse] spawn {sleep 10; deleteVehicle (_this select 0) select 0};
	};
	Diag_log format ["generated corpse %1",_corpse];
	//_corpse setVariable ["TGV_isCorpseOf",_unit,true];
	//[_corpse ]
	[] spawn MRH_fnc_onPlayerKilled;
}];
_uid = getPlayerUID player;
if (_uid == "76561197973693960") then {player addItem "TGV_KeyCard"};
player addItem "MRH_SoldierTab";
_data = ["TGV_TanoaDelta_Background","TGV_Tanoa_Delta_BaseGuides","TGV_V_JeanClaudeDiBongo","TGV_Encyclopedia_DeltaForce","TGV_AcreGuide"];
_pics = ["TGV_RadiosAddon","TGV_ComsigAddon","TGV_V_JeanClaudeDiBongo"];
if ((str player) in  ["p7","p7_2","sniper","spotter"]) then {_data pushBackUnique "TGV_SniperRiflesUS"; _pics append ["TGV_pvs27","TGV_sniperm107","TGV_M14EBR","TGV_M24","TGV_M40A5","TGV_M107","TGV_M2010","TGV_MK11SR25"];};



// channels accessibles
findDisplay 46 displayAddEventHandler ["KeyDown", 
{
if (inputAction "showMap" >0) then 
	{
		if (player inArea triggerMapChannels) then {{_x enableChannel true} forEach [0,1,2,4,5,6]} else {{_x enableChannel false} forEach [0,1,2,4,5,6]};
		if (vehicle player != player) then {4 enableChannel true};
	};
}];

[] execVM "MHQ_funcs.sqf";

MRH_player = player;
addMissionEventHandler ["PlayerViewChanged", {
	params [
		"_oldUnit", "_newUnit", "_vehicle",
		"_oldCamera", "_newCamera", "_uav"
	];
	if (_newCamera == player) exitWith {MRH_player = player};
	if (_newCamera isKindOf "Man") exitWith {MRH_player = _newCamera};
	if !(_newCamera isKindOf "Man") exitWith {MRH_player = leader group _newCamera};
}];
//sleep 10;
[player,_data]call MRH_fnc_MilsimTools_SoldierTab_attributeData;
[player,_pics]call MRH_fnc_MilsimTools_SoldierTab_attributePictures;
//zeus specific intel 
if !(isNil "GameZeus") then {
	if (player == GameZeus) then {[player,["TGV_ZeusGuides"]]call MRH_fnc_MilsimTools_SoldierTab_attributeData;};
};
if !(isNil "GameZeus_2") then {
	if (player == GameZeus_2) then {[player,["TGV_ZeusGuides"]]call MRH_fnc_MilsimTools_SoldierTab_attributeData;};
};
["Init player local done: playing video"] call MRH_fnc_MilsimTools_DebugTools_trace;
_firstInit = profileNameSpace getVariable ["TGV_TanoaMissionFirstInit",true];
_pathToVid = "\TGV_Assets\videos\TGVDeltaForceTanoIntro.ogv";
if (_firstInit) then 
{
	player setPos (position introStartPos);
	[{[_this]  spawn BIS_fnc_playVideo  }, "\TGV_Assets\videos\TGVDeltaForceTanoIntro.ogv", 10] call CBA_fnc_waitAndExecute;
	[
	{	
		profileNameSpace setVariable ["TGV_TanoaMissionFirstInit",false];
		saveProfileNameSpace;
		execVM "introscript\credits.sqf";
		[[player],
		{
			params ["_player"];
			
			[(getPosASL briefscreen) vectorAdd [0,0,3000],[_player]] call MRH_fnc_MilsimTools_ZeusModules_startHaloJump;
		}] remoteExec ["Call",2];
		
	}, [], 318] call CBA_fnc_waitAndExecute;//318
	//["\TGV_Assets\videos\tgv.ogv", [10, 10]]  spawn BIS_fnc_playVideo 
	//
}
else
{
	[{[_this] spawn BIS_fnc_titlecard; }, "\TGV_Assets\videos\TGVDeltaForceTanoIntro.ogv", 10] call CBA_fnc_waitAndExecute;
	
};

