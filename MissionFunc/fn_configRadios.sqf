params ["_channels","_radios"];
#define LEFT -1
#define RIGHT 1
#define CENTER 0

_channels params [
	["_channel343",1],
	["_channel152",1],
	["_channel117",1]
];

_radiosArray =[];
_count = count _radios;
_volume343 = 1/_count;
_volume152 = (1/_count)*2;
_volume117 = 1;
_ears = [CENTER,LEFT,RIGHT];
_ear343 = CENTER;
if (_count >1) then {_ear343 = LEFT;};

_ear152 = RIGHT;
if (_count isEqualTo 3) then {_ear152 = LEFT};
_ear117 = RIGHT;

if (("ACRE_PRC343") in _radios) then {
private _radio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
[_radio, _channel343] call acre_api_fnc_setRadioChannel;
_radiosArray pushBackUnique "ACRE_PRC343";
_handle =[_ear343,_radio] call acre_sys_core_fnc_switchRadioEar;
[_radio,_volume343] call acre_api_fnc_setRadioVolume;

};

if (("ACRE_PRC152") in _radios) then {
private _radio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
[_radio, _channel152] call acre_api_fnc_setRadioChannel;
_radiosArray pushBackUnique "ACRE_PRC152";
_handle =[_ear152,_radio] call acre_sys_core_fnc_switchRadioEar;
[_radio,_volume152] call acre_api_fnc_setRadioVolume;
};

if (("ACRE_PRC117F") in _radios) then {
private _radio = ["ACRE_PRC117F"] call acre_api_fnc_getRadioByType;
[_radio, _channel117] call acre_api_fnc_setRadioChannel;
_radiosArray pushBackUnique "ACRE_PRC117F";
_handle =[_ear117,_radio] call acre_sys_core_fnc_switchRadioEar;
[_radio,_volume117] call acre_api_fnc_setRadioVolume;
};

_success = [_radiosArray] call acre_api_fnc_setMultiPushToTalkAssignment;