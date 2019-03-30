params ["_instigator"];
if !(isPlayer _instigator) exitWith {};
[_instigator,
{
	_saveloadout = getUnitLoadout player;
	player setPosATL (getPosATL jailpos);
	player setUnitLoadout [[],[],[],[],[],[],'','',[],['','','','','','']];
	hintC "Vous êtes condamné à 1 minutes au trou vilain!";
	sleep 60;
	player setPosATL (getPosATL outtajail);
	player setUnitLoadout _saveloadout;
	hintC "Et que ça vous serve de leçon";
}]call MRH_fnc_MilsimTools_Core_RemoteExecForGivenPlayer;