private 
["_CfgVehicles",
  "_type",
  "_i",
  "_CfgVehicle",    
  "_vehicleClass", 		//VK
  "_simulation",
  "_simTypesUnits",
  "_simTypesObjects",
  "_simTypesAll",
  "_u_GEN_ship_idx",
  "_u_GEN_airplane_idx",
  "_u_GEN_helicopter_idx",
  "_u_GEN_TANK_idx",
  "_u_GEN_motorcycle_idx",
  "_u_GEN_car_idx",
  "_u_GEN_soldier_idx",
  "_u_ammo_idx",		//VK
  "_u_ace_ammo_idx",		//VK
  "_faction"
];


_u_GEN_ship_idx		 	= 0;
_u_GEN_airplane_idx   	= 0;
_u_GEN_helicopter_idx 	= 0;
_u_GEN_TANK_idx		 	= 0;
_u_GEN_motorcycle_idx 	= 0;
_u_GEN_car_idx		 	= 0;
_u_GEN_soldier_idx       = 0;

_u_ammo_idx				= 0;	//VK
_u_ace_ammo_idx			= 0;	//VK

_faction = mcc_faction;



//_simTypesUnits 		= ["ReammoBox"];
_simTypesUnits 	= ["soldier", "car", "motorcycle", "tank", "helicopter", "airplane", "ship", "parachute"];   
//_simTypesUnits 	= ["helicopter", "airplane", "ship"];   
_simTypesObjects 	= ["house", "thing", "thingeffect", "flagcarrier", "fire", "fountain", "forest", "church"];
_simTypesAll 		= (_simTypesUnits + _simTypesObjects) - ["soldier"];  
_CfgVehicles 		= configFile >> "CfgVehicles" ;



for "_i" from 1 to (count _CfgVehicles - 1) do {
 _CfgVehicle = _CfgVehicles select _i;
 
 //Keep going when it is a public entry
 if (getNumber(_CfgVehicle >> "scope") == 2) then {
  
  _vehicleDisplayName 	= getText(_CfgVehicle >> "displayname");
  _cfgclass 			= (configName (_CfgVehicle));  
  _cfgFaction 			= getText(_CfgVehicle >> "faction");
  _simulation 			= getText(_CfgVehicle >> "simulation");
  
  //VK - Added to recognize ammo crates
  _vehicleclass			= getText(_CfgVehicle >> "vehicleclass");
  
  //VK - Let ammoboxes through
  if ((_simulation in _simTypesUnits) or (toLower(_vehicleclass) == "ammo") or (toLower(_vehicleclass) == "ace_ammunition")) then 
  {
  
  //Verwerking
	//Start russian shit
	
	
	
	if (toUpper(_cfgFaction) == _faction) then 
	{
        
		switch (toLower(_simulation)) do 
		{
			//case "soldier"		: {hint "1";}; 
			case "soldier"			: {
									_type="LAND";
									if (_u_gen_soldier_idx < 20) then
									{
										U_GEN_soldier set[_u_GEN_soldier_idx,[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""MAN"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									};
									if ( (_u_gen_soldier_idx >19) and ( _u_gen_soldier_idx < 40) ) then
									{
										U_GEN_soldier1 set[(_u_GEN_soldier_idx - 20),[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""MAN"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									};
									if ( _u_gen_soldier_idx >39 ) then
									{
										U_GEN_soldier2 set[(_u_GEN_soldier_idx - 40),[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""MAN"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									};
									_u_GEN_soldier_idx = _u_GEN_soldier_idx + 1;
									
								  };
								  
			case "car"			: {
									_type="LAND";
									if (_u_gen_car_idx < 20) then
									{
										U_GEN_car set[_u_GEN_car_idx,[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""VEHICLE"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									};
									if ( (_u_gen_car_idx >19) and ( _u_gen_car_idx < 40) ) then
									{
										U_GEN_car1 set[(_u_GEN_car_idx - 20),[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""VEHICLE"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									};							
									if (_u_gen_car_idx  >39) then
									{
										U_GEN_car2 set[(_u_GEN_car_idx - 40),[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""VEHICLE"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									};									
									_u_GEN_car_idx = _u_GEN_car_idx + 1;
								  };
			case "motorcycle"	: {
									_type="LAND";
									U_GEN_motorcycle set[_u_GEN_motorcycle_idx,[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""VEHICLE"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									_u_GEN_motorcycle_idx = _u_GEN_motorcycle_idx + 1;
								  };
			case "tank"			: {
									_type="LAND";
									U_GEN_TANK set[_u_GEN_TANK_idx,[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""VEHICLE"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									_u_GEN_TANK_idx = _u_GEN_TANK_idx + 1;
								  };
			case "helicopter"	: {
									_type="AIR";
									U_GEN_HELICOPTER set[_u_GEN_helicopter_idx,[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""VEHICLE"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									_u_GEN_helicopter_idx = _u_GEN_helicopter_idx + 1;
								  };
			case "airplane"		: {
									_type="AIR";
									U_GEN_AIRPLANE set[_u_GEN_airplane_idx,[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""VEHICLE"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									_u_GEN_airplane_idx = _u_GEN_airplane_idx+1;
								  };
			case "ship"			: {
									_type="WATER";
									U_GEN_SHIP set[_u_GEN_ship_idx,[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""VEHICLE"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,mcc_sidename,_vehicleDisplayName]]  ]];									
									_u_GEN_ship_idx = _u_GEN_ship_idx+1;
								  };
			//case "parachute"	: {hint "3";};		
			
		}; 
        //Start INSssian shit
	};


	
	//VKing making ammo spawnable
	if ((toLower(_vehicleclass) == "ammo")) then
	{
		_type="LAND";
		U_AMMO set[_u_ammo_idx,[["Item", _vehicleDisplayName],["Action", format ["mcc_spawntype=""AMMO"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,_cfgfaction,_vehicleDisplayName]]  ]];
		_u_ammo_idx = _u_ammo_idx+1;
	};
	
	//For separate menu for ACE stuff, problems with the length when combined into single menu, I think.
	if (toLower(_vehicleclass) == "ace_ammunition") then
	{
		_type="LAND";
		U_ACE_AMMO set[_u_ace_ammo_idx,[["Item", format ["ACE_%1",_vehicleDisplayName]],["Action", format ["mcc_spawntype=""AMMO"";mcc_classtype=""%1"";mcc_spawnname=""%2"";mcc_spawnfaction=""%3"";nul=[4] execVM 'mcc\general_scripts\mcc_SpawnStuff.sqf';mcc_spawndisplayname=""%4"";",_type,_cfgclass,_cfgfaction,_vehicleDisplayName]]  ]];
		_u_ace_ammo_idx = _u_ace_ammo_idx+1;
	};
   
  };
   // End VK edit

 };
};

