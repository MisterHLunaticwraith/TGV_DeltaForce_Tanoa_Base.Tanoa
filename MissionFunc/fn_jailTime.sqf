params ["_instigator"];
if !(isPlayer _instigator) exitWith {};
[_instigator,
{
	private _saveloadout = getUnitLoadout MRH_player;
	MRH_player setPosATL (getPosATL jailpos);
	
	
	[]spawn {sleep 1; MRH_player setUnitLoadout [[],[],[],[],[],[],'','',[],['','','','','','']]};
	hintC "Vous êtes condamné à 1 minute au trou vilain!";
	
	[MRH_player, true] call ACE_captives_fnc_setHandcuffed;
	MRH_player action ["sitDown", MRH_player];
	[
    {
		params ["_ld","_player"];
		_player setPosATL (getPosATL outtajail);
		_player setUnitLoadout _ld;
		[_player, false] call ACE_captives_fnc_setHandcuffed;
		hintC "Et que ça vous serve de leçon";
		
    }, 
    [_saveloadout,MRH_player], 
    60
] call CBA_fnc_waitAndExecute;
	
}] remoteExec ["Call",_instigator,false];