//template
/*
class cfgMRHPunishments //cannot be changed
{
	
	class MyPunishMentClassName //can be anything, good practice is to tag with your handle.
	{
		picture= "pathToYourPic.jpeg"; // can be in jpeg or paa, paa is advised 64*64 is a good size "" if you do not want a picture.
		displayName = "Your pretty punishment name here"; //name as displayed in the admin menu
		notificationMessage = "Your notification message here"; //message in the notification the punished player will see.
		code = "_player = _this select 0;"; // code to execute, executed in unscheduled environment (canSuspend). Selected player is passed as a parameter
		
	};
	
};
*/
//example:
class cfgMRHPunishments
{
	
	class kill_Punishment
	{
		picture= "\MRHMilsimTools\Paa\punishericon.paa";
		displayName = "Tuer le joueur";
		notificationMessage = "L'admin ne t'aime pas,pouf t'es mort!";
		code = "_player = _this select 0; _player setDamage 1";
		
	};

	class zap_Punishment
	{
		picture= "\MRHMarkers\paa\iconconnect.paa";
		displayName = "Electrocuter le joueur";
		notificationMessage = "L'admin a un effet électrisant sur toi!";
		code = "_player = _this select 0;[_player] call MRH_fnc_adminShock";
		
	};
	
};