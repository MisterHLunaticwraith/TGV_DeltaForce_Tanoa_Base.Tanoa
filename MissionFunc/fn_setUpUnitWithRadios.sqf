//[player] call MRH_fnc_setUpUnitWithRadios
params ["_unit"];
private _settings = [_unit] call MRH_fnc_findUnitRadioSettings;
_leftOut = [_unit] call MRH_fnc_giveRadios;
_settings params ["_soldierString","_radios",["_channels",[]]];

[
    {
        params ["_channels","_radios"];

		[_channels,_radios] call MRH_fnc_configRadios;
    }, 
    [_channels,_radios], 
    1
] call CBA_fnc_waitAndExecute;

_message = "Je vous ai donné et réglé les radios";
if !(_leftOut isEqualTo [])then {_message = "Vous n'aviez pas la place pour les radios suivantes: " + (_leftOut joinString "-") + "Faites de la place, revenez et je vous rerègle ça!"};
_message