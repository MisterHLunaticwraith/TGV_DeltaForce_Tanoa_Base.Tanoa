params ["_unit","_chair"];
[_unit, "Je vais vous donner des radios",{_message =[player] call MRH_fnc_setUpUnitWithRadios;
sleep 5;
[(_this select 0),_message]call MRH_fnc_ambientConversation;
},"LOCAL",false] call MRH_fnc_simpleAceMessage;

[_unit,_chair] call MRH_fnc_sitOnChair;
