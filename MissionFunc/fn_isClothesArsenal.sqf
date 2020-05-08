/*
crée un arsenal virtuel qui n'ajoute que les vêtements autorisés
[this] call MRH_fnc_isClothesArsenal;
*/
_func = {

params ["_box"];
_itemsArray = 
[
	//uniforms
	"U_BG_Guerrilla_6_1", //Guerilla apparel
	"U_BG_Guerilla2_1", //Guerilla outfit plain dark
	"U_BG_Guerilla2_3", // guerilla outfit plain lightAttachObject
	"U_I_G_Story_Protagonist_F", //worn combat fatigues kerry
	"U_I_C_Soldier_Para_3_F", // paramilitary garb short
	"U_I_C_Soldier_Para_4_F", // paramilitary garb tank tops
	"U_I_C_Soldier_Para_1_F", // paramiltary garb Tee
	"LOP_U_AFR_Civ_01", // Civilian clothes (African 01)
	"LOP_U_AFR_Civ_02", // Civilian clothes (African 02)
	"LOP_U_AFR_Civ_03", // Civilian clothes (African 02)
	"LOP_U_AFR_Civ_04", // Civilian clothes (African 02)
	"LOP_U_AFR_Civ_05", // Civilian clothes (African 02)
	"LOP_U_AFR_Civ_06", // Civilian clothes (African 02)
	"LOP_U_PMC_Fatigue_03", // combat uniform pmc 03
	"LOP_U_PMC_Fatigue_01", // combat uniform pmc 03
	"LOP_U_PMC_Fatigue_04", // combat uniform pmc 03
	"LOP_U_PMC_tac_tacky",
	"LOP_U_PMC_tac_floral",
	"LOP_U_PMC_tac_prp_palm",
	//headgear
	"rhsusf_opscore_fg_pelt_nsw", // FAST Ballistic (Foliage Green/ headset/NSW)
	"H_Watchcap_blk", //beanie
	"H_Watchcap_cbr", //beanie (coyote)
	"H_Watchcap_camo", //beanie (green)
	"H_Watchcap_khk", // beanie (khaki)
	"H_Cap_blk", // cap (black)
	"H_Cap_oli_hs", // cap (olive headset)
	"H_Cap_usblack", // cap (us black)
	"H_Cap_tan_specops_US", // cap (US MTP) 
	"H_MilCap_gry", //Militarycap grey
	"rhsusf_bowman_cap", //Bowman Elite II (cap)
	"rhsgref_bcap_specter",
	//vests 
	"V_PlateCarrier1_blk", //carrier Lite black
	"V_PlateCarrier2_blk", // carrier Rig (Black)
	"V_TacVest_blk", // tactical Vest (Black)
	"LOP_V_CarrierLite_BLK", // PO GA Carrier Lite (black)
	"V_TacVest_oli", //TacticalVest Olive
	"LOP_V_CarrierLite_OLV", // PO GA Carrier Lite (olive)
	"rhsgref_otv_khaki",
	"rhsgref_TacVest_ERDL",
	"rhsgref_alice_webbing",
	//Facewear
	"G_Balaclava_blk", //Balaclava (Black)
	"G_Bandanna_aviator", //Bandana Aviator
	"G_Bandanna_beast", //Bandana Beast
	"G_Bandanna_blk", //Bandana Black
	"rhs_ess_black", // Ballistic goggles (Black)
	"rhsusf_shemagh_grn", //Shemag green
	"rhsusf_shemagh2_grn", //SHemag Green/Alt
	"rhsusf_shemagh_gogg_grn", //shemag w/Goggles green
	"rhsusf_shemagh2_gogg_grn", //shemag w/Goggles green/alt
	"rhsusf_oakley_goggles_blk", //SI Ballistic 2.0 Black
	"rhsusf_oakley_goggles_clr",  //SI Ballistic 2.0 clear
	"rhs_balaclava", //Balaclava
	"rhs_balaclava1_olive" //Balaclava (olive)
];
/*
{
	_itemsArray pushBackUnique _x
}forEach ACE_ArsenalAllowedItems;
*/

[_box,_itemsArray] call ace_arsenal_fnc_initBox;
};
[
    {true},//{!isNil "ACE_ArsenalAllowedItems"}, 
    _func, 
    _this
] call CBA_fnc_waitUntilAndExecute;