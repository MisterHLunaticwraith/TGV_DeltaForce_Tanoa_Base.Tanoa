params ["_unit"];
private _table = radiosTable;
private _settings = [];
{
	if (str _unit isEqualTo (_x select 0)) then {_settings = _x};
}forEach _table;
_settings