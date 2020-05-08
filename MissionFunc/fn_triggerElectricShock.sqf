params ["_thisTrigger","_thislist",["_gate",objNull]];
if !(isServer) exitWith {};
{
	if (_x inArea _thisTrigger) then
	{
		private _condition = {
			params ["_unit","_trigger","_gate"];
			((_unit inArea _trigger) && ([_gate,"1"]call MRH_fnc_MilsimTools_Core_isLockedDoor));

		};
		private  _parameters = [_x,_thisTrigger,_gate];
		[[_x,_condition,_parameters],MRH_fnc_electricShock] remoteExec ["Call",_x];
	};

}forEach _thisList;