_savedLoadOuts = profileNameSpace getVariable ["TGV_saved_loadouts_TanoaDelta",[]];

_foundPreviousLoadOut = false;
_newloadout = [];
{
	_x params ["_slot","_loadout"];
	if  ((str player) == _slot) then {_foundPreviousLoadOut = true;_newloadOut = _loadout};
}forEach _savedLoadOuts;
if !(_foundPreviousLoadOut)exitWith {
		[{hintC "Aucun équipement sauvegardé pour ce slot";}, [], 1] call CBA_fnc_waitAndExecute;
		
		_dbg=format ["No savedloadout found for  %1,current list : %2",str player,_savedLoadOuts];
				[
					_dbg
				] call MRH_fnc_MilsimTools_DebugTools_trace;
		};
player setUnitLoadout _newloadout;
[{hintC "Equipement chargé";}, [], 1] call CBA_fnc_waitAndExecute;
_dbg2=format ["Saved loadout found for  %1,loadout equiped : %2",str player,_newloadOut];
[
	_dbg2
] call MRH_fnc_MilsimTools_DebugTools_trace;
