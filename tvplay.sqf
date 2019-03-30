//[this,3] ExecVM "tvplay.sqf";
if (isServer && isDedicated) ExitWith {};
params ["_SourceObject","_spreadDistance"];
[_SourceObject,_spreadDistance] spawn {
waitUntil {player == player};
params ["_SourceObject","_spreadDistance"];
_trg = createTrigger ["EmptyDetector", getPosASL _SourceObject, false];
_trg setTriggerArea [_spreadDistance, _spreadDistance, 0, false,3];
_trg setTriggerActivation ["VEHICLE", "PRESENT", true];
_trg triggerAttachVehicle [player];
_trg setTriggerStatements ["this", 
"
_video = '\TGV_Assets\videos\TGV.ogv';

tvscreen setObjectTexture [0, _video];

_videoplaying = [_video, [10, 10]] call BIS_fnc_playVideo;
"
, ""];
_trg attachTo [_SourceObject,[0,0,0]];
};