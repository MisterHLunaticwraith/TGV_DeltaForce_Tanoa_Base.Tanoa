/*
red =[0.5, 0, 0]
*/
params ["_source","_colour"];
_changeLight = _source getVariable "MRH_LightSource_object";


if !(isNull _changeLight) then {deleteVehicle _changeLight};
_light = "#lightpoint" createVehicle (position _source); 
_light setLightDayLight true;
_light setLightBrightness 0.3; 
//_light setLightIntensity 4;

_light setLightAmbient _colour; 
_light setLightColor _colour; 
_light lightAttachObject [_source, [0,0,0]];
_source setVariable ["MRH_LightSource_object", _light];