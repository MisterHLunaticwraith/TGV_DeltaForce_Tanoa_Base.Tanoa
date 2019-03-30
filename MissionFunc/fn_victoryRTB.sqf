[[],{
//send notif 
_message = "La mission est un succès vous allez être rapatrié sur base.";
 ["TGVVictory",[_message]] call BIS_fnc_showNotification;
// setBriefScreenTexture
briefScreen setObjectTexture [0,"media\img\victory.jpg"];

//nul= execVM "outroscript\endcredits.sqf"; //Affiche les crédits
[20, "TGV D.E.V.G.R.U. Afghanistan Tour", "Mr. H", "Une mission par et pour la team TGV", "<br/><br/>Cette mission est inspirée d'un contexte réel <br/> mais les faits relatés sont imaginaires.<br/><br/>", "Crédits musicaux: <br/><br/>The Chariot - The Trumpet  <br/><br/>Remerciements à Mrs H. pour les maths...<br/><br/>Scripts et artworks par Mr H.<br/><br/>Mods par leurs auteurs respectifs<br/><br/> Le mod TGV ExtraMods et le mod TGV Misc Assets sont des compilations de mod externes<br/> tout le crédit va à leurs auteurs respectifs.<br/><br/>Roster et module JIP par Mr H.<br/> Mr H. 2017"] call MRH_fnc_EndCredits;

//playSound ""; //joue la musique
if (isServer) then {
		_AllEligiblePlayers = [];
		{
			if ((side _x== west)&&([_x]call MRH_fnc_MilsimTools_Core_isAliveAndConscious)) then {_AllEligiblePlayers pushBackUnique _x};
		}forEach playableUnits;
		//allPlayers;
		_pos = [];
		if (_AllEligiblePlayers isEqualTo []) then {_pos =[] call BIS_fnc_randomPos} else {_pos = getPos (selectRandom _AllEligiblePlayers)};
		missionNamespace setVariable ["TGV_playersForCutscene",_AllEligiblePlayers,true];
		_posHCR = _pos vectorAdd [0,25,60];
		_heCr= [_posHCR,0,"RHS_UH60M_d",west] call BIS_fnc_spawnVehicle;
		_heli = _heCr select 0;
		missionNamespace setVariable ["TGV_successCutSceneHeli",_heli,true];
		_destination = _pos vectorAdd [0,25,0];
		_helipad = "Land_HelipadEmpty_F" createVehicle _destination;
		while { ( (alive _heli) && !(unitReady _heli) ) } do
		{
			sleep 1;
		};
		_heli land "GET IN";
		[_heli] spawn {
			params ["_heli"];
			 waitUntil {isTouchingGround _heli};
			 sleep 10; 
			 _heli doMove (position briefingPos);
			 sleep 20;
			 {deleteVehicle _x;}forEach crew _heli;
			deleteVehicle _heli; 
		};

};
//if (isServer && isDedicated) exitWith {};
_heli = missionNamespace getVariable "TGV_successCutSceneHeli";
_AllEligiblePlayers = missionNamespace getVariable "TGV_playersForCutscene";
_pos = [];
_availPlayers = true;
if (_AllEligiblePlayers isEqualTo []) then {_pos = _heli modelToWorld [0,50,0]; _availPlayers = false};
_dummy = "";
if !(_availPlayers) then {_dummy = "Land_HelipadEmpty_F" createVehicle _pos};


_target = "";
if !(_availPlayers) then {_target = _dummy} else {_target = selectRandom _AllEligiblePlayers};
//systemChat str _target;
_camera = "Land_HelipadEmpty_F" createVehicle (_target modelToWorld [0,-3,0.5]);
//===prise de vue CF Documentations "cutscene"
//Prise1 travel arriere et titre
///////////cam1/cam2/ cible /dur/foc1/foc2/attach/ x/y/ z /effet   /trans/durtrans
_allMoves=["Acts_AidlPercMstpSloWWrflDnon_warmup_6_loop","Acts_AidlPercMstpSlowWrflDnon_warmup03","Acts_AidlPercMstpSlowWrflDnon_warmup04","Acts_AidlPercMstpSnonWnonDnon_warmup_8_loop","Acts_Briefing_SB_In","Acts_ComingInSpeakingWalkingOut_11","Acts_ComingInSpeakingWalkingOut_9","Acts_Executioner_StandingLoop","Acts_GetAttention_End","Acts_JetsFlyoverCheering_1"];
MRH_insideFnc_randomModelToWorld = {
	_x = random [-5,3,5];
	_y = random [-5,3,5];
	_z = random [0.5,0.7,1.7];
	//systemChat str [_x,_y,_z];
	[_x,_y,_z]
};
#define RMDPOS call MRH_insideFnc_randomModelToWorld
playSound "OUTRO";
if (_availPlayers) then { [_target, (selectRandom _allMoves), 1] call ace_common_fnc_doAnimation};////{_target switchMove (selectRandom _allMoves)};
prise1 = [_camera, _camera,_heli,15, 1, 1 ,false, 0, 0, 0,"blur","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise1}; 
if !(_availPlayers) then {_target = _dummy} else {_target = selectRandom _AllEligiblePlayers};
if (_availPlayers && isServer) then { [_target, (selectRandom _allMoves), 1] call ace_common_fnc_doAnimation};
_camera setPos (_target modelToWorld (RMDPOS));
prise2 = [_camera, _camera,_target,5, 1, 1 ,false, 0, 0, 0,"none","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise2};
if !(_availPlayers) then {_target = _dummy} else {_target = selectRandom _AllEligiblePlayers};
if (_availPlayers && isServer) then { [_target, (selectRandom _allMoves), 1] call ace_common_fnc_doAnimation};
_camera setPos (_target modelToWorld (RMDPOS));
prise3 = [_camera, _camera,_target,5, 1, 1 ,false, 0, 0, 0,"none","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise3}; 

if !(_availPlayers) then {_target = _dummy} else {_target = selectRandom _AllEligiblePlayers};
if (_availPlayers && isServer) then { [_target, (selectRandom _allMoves), 1] call ace_common_fnc_doAnimation};
_camera setPos (_target modelToWorld (RMDPOS));
prise4 = [_camera, _camera,_target,5, 1, 1 ,false, 0, 0, 0,"none","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise4}; 
if !(_availPlayers) then {_target = _dummy} else {_target = selectRandom _AllEligiblePlayers};
if (_availPlayers && isServer) then { [_target, (selectRandom _allMoves), 1] call ace_common_fnc_doAnimation};
_camera setPos (_target modelToWorld (RMDPOS));
prise5 = [_camera, _camera,_target,5, 1, 1 ,false, 0, 0, 0,"none","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise5};
if !(_availPlayers) then {_target = _dummy} else {_target = selectRandom _AllEligiblePlayers};
if (_availPlayers && isServer) then { [_target, (selectRandom _allMoves), 1] call ace_common_fnc_doAnimation};
_camera setPos (_target modelToWorld (RMDPOS));
prise6 = [_camera, _camera,_target,5, 1, 1 ,false, 0, 0, 0,"none","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise6};
if !(_availPlayers) then {_target = _dummy} else {_target = selectRandom _AllEligiblePlayers};
if (_availPlayers && isServer) then { [_target, (selectRandom _allMoves), 1] call ace_common_fnc_doAnimation};
_camera setPos (_target modelToWorld (RMDPOS));
prise7 = [_camera, _camera,_target,5, 1, 1 ,false, 0, 0, 0,"none","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise7}; 
if !(_availPlayers) then {_target = _dummy} else {_target = selectRandom _AllEligiblePlayers};
if (_availPlayers && isServer) then { [_target, (selectRandom _allMoves), 1] call ace_common_fnc_doAnimation};
_camera setPos (_target modelToWorld (RMDPOS));
prise8 = [_camera, _camera,_target,5, 1, 1 ,false, 0, 0, 0,"none","none",0] execVM "introscript\machinery\cam.sqf";
waitUntil {scriptDone prise8}; 



call MRH_fnc_toBriefing;
sleep 10;
call MRH_fnc_resetSeats;
////======destruction de la camera ne pas editer 
_cam = "camera" camCreate (position player);
camDestroy _cam;
player cameraEffect ["terminate","back"];
}] remoteExec ["Spawn",[0,-2]select isDedicated];