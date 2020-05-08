if (isServer && isDedicated) ExitWith {};
params ["_SourceObject","_spreadDistance"];
[_SourceObject,_spreadDistance] spawn {
waitUntil {player == player};
params ["_SourceObject","_spreadDistance"];
_trg = createTrigger ["EmptyDetector", getPos _SourceObject, false];
_trg setTriggerArea [_spreadDistance, _spreadDistance, 0, false,5];
_trg setTriggerActivation ["VEHICLE", "PRESENT", true];
_trg triggerAttachVehicle [player];
_trg setTriggerStatements ["this", 
"
execVM 'trainingroomcams.sqf';
"
, "execVM 'resettrainingroomcams.sqf'"];
};