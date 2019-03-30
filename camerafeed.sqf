/* creates a simple camera and sends the feed to a screen
eg 
execVM [MyCameraObject,MytargetObject,MyScreen,"UNIQUEFEEDID"] ExecVM "camera.sqf"

*/
params ["_cameraobject","_target","_screen","_feedID"];

  _camera = "camera" camCreate (getposATL _cameraobject);  
  
 _camera cameraEffect ["internal","back",_feedID];  
 _camera camCommand "inertia on"; 
 _camera camPrepareTarget _target; 
 _camera camPrepareFOV 0.5; 
 _camera camCommitPrepared 0;
 

_feedID setPiPEffect [0]; 

_feedprocessed = "#(argb,512,512,1)r2t(" + _feedID +",1.0)";

_screen setObjectTexture [0, _feedprocessed];
