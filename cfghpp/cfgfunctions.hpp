// F3 Functions

class F // Defines the "owner"
{
	class common // category
	{
		file = "CoreScripts\common";
		class processParamsArray{preInit = 1; postInit=1;};
		class nearPlayer{};
	};
	class mpEnd
	{
		file = "CoreScripts\mpEnd";
		class mpEnd{};
		class mpEndReceiver{};
	};


	class zeus
	{
		file = "CoreScripts\zeus";
		class zeusInit{};
		class zeusAddAddons{};
		class zeusAddObjects{};
	};

	class safeStart
	{
		file = "CoreScripts\safeStart";
		class safety{};
	};


};

class MRH // Defines the "owner"
{

	class MissionFunctions// category
	{
	tag = "MRH";
	file = "MissionFunc";
	    class isFastTravelPoint
		{};	
		class createCurators
		{
		preInit =1;
		};
		class isUnkillable
		{};
		class jailTime
		{};
		class onPlayerKilled
		{};
		class lockDoor
		{};
		class canOpenDoor
		{};
		class fillDeathChoiceInterface
		{};
		class RTBRespawn
		{};
		class createEmptyBox
		{};
		class victoryRTB
		{};
		class toBriefing
		{};
		class applyRTBAction
		{};
		class fillRTBchoice
		{};
		class resetSeats
		{};
		class placedInBodyBag
		{};
		class changedRSPScheme
		{};
		class isZeusControlled
		{};
		class saveLoadOut
		{};
		class loadLoadOut
		{};
		class clearSavedLoadOuts
		{};
		class isLoadOutSavePoint
		{};
		class fasttravelmap
		{};
		class isClothesArsenal
		{};
		class  serverCreateCurator
		{};
		class isCurator
		{};
		class setUpUnitWithRadios
		{};
		class configRadios
		{};
		class giveRadios
		{};
		class findUnitRadioSettings
		{};
		class isRadioOp
		{};
		class electricShock
		{};
		class electricitySparks
		{};
		class triggerElectricShock
		{};
		class adminShock
		{};
		
	
	};
	
	
	
};
		