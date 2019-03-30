#include "defines.hpp"
class MRHDeathChoice
{
	idd=040918;
	movingenable=true;

	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Zefogy)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Jabenu)
////////////////////////////////////////////////////////

class MRHGuiBack: IGUIBack
{
	idc = 2200;
    moving = true;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.099 * safezoneH;
};
class MRHTitleText: RscStructuredText
{
	idc = 1100;
    moving = true;
	text = "Choisir ce qui se passe si un joueur est tué:"; //--- ToDo: Localize;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.033 * safezoneH;
};
class RscCombo_2100: RscCombo
{
	idc = 2100;
    moving = true;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHValider: RscButton
{
	idc = 1600;
    moving = true;
	text = "Valider"; //--- ToDo: Localize;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHAnnuler: RscButton
{
	idc = 1601;
    moving = true;
	text = "Annuler"; //--- ToDo: Localize;
    action = "closedialog 0";
	x = 0.463906 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};