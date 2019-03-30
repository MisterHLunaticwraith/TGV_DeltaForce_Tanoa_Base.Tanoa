#define CTEXT(ARG,ARG1) gettext (configfile>>"cfgWeapons">>##ARG##>>##ARG1##)
#define CNUMB(ARG,ARG1) getNumber (configfile>>"cfgWeapons">>##ARG##>>##ARG1##)
//#define ISSMA(ARG) (CTEXT(#ARG,"dlc")== "SMA")
_allWeapons = [(configfile >> "cfgWeapons")]call BIS_fnc_getCfgSubClasses;
_allMuzzles = [];
{
	if((CTEXT(_x,"dlc")== "SMA")&& (CTEXT(_x,"_generalmacro")=="muzzle_snds_H")) then {_allMuzzles pushBackUnique _x};
} forEach _allWeapons;
/*
copytoclipboard str _allMuzzles;
{
testBox addItemCargo [_x,1];
} forEach _allMuzzles;
*/
_allRifles = [];
{
	private _base = [ configFile >> "CfgWeapons" >> _x, true ] call BIS_fnc_returnParents;
	if((CTEXT(_x,"dlc")== "SMA")&& (CNUMB(_x,"scope")==2)&& ("Rifle_Base_F" in _base)) then {_allRifles pushBackUnique _x};
} forEach _allWeapons;

_optics = [];
_opticsArray = [];
{
  _opticsArray = getArray (configFile>>"cfgWeapons">>_x>>"WeaponSlotsInfo" >>"cowSlot">>"compatibleItems");
  {
	  if ((CTEXT(_x,"dlc")== "SMA")) then {_optics pushBackUnique _x};
  }forEach _opticsArray;
  
} forEach _allRifles;
systemChat str _optics;
{
	cursorTarget addItemCargo _x;
} forEach _optics;
hint "done";
//weaponInfoType = "RscWeaponZeroing";

