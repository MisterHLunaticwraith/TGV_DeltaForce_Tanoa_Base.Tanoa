params ["_unit"];
_unit addEventHandler ["Hit",{
	params ["_unit", "_source", "_damage", "_instigator"];
	[_unit, _unit] call ACE_medical_fnc_treatmentAdvanced_fullHeal;
	[_instigator] call MRH_fnc_jailTime;
}];