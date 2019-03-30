params [["_haveHostage",false]];

_allTargetsToHide = [targetCQC_1,targetCQC_2,targetCQC_3,targetCQC_4,targetCQC_5,targetCQC_6,targetCQC_7,targetCQC_8,targetCQC_9];
_allTargetsToReplace = [targetCQC_1,targetCQC_2,targetCQC_3,targetCQC_4,targetCQC_5,targetCQC_6];
_loadOut = [["rhs_weap_ak74","rhs_acc_dtk","","",["rhs_30Rnd_545x39_AK",30],[],""],[],[],["U_Rangemaster",[["rhs_30Rnd_545x39_AK_green",2,30]]],["LOP_V_CarrierLite_BLK",[]],[],"H_PASGT_basic_black_F","",[],["","","","","",""]];

{
[[_x],{params ["_toHide"];_toHide hideObjectGlobal true}] RemoteExec ["Call",2];
} ForEach _allTargetsToHide;

_allSpawnedLiveTargets = [];
{
	_pos = getPosATL _x;
	_dir = getDir _x;
	
	
	_grp = createGroup east;
	_unit = _grp createUnit ["LOP_ISTS_OPF_Infantry_SL",_pos, [], 0, "NONE"];   
	_unit setCombatMode "GREEN";
	_grp setBehaviour "SAFE";
	_unit setSpeedMode "LIMITED";
	_unit setDir _dir;
	_unit setUnitLoadout _loadOut;
	_allSpawnedLiveTargets pushBackUnique _unit;
	
} ForEach _allTargetsToReplace;
_hostage = "";
if (_haveHostage) then {
_hostage =  selectRandom _allSpawnedLiveTargets;
[_hostage, true] call ACE_captives_fnc_setSurrendered;
_hostage setUnitLoadout [[],[],[],["U_Rangemaster",[["FirstAidKit",1]]],["V_Safety_yellow_F",[]],[],"H_Cap_headphones","G_Tactical_Clear",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
_hostage addMPEventHandler ["MPKilled",
	{
		params ["_unit","_killer"];
		if ((player distance _unit) < 30) then {
		_ACEkiller = _unit getVariable ["ace_medical_lastDamageSource", objNull];
		hintC format ["Echec de l'entraînement, l'otage a été tué par %1",name _ACEkiller];
		
		};
	}];
};
missionNamespace setVariable ["MRH_TrainingRoomLiveTargets",_allSpawnedLiveTargets,true];