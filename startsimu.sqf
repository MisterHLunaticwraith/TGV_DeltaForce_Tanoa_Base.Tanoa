hangar animateSource ["Door_3_sound_source", 0];
hangar animateSource ["Door_2_sound_source", 0];

[[], {
_lights = [Light_1,Light_2,Light_3,Light_4,Light_5,Light_6,Light_7,Light_8,Light_9,Light_10];
{

					[_x,[0.5, 0, 0]] execVM "redlight.sqf";

} forEach _lights;
}] RemoteExec ["Call",0, true];




playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", slspeaker]; //alarm
objhouse_1 animate ["Door_1_rot", 0];
objhouse_1 animate ["Door_2_rot", 0];
objhouse_1 setVariable ["BIS_disabled_Door_2", 1, true]; 
objhouse_1 setVariable ["BIS_disabled_Door_1", 1, true];