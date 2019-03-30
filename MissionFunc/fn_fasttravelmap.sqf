//hospitalFT barracksFT LandVehiculeFT TrainingHangarFT FiringRangeFT MineTrainingFT AtcFT
_sstime = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _sstime select 0;
_sunset = _sstime select 1;
_missiontime = daytime;
_isNight = false;
_positions = [
    		[
    			position airportMapFT,
    			{player setPos (airportMapFT modelToWorld [0,-3,0])},
    			"Aller aux hélipads",
    			"Cliquer ici pour se rendre aux hélipads",
    			name player,
    			"",  //image path
    			0.5,
    			[ player ]
    		],
    		[
    			position briefinZoneFT,
    			{player setPos (briefinZoneFT modelToWorld [0,-3,0])},
    			"Aller à la zone de briefing",
    			"Cliquer ici pour se rendre à la zone de briefing",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			
			[
    			position hospitalFT,
    			{player setPos (hospitalFT modelToWorld [0,-3,0])},
    			"Aller à l'hôpital",
    			"Cliquer ici pour se rendre à l'hôpital",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			[
    			position barracksFT,
    			{player setPos (barracksFT modelToWorld [0,-3,0])},
    			"Aller aux baraquements",
    			"Cliquer ici pour se rendre aux baraquements.",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			[
    			position LandVehiculeFT,
    			{player setPos (LandVehiculeFT modelToWorld [0,-3,0])},
    			"Aller au spawn de véhicules terrestres.",
    			"Cliquer ici pour se rendre au spawn de véhicules terrestres",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			[
    			position TrainingHangarFT,
    			{player setPos (TrainingHangarFT modelToWorld [0,-3,0])},
    			"Aller au hangar d'entraînement CQC",
    			"Cliquer ici pour se rendre au hangar d'entraînement CQC",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			[
    			position FiringRangeFT,
    			{player setPos (FiringRangeFT modelToWorld [0,-3,0])},
    			"Aller à la zone d'entraînement au tir",
    			"Cliquer ici pour se rendre à la zone d'entraînement au tir",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			[
    			position MineTrainingFT,
    			{player setPos (MineTrainingFT modelToWorld [0,-3,0])},
    			"Aller au centre de formation EOD",
    			"Cliquer ici pour se rendre au centre de formation EOD",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
	
			[
    			position AtcFT,
    			{player setPos (AtcFT modelToWorld [0,+1,0])},
    			"Aller à la tour de contrôle de l'aéroport",
    			"Cliquer ici pour se rendre à la tour de contrôle de l'aéroport",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			[
    			position MikisFoBFT,
    			{player setPos (MikisFoBFT modelToWorld [0,-3,0])},
    			"Aller à la Forward Operating Base 'Conrad'",
    			"Cliquer ici pour se rendre à la FOB 'Conrad'",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			[
    			position armoryFT,
    			{player setPos (armoryFT modelToWorld [0,-3,0])},
    			"Aller à l'armurerie",
    			"Cliquer ici pour se rendre à l'armurerie",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		],
			[
    			position seaSpawnFT,
    			{player setPos (seaSpawnFT modelToWorld [0,-3,0])},
    			"Aller au spawn de véhicules maritimes",
    			"Cliquer ici pour se rendre au spawn de véhicules maritimes",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		]
			
			
    	];
if (staticQ getVariable ["MRH_HQ_HQisDeployed",false]) then {
_positions pushBackUnique [
    			position staticQ,
    			{player setPos (staticQ modelToWorld [0,-4,0])},
    			"Aller au HQ mobile 1",
    			"Cliquer ici pour se rendre au HQ Mobile 1",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		];
};

if (mobileHQ getVariable ["MRH_HQ_HQisDeployed",false]) then {
_positions pushBackUnique [
    			position mobileHQ,
    			{player setPos (mobileHQ modelToWorld [0,-3,0])},
    			"Aller au HQ mobile 2",
    			"Cliquer ici pour se rendre au HQ Mobile 2",
    			name player,
    			"",
    			0.5,
    			[ player ]
    		];
};
//nuit
if ((_missiontime < _sunrise) or (_missiontime > _sunset))
then { _isNight = true};
		
		[
    	findDisplay 46,
    	position player,
    	_positions,
		[], //ORBAT
		[], //markers
		[], //images
		overcast, //overcast
		_isNight, //night
		0.1, //scale
		true, //simu
		"Selectionnez un lieu à rejoindre" //label
    ] call BIS_fnc_StrategicMapOpen;

	if (staticQ getVariable ["MRH_HQ_HQisDeployed",false]) then {
	 [position staticQ,3] spawn BIS_fnc_StrategicMapAnimate;
	} else {

		if (mobileHQ getVariable ["MRH_HQ_HQisDeployed",false]) then {
		[position mobileHQ,3] spawn BIS_fnc_StrategicMapAnimate;
		};
	};


	/*
	[findDisplay 46,position player,missions,ORBATs,markers,images,weather,night,scale,simulation,label,missionName,missionIcon] call BIS_fnc_StrategicMapOpen 
Parameters:
    display: Display - Parent display. When empty, mission display is used. 
    pos: Position - Default view position in format [x,y,y] or [x,y]
    missions: Array - List of missions, each Array in format:

        0: Position - 2D or 3D position of mission
        1: Code - Expression executed when user clicks on mission icon
        2: String - Mission name
        3: String - Short description
        4: String - Name of mission's player
        5: String - Path to overview image
        6: Number - Size multiplier for overview image
        7: Array - Parameters for on-click action. Can be accessed in code with _this # 9

    ORBATs: Array - List of ORBAT, each Array in format:

        0: Position - 2D or 3D position
        1: Config - Preview CfgORBAT group
        2: Config - Topmost displayed CfgORBAT group
        3: Array of strings - List of allowed tags
        4: String - Name of mission's player
        5: Number - Maximum number of displayed tiers

    markers: Array of strings - List of markers revealed in strategic map (will be hidden when map is closed)
    images: Array - List of custom images, each Array in format:

        0: String - Texture path
        1: Array - Colour in format [R,G,B,A]
        2: Position - Image position
        3: Number - Image width in meters
        4: Number - Image height in meters
        5: Number - Image angle in degrees
        6: String - Text displayed next to the image
        7: Boolean - True to show shadow

    weather: Number - Overcast, from 0 - 1, where 1 means cloudy weather
    night: Boolean - True for night version of strategic map (darker with blue tone)
    scale: Number - Default map scale coeficient (1 is automatic scale)
    simulation: Boolean] - (Optional, default false True to enable simulation while the map is opened
    label: String - (Optional, default "Select a mission") Bottom bar action label text
    missionName: Boolean - (Optional, default true) True to show icon label as a mission name
    missionIcon: String - (Optional, default "\A3\Ui_f\data\Map\GroupIcons\badge_rotate_%1_gs.paa") Path to mission icon texture

        %1 - Animation frame from 0-6 (optional)
        %2 - Index from 1-9 (optional)
		*/