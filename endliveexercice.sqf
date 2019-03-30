_allBodiesToDelete = missionNamespace getVariable ["MRH_TrainingRoomLiveTargets",[]];
{
	deleteVehicle _x;
} ForEach _allBodiesToDelete;

_allTargetsToShow = [targetCQC_1,targetCQC_2,targetCQC_3,targetCQC_4,targetCQC_5,targetCQC_6,targetCQC_7,targetCQC_8,targetCQC_9];
{
[[_x],{params ["_toHide"];_toHide hideObjectGlobal false}] RemoteExec ["Call",2];
} ForEach _allTargetsToShow;

{
	if ((_x distance targetCQC_1) < 25) then 
		{
			_player = _x;
			_playerUid = getPlayerUID _player;
			_player = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID; 
			[_player, _player] call ACE_medical_fnc_treatmentAdvanced_fullHeal; 
	

			[_playerUid,
			{
				["MRH_BeenHealed",["Le médecin vous a soigné à l'issue de cet exercice"]] call BIS_fnc_showNotification;

			},[]] call MRH_fnc_MilsimTools_Core_RemoteFor;
		};
} forEach allPlayers;