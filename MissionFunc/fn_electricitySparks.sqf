_this spawn {
	params ["_unit",["_condition",{false}],["_parameters",[]]];

	_selections = ["spine","spine1","spine2","spine3","head","leftshoulder","leftarm","leftarmroll","leftforearm","leftforearmroll","lefthand","rightshoulder","rightarm","rightarmroll","rightforearm","rightforearmroll","righthand","pelvis","leftupleg","leftuplegroll","leftleg","leftlegroll","leftfoot","lefttoebase","rightupleg","rightuplegroll","rightleg","rightlegroll","rightfoot","righttoebase","head_proxy","lefthandindex1","lefthandindex2","lefthandindex3","lefthandmiddle1","lefthandmiddle2","lefthandmiddle3","lefthandring","lefthandpinky1","lefthandpinky2","lefthandpinky3","lefthandring1","lefthandring2","lefthandring3","lefthandthumb1","lefthandthumb2","lefthandthumb3","righthandindex1","righthandindex2","righthandindex3","righthandmiddle1","righthandmiddle2","righthandmiddle3","righthandring","righthandpinky1","righthandpinky2","righthandpinky3","righthandring1","righthandring2","righthandring3","righthandthumb1","righthandthumb2","righthandthumb3"];
	if !(_unit isKindOf "Man") then {_selections = selectionNames _unit};

	while {_parameters call _condition }do {

		private _toDelete = [];
		for "_i" from 0 to 10 do {
		private _sparks = "#particlesource" createVehicleLocal getpos _unit;
		
		private _pos = getPos _sparks;
		_sparks setParticleClass "AvionicsSparks";//"LaptopSparks";//"ExpSparks";//"AvionicsSparks";
		private _sparksSound1 = createSoundSource ["Sound_SparklesWreck2", _pos, [], 0];
		_sparks attachTo [_unit,[0,0,0],selectRandom _selections];
		{_toDelete pushBackUnique _x} forEach [_sparks,_sparksSound1];
		
		};
		sleep (0.1 + random 0.5);
		{deleteVehicle _x}forEach _toDelete;
	};
};