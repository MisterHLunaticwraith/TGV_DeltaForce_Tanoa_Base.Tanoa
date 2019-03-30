_vehTypes = ["rhsusf_f22","RHS_C130J","RHS_A10","RHS_UH60M","RHS_AH64D_wd","RHS_MELB_H6M","C_Heli_Light_01_civil_F","RHS_Mi8amt_civilian","C_IDAP_Heli_Transport_02_F","C_Plane_Civil_01_racing_F","C_Plane_Civil_01_F"];
_Positions = [];
{
private ["_pos"];
_pos = getMarkerPos _x;
_positions pushBackUnique _pos;
} forEach ["FlyBySpawn_1","FlyBySpawn_2","FlyBySpawn_3","FlyBySpawn_4","FlyBySpawn_5","FlyBySpawn_6","FlyBySpawn_7","FlyBySpawn_8","FlyBySpawn_9","FlyBySpawn_10","FlyBySpawn_11","FlyBySpawn_12","FlyBySpawn_13"];
_speeds = ["LIMITED","NORMAL","FULL"];
while {true} do {
	_veh = selectRandom _vehTypes;
	_startPos = selectRandom _Positions;
	_despawnPos = selectRandom _Positions;
	_speedMode = selectRandom _speeds;
	_height = random [50, 100, 150];
	_sleep = random [60,150, 300]; 
    [_startPos,_despawnPos,_height,_speedMode,_veh,WEST] call BIS_fnc_ambientFlyby; 
	sleep _sleep;
};
/*
    [[0,0,0],[100,100,100],100,"NORMAL","B_Heli_Light_01_F",WEST] call BIS_fnc_ambientFlyby; 
Parameters:
    Array - Array containing start position where air unit spawns. Format [x,y,z]. 
    Array - Array containing end position where air unit moves to and despawns. Format [x,y,z].
    Number - Height at which air unit will spawn and fly.
    String - String detailing speed at which air unit travels. Possible values "LIMITED", "NORMAL" and "FULL".
    String - Vehicle classname of air unit to spawn. Viewable in CfgVehicles.
    Side - Side which vehicle belongs to.
*/