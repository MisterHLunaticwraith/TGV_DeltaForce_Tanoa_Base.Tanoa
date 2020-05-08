#define SR "ACRE_PRC343"
#define LR "ACRE_PRC152"
#define PACK "ACRE_PRC117F"
#define ZERO 1
#define SAB 2
#define DAG 3
#define GHOST 4
#define REAP 5
#define ARCH 6
#define OLYMP 7
#define ZEROGRP 8
#define BLOC1(ARG) 0+ARG
#define BLOC2(ARG) 16+ARG
radiosTable = [
	//------ZERO
	[
		"squadMaj",//unit
		[SR,LR,PACK],//radios 
		[BLOC1(1),ZEROGRP,ZERO]//_channels (343,152,117)
	],
	[
		"sicRo",
		[SR,LR,PACK],
		[BLOC1(1),ZEROGRP,ZERO]
	],
	[
		"surgeon",
		[SR,LR],
		[BLOC1(1),ZEROGRP]

	],
	[
		"p7", //TP1
		[SR,LR],
		[BLOC1(1),ZEROGRP]
	],
	[
		"p7_2", //TP2
		[SR,LR],
		[BLOC1(1),ZEROGRP]
	],

	//------Sabre 
	[
		"p1",//SL 
		[SR,LR,PACK],
		[BLOC1(3),SAB,ZERO]
	],
	[
		"p2", //TL1
		[SR,LR],
		[BLOC1(2),SAB]
	],
	[
		"p3", //Breacher 
		[SR],
		[BLOC1(2)]
	],
	[
		"p4", //op 
		[SR],
		[BLOC1(2)]

	],
	[
		"p5", //TL2
		[SR,LR],
		[BLOC1(3),SAB]
	],
	[
		"p5_1", //Medic
		[SR],
		[BLOC1(3)]
	],
	[
		"p6", //MG 
		[SR],
		[BLOC1(3)]
	],
	//-----Dagger 
	[
		"p1_2", //SL
		[SR,LR,PACK],
		[BLOC1(5),DAG,ZERO]
	],
	[
		"p2_2", //TL1
		[SR,LR],
		[BLOC1(4),DAG]
	],
	[
		"p3_2", //Breacher 
		[SR],
		[BLOC1(4)]
	],
	[
		"p4_2", //op 
		[SR],
		[BLOC1(4)]

	],
	[
		"p5_2", //TL2 
		[SR,LR],
		[BLOC1(5),DAG]
	],
	[
		"p5_3", //Medic 
		[SR],
		[BLOC1(5)]
	],
	[
		"p6_2", //MG
		[SR],
		[BLOC1(5)]
	],
	//---------ghost
	[
		"sniper",
		[LR],
		[1,GHOST]
		
	],
	[
		"spotter",
		[LR,PACK],
		[1,GHOST,ZERO]
	],
	//-----reaper 
	[
		"heliP1",
		[SR,LR,PACK],
		[BLOC1(6),REAP,ZERO]
	],
	[
		"heliP2",
		[SR,LR,PACK],
		[BLOC1(6),REAP,ZERO]
	],
	//------Archangel
	[
		"arch",
		[LR,PACK],
		[1,REAP,ZERO]
	],
	//------olympus
	[
		"GameZeus",
		[SR,LR,PACK],
		[BLOC1(7),OLYMP,ZERO]

	],
	[
		"GameZeus_2",
		[SR,LR,PACK],
		[BLOC1(7),OLYMP,ZERO]

	]
];
