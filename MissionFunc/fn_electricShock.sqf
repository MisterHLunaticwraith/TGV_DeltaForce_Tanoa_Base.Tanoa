_this spawn {
	params ["_unit",["_condition",{true}],["_pm",[]]];
	if !(local _unit) exitWith {};
	if !(_pm call _condition) exitWith {};
	[_this,MRH_fnc_electricitySparks] RemoteExec ["Call",[0,-2] select isDedicated,false];
	playSound3D [(MISSION_ROOT +"media\sounds\MRH_electricity.ogg"),_unit];
	_coef = 1;
	_effect ={ 
	params ["_name", "_priority", "_effect", "_coef"]; 
	private  _handle = ppEffectCreate [_name, _priority];  
	_handle ppEffectEnable true; 
	_handle ppEffectForceInNVG true;
	_handle ppEffectAdjust _effect; 
	_handle ppEffectCommit (50*_coef); 
	_handle
	};

	_destroyEffects = {
		_handles = _this;
		
		{
			_x ppEffectEnable false; 
		ppEffectDestroy _x;
		}forEach _handles

	};
	private ["_handles","_handleBlur","_handleDBlur","_handleColors"];
	if (_unit == player) then {
	_handleBlur = ["RadialBlur", 1001, [0.5,0.5, 0.5, 0.5],_coef] call _effect;
	_handleDBlur = ["DynamicBlur", 100, [0.5],_coef] call _effect;
	_handleColors = ["ColorCorrections", 1500, [0, 0.4, 0, [0, 0, 0, 0], [1, 1, 1, 0], [1, 1, 1, 0]],_coef] call _effect;
	_handles = [_handleBlur,_handleDBlur,_handleColors];
	};
	enableCamShake true;

	for "_i" from 0 to 100 do {
		if !(_pm call _condition) exitWith 
		{ 
			if (_unit == player) then 
			{
				_handles call _destroyEffects;
			};	
		};
		private _damage = 0.001*_i;
		if (_i == 100) then {_damage = 1};
		[_unit, "body", _damage, objNull, "unknown" ,_damage, objNull] call ace_medical_fnc_handleDamage;
		if (_unit == player) then {
		addCamShake [_i/10,_i/10, _i/10];
		};
		sleep 0.1;
	};
	if (_unit == player) then {
	_handles call _destroyEffects;
	};
	
};
