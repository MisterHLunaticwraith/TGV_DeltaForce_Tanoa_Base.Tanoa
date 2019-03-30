	// Notification Template
	class Template
	{
		title = ""; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};

	// A generic warning notification
	class Alert
	{
		title = "ALERT";
		description = "%1";
		iconPicture="\A3\ui_f\data\map\markers\military\warning_ca.paa";
		duration = 3;
		priority = 9;
	};

	// Notifications for the F3 Safe Start Component
	class SafeStart
	{
		title = "SAFE START";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 10;
		priority = 0;
	};
	class SafeStartMissionStarting
	{
		title = "SAFE START";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 3;
		priority = 1;
	};
	
		class RespawnedAllowed
	{
		title = "Retour en jeu autorisé.";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 3;
		priority = 1;
	};

	class HasBeenCaptured
	{
		title = "Un homme a été capturé par l'ennemi";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 4;
		priority = 1;
	};

	class HasBeenKilled
	{
		title = "Un homme a été tué par l'ennemi";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 4;
		priority = 1;
	};
		class TGVVictory
	{
		title = "Réussite de la mission!";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 4;
		priority = 1;
	};

			class TGVtoBrief
	{
		title = "Au briefing!";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 4;
		priority = 1;
	};
	class TGVRespAllowed
	{
		title = "Respawn de joueur";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 4;
		priority = 1;
	};
	class TGVRespChanged
	{
		title = "Mode de respawn changé";
		description = "%1";
		iconPicture="media\img\tgv.paa";
		duration = 4;
		priority = 1;
	};