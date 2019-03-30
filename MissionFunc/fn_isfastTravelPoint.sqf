//[this] call MRH_fnc_isFastTravelPoint;
params ["_point"];
if !(typeOf _point in ["rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy","B_Slingload_01_Repair_F"]) then {
_point setObjectTexture [0,"ft.paa"];
};
_statement = {
	[] spawn MRH_fnc_fastTravelMap;}
	;
_loc = "Ouvrir la carte de voyage rapide"; 
_action =
["MRH_FT_Action", 
_loc,
 "jipicon.paa",
_statement , 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_point, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 