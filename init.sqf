//================CORE=SCRIPTS===========nepasdesactiver====///
//Les codes suivants sont executés au début de la mission.
///Sécurité engagée au début de la mission
[] execVM "CoreScripts\securite.sqf";
// Crée les variables
if(isServer) then {
	f_script_setLocalVars = [] execVM "CoreScripts\common\f_setLocalVars.sqf";
};
// desactive la sauvegarde
enableSaving [false, false];
//mute les voix automatiques des unitésjouables
{_x setSpeaker "NoVoice"} forEach playableUnits;
//execute le safesatrt
[] execVM "CoreScripts\safeStart\f_safeStart.sqf";
//générelebriefing
f_script_briefing = [] execVM "briefing.sqf";
//génére les orbatnotes
[] execVM "CoreScripts\briefing\f_orbatNotes.sqf";
//générelesloadoutnotes
[] execVM "CoreScripts\briefing\f_loadoutNotes.sqf";
//génére les guides TGV
0= execVM "CoreScripts\briefing\guidesetinfos.sqf";
//----initialise les loadouts ace par défaut
[] execVM "initAceLoadOuts.sqf";
//InitialiseLesVariablesDudecomptedesmorts
//--crée la table des radios 
[] execVM "radioTable.sqf";

//========FIN=CORE=SCRIPTS================


//=============ScriptsSpécifiquesAlaMission=====
//Initialiser les scripts de mission cidessous.
MISSION_ROOT = call {
    private "_arr";
    _arr = toArray __FILE__;
    _arr resize (count _arr - 8);
    toString _arr
};


//acre_sys_signal_showSignalHint = true;
/*
//PAS ENCORE DANS LA VERSION ACTUELLE DE ACE X A PASSER DANS LADDON TGV DES QUE
 ["acex_rationConsumed",
 { 
	 params ["_player", "_consumeItem", "_replacementItem", "_thirstQuenched", "_hungerSatiated"];
	 ["consumed item eh fired"] call MRH_fnc_MilsimTools_DebugTools_trace;
if (_consumeItem in ["TGV_Beer_Item","TGV_Beer_Item_half"]) then {objNull call TGV_fnc_DrinkEffects;};

}] call CBA_fnc_addEventHandler;
*/
["Init  done"] call MRH_fnc_MilsimTools_DebugTools_trace;