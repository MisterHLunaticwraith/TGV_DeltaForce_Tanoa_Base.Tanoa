profileNameSpace setVariable ["TGV_saved_loadouts_TanoaDelta",nil];
saveProfileNamespace;
_dbg=format ["Saved loadouts list cleared for player %1",name player];
[
	_dbg
] call MRH_fnc_MilsimTools_DebugTools_trace;


true