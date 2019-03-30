_savedLoadOuts = profileNameSpace getVariable ["TGV_saved_loadouts_TanoaDelta",[]];
_foundPreviousLoadOut = false;
{
	_x params ["_slot","_loadout"];
	if  ((str player) == _slot) then {_savedLoadOuts deleteAt (_savedLoadOuts find _x);_foundPreviousLoadOut = true};
}forEach _savedLoadOuts;
_savedLoadOuts pushBackUnique [str player,getUnitLoadout player];
profileNameSpace setVariable ["TGV_saved_loadouts_TanoaDelta",_savedLoadOuts];
saveProfileNamespace;

_dbg=format ["save loadout called. Previous loadout found and deleted: %1,new list : %2",str _foundPreviousLoadOut,_savedLoadOuts];
[
	_dbg
] call MRH_fnc_MilsimTools_DebugTools_trace;