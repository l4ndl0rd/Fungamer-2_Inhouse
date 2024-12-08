/*  MP Ammo Box script
	By: Riouken
	For Arma 3

	Put this in the ammo box in game // nul =[this] execVM "ammo.sqf"; //
*/

if (! isServer) exitWith {};
 
//Get the crate parameter given
 
_crate = _this select 0;

	//CLEAR ALL INVENTORY
	clearMagazineCargoGlobal _crate;
	clearWeaponCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;

	//WEAPONS (_crate addWeaponCargoGlobal ["className", amount];)
	

	//AMMO (_crate addMagazineCargoGlobal ["className", amount];)

	
	//LAUNCHERS (_crate addWeaponCargoGlobal ["className", amount];)
	
	
	//LAUNCHER AMMO (_crate addMagazineCargoGlobal ["className", amount];)

	
	//EXPLOSIVES (_crate addMagazineCargoGlobal ["className", amount];)
	
	
	//GRENADES (_crate addMagazineCargoGlobal ["className", amount];)

	
	//ATTACHMENTS (_crate addItemCargoGlobal ["className",amount];)
	
	
	//UNIFORMS (_crate addItemCargoGlobal ["className", amount];)
	
	
	//VESTS (_crate addItemCargoGlobal ["className", amount];)
	
	
	//BACKPACKS (_crate addBackpackCargoGlobal ["className", amount];)
	
	
	//HELMETS (_crate addItemCargoGlobal ["className", amount];)
	
	
	//ITEMS (_crate addItemCargoGlobal ["className", amount];)
	
	
	//MEDIC SUPPLY (_crate addItemCargoGlobal ["className", amount];)
	//Bandagen
	_crate addItemCargoGlobal ["ACE_packingBandage", 60];
	_crate addItemCargoGlobal ["ACE_elasticBandage", 60];
	_crate addItemCargoGlobal ["ACE_quikclot", 60];
	//Medikamente
	_crate addItemCargoGlobal ["ACE_morphine", 5];
	_crate addItemCargoGlobal ["ACE_epinephrine", 5];
	_crate addItemCargoGlobal ["ACE_adenosine", 5];
	_crate addItemCargoGlobal ["fg2_tylenol", 5];
	//Konserven
	_crate addItemCargoGlobal ["ACE_salineIV", 5];
	_crate addItemCargoGlobal ["ACE_salineIV_500", 10];
    _crate addItemCargoGlobal ["ACE_salineIV_250", 5]
	//Sonstiges
	_crate addItemCargoGlobal ["ACE_tourniquet", 10];
	_crate addItemCargoGlobal ["ACE_splint", 5];
	_crate addItemCargoGlobal ["ACE_suture", 5];
	
	//RADIOS (_crate addItemCargoGlobal ["className", amount];)
	
	
	//ACE STUFF (_crate addItemCargoGlobal ["className", amount];)
	

//sleep x;	//if active, the script will rerun after x seconds