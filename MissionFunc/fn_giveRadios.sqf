params ["_unit"];
private _settings = [];
private _settings = [_unit] call MRH_fnc_findUnitRadioSettings;
if (_settings isEqualTo [])exitWith {systemChat "unité non trouvée dans la base de données";["ACRE_PRC343","ACRE_PRC152","ACRE_PRC117F"]};
_settings params ["_soldierString","_radios","_channels"];
_noRoom=
[_unit] call MRH_fnc_removeAcreRadios;
_cantAdd = [];
{
if (_unit canAdd _x) then {_unit addItem _x}else {_cantAdd pushBackUnique _x};

}forEach _radios;
_cantAdd