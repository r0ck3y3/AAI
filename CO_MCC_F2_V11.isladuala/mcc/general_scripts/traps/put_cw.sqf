_tpos=_this;
_count = count trapkind;
_random= trapkind select (random (_count-1));
_group = creategroup civilian;
_sb = _random createunit [_tpos, _group,"removeallweapons this; _null = [this,iedside,10,10] execVM ""mcc\general_scripts\traps\cw.sqf"";this addaction [""Neutralize Suspect"",""mcc\general_scripts\traps\neutralize.sqf""]; this addrating -1; this allowfleeing 0;this setbehaviour ""CARELESS"";",1];
publicvariable "disarm";
_sb setposatl _tpos;
_group setformdir random 360;
//[_group, getPos _sb, 50] call bis_fnc_taskPatrol;