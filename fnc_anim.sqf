//======================================================================================
// Plain Animations
//======================================================================================
comIdle_plainAnim = {
	comIdle_idling = true;
	
	private ["_objAnim","_obj"];
	if (count _this > 1) then {
		_objAnim = _this select 1;
		_obj = _this select 2;
	} else {
		_objAnim = "";
	};
	
	// Handles your attachTo position depending on the object.
	[player] call comIdle_objects;
	
	// Event handlers needed to kick players out of animations when shot or killed. "AnimDone" is for looping animations.
	_HandleDamage_EH = player addEventHandler ["HandleDamage", comIdle_HandleDamage_EH];
	_Killed_EH = player addEventHandler ["Killed", comIdle_Killed_EH];
	_AnimDone_EH = player addEventHandler ["AnimDone", comIdle_AnimDone_EH];
	
	// The player is given a variable unique to the player since OnPlayerDisconnect doesn't have the player's unit.
	_playerVariable = format["comIdle_player_%1",getPlayerUID player];
	player setVariable [_playerVariable, true, true];
	
	//Animation looping
	_animArray = _this select 0;
	
	while {alive player && comIdle_idling && vehicle player == player} do {
		comIdle_loop = false;
		
		_anim = _animArray call BIS_fnc_selectRandom;
		if (_anim == "Acts_starterPistol_fire") then {
			player playMove _anim;
		} else {
			[[[player,_anim], {(_this select 0) switchMove (_this select 1)}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
		};
		
		if (_anim == "Acts_EpicSplit") then {
			waitUntil {!alive player || !comIdle_idling || vehicle player != player};
		};
		waitUntil {animationState player == _anim || !alive player || !comIdle_idling || vehicle player != player || comIdle_loop};
		waitUntil {!alive player || !comIdle_idling || vehicle player != player || comIdle_loop};
	};
	
	// Revert back to default animation. If the player was shot thus having his animation cancelled by the
	// event handler, then he isn't reset again. This is in case the he entered another animation (i.e. FAR Revive)
	// so his current animation won't be reset again.
	[] spawn {
		if (!comIdle_hit) then {
			while {!(call comIdle_anim_check) && alive player} do {
				[[[player], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
				sleep 0.1;
			};
		};
	};
	
	comIdle_hit = false;
	
	if (!isNil "_obj") then {deleteVehicle _obj};
	
	player removeEventHandler ["HandleDamage",_HandleDamage_EH];
	player removeEventHandler ["Killed",_Killed_EH];
	player removeEventHandler ["AnimDone",_AnimDone_EH];
	
	player setVariable [_playerVariable, false, true];
};

//======================================================================================
// Bot Animations
//======================================================================================
// Some animations only work on bots, thus a bot with the same gear as the player is spawned.
comIdle_botAnim = {
	comIdle_idling = true;
	
	private ["_objAnim","_obj"];
	if (count _this > 1) then {
		_objAnim = _this select 1;
		_obj = _this select 2;
	} else {
		_objAnim = "";
	};
	
	[[[player], {(_this select 0) switchMove "Acts_StandingSpeakingUnarmed"}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
	[[[player], {(_this select 0) hideObject true}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
	
	// Spawn bot
	_SideHQ = createCenter west;
	_grp = createGroup west;
	_bot = _grp createUnit ["B_Soldier_F", position player, [], 0, "CAN_COLLIDE"];
    
	// Handles your attachTo position depending on the object.
	[player] call comIdle_objects;
	
	// Event handlers needed to kick players out of animations when shot or killed. "AnimDone" is for looping animations.
	_bot addEventHandler ["HandleDamage", comIdle_HandleDamage_EH];
	_bot addEventHandler ["Killed", comIdle_Killed_EH];
	_bot addEventHandler ["AnimDone", comIdle_AnimDone_EH];
	
	_HandleDamage_EH = player addEventHandler ["HandleDamage", comIdle_HandleDamage_EH];
	_Killed_EH = player addEventHandler ["Killed", comIdle_Killed_EH];
	_AnimDone_EH = player addEventHandler ["AnimDone", comIdle_AnimDone_EH];
	
	// The bot is given a variable unique to the player that spawned it so that it can be deleted in the event that the
	// player disconnects from the server.
	_botVariable = format["comIdle_bot_%1",getPlayerUID player];
	_bot setVariable [_botVariable, true, true];
	
	// The player is given a variable unique to the player since OnPlayerDisconnect doesn't have the player's unit.
	_playerVariable = format["comIdle_player_%1",getPlayerUID player];
	player setVariable [_playerVariable, true, true];
	
	[[[_bot], {
			(_this select 0) disableAI "TARGET";
			(_this select 0) disableAI "AUTOTARGET";
			(_this select 0) disableAI "MOVE";
			(_this select 0) disableAI "FSM";
		}
	], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
	
	[_bot] spawn {
		_bot = _this select 0;
		for "_i" from 0 to 3 do
		{
			_bot attachTo [player,[0,0,0]];
			sleep 1;
		};
	};
	
	_uniform = uniform player;
	_vest = vest player;
	_headgear = headGear player;
	_backPack = backpack player;
	_goggles = goggles player;

	_primaryWeapon = primaryWeapon player;
	_secondaryWeapon = secondaryWeapon player;
	_handGunWeapon = handGunWeapon player;
	
	_primaryWeaponItems = primaryWeaponItems player;
	_secondaryWeaponItems = secondaryWeaponItems player;
	_handGunItems = handgunItems player;
	
	removeAllWeapons _bot;
	removeAllItems _bot;
	removeAllAssignedItems _bot;
	removeUniform _bot;
	removeVest _bot;
	removeBackpack _bot;
	removeHeadgear _bot;
	removeGoggles _bot;
	
	if (_uniform != "") then {_bot forceAddUniform _uniform};
	if (_vest != "") then {_bot addVest _vest};
	if (_headgear != "") then {_bot addHeadgear _headgear};
	if (_backpack != "") then {_bot addBackpack _backpack};
	if (_goggles != "") then {_bot addGoggles _goggles};
	if (_primaryWeapon != "") then {_bot addWeapon _primaryWeapon};
	if (_secondaryWeapon != "") then {_bot addWeapon _secondaryWeapon};
	if (_handGunWeapon != "") then {_bot addWeapon _handGunWeapon};
	{if (_x != "") then {_bot addPrimaryWeaponItem _x}} forEach _primaryWeaponItems;
	{if (_x != "") then {_bot addSecondaryWeaponItem _x}} forEach _secondaryWeaponItems;
	{if (_x != "") then {_bot addHandgunItem _x}} forEach _handGunItems;
	
	//Animation looping
	_animArray = _this select 0;
	
	while {alive player && comIdle_idling && vehicle player == player} do {
		comIdle_loop = false;
		
		_anim = _animArray call BIS_fnc_selectRandom;
		if (_anim == "AmovPercMstpSnonWnonDnon_exerciseKata") then {
			_bot playMove _anim;
		} else {
			[[[_bot,_anim], {(_this select 0) switchMove (_this select 1)}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
		};
		
		waitUntil {animationState _bot == _anim || !alive player || !comIdle_idling || vehicle player != player || comIdle_loop};
		waitUntil {!alive player || !comIdle_idling || vehicle player != player || comIdle_loop};
	};

	deleteVehicle _bot;
    if (!isNil "_obj") then {deleteVehicle _obj};
	
	detach player;
	
	[] spawn {
		if (!comIdle_hit) then {
			while {!(call comIdle_anim_check) && alive player} do {
				[[[player], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
				sleep 0.1;
			};
		};
	};
	
	comIdle_hit = false;
	
	if (!isNil "_obj") then {detach _obj};
	
	player removeEventHandler ["HandleDamage",_HandleDamage_EH];
	player removeEventHandler ["Killed",_Killed_EH];
	player removeEventHandler ["AnimDone",_AnimDone_EH];
	
	[[[player], {(_this select 0) hideObject false}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
	
	player setVariable [_botVariable, false, true];
	player setVariable [_playerVariable, false, true];
};

//======================================================================================
// Additional objects
//======================================================================================
comIdle_objects = {
    _unit = _this select 0;
    switch (_objAnim) do {
        case "chair": {
            _pos = getPosATL _unit;
            _obj = "Land_CampingChair_V2_F" createVehicle [_pos select 0, (_pos select 1) - 1, (_pos select 2) + 0.2];
            for "_i" from 1 to 2 do {
                _obj attachTo [_unit,[0,-0.14,0.5]];
                _obj setDir 180;
            };
        };
        case "toilet_sit": {
            _pos = getPosATL _unit;
            _unit attachTo [_obj,[0,-0.7,-1.2]];
            waitUntil {_pos select 0 != getPosATL _unit select 0 || _pos select 1 != getPosATL _unit select 1 || _pos select 2 != getPosATL _unit select 2};
            sleep 0.5;
            detach _unit;
            for "_i" from 1 to 2 do {
                _obj attachTo [_unit,[0,0.7,1.2]];
                _obj setDir 180;
            };
        };
        case "laptop": {
            _pos = getPosATL _unit;
            _obj = "Land_Laptop_unfolded_F" createVehicle [_pos select 0, (_pos select 1) - 1, (_pos select 2) + 0.2];
            for "_i" from 1 to 2 do {
                _obj attachTo [_unit,[0,0.4,0.3]];
                _obj setDir 180;
            };
        };
	};
};

//======================================================================================
// Abuse target animation
//======================================================================================
comIdle_abuseAnim = {
	comIdle_idling = true;
	
	_unit = _this select 0;
	
	// Event handlers needed to kick players out of animations when shot or killed. "AnimDone" is for looping animations.
	_HandleDamage_EH = player addEventHandler ["HandleDamage", comIdle_HandleDamage_EH];
	_Killed_EH = player addEventHandler ["Killed", comIdle_Killed_EH];
	_AnimDone_EH = player addEventHandler ["AnimDone", comIdle_AnimDone_EH];
	
	// The player is given a variable unique to the player since OnPlayerDisconnect doesn't have the player's unit.
	_playerVariable = format["comIdle_player_%1",getPlayerUID player];
	player setVariable [_playerVariable, true, true];
	
	[[[player], {(_this select 0) switchMove "Acts_Abuse_abusing"}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
	[[[_unit], {(_this select 0) switchMove "Acts_Abuse_abuser"}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
	
	_pos = getPosATL player;
	player attachTo [_unit,[0,0,0]];
	waitUntil {_pos select 0 != getPosATL player select 0 || _pos select 1 != getPosATL player select 1 || _pos select 2 != getPosATL player select 2};
	sleep 0.5;
	detach player;
	
	//Make the abused unit run the same waitUntil in case the abuser disconnected.
	[[[player,_unit], {
		comIdle_idling = true;
		
		_abuser = _this select 0;
		_unit = _this select 1;
		
		_HandleDamage_EH = _unit addEventHandler ["HandleDamage", comIdle_HandleDamage_EH];
		_Killed_EH = _unit addEventHandler ["Killed", comIdle_Killed_EH];
		_AnimDone_EH = _unit addEventHandler ["AnimDone", comIdle_AnimDone_EH];
		
		_playerVariable = format["comIdle_player_%1",getPlayerUID _unit];
		_unit setVariable [_playerVariable, true, true];
			
		waitUntil {!(_unit getVariable ["comIdle_abuseMe",false]) || !comIdle_idling  || !alive _abuser || !alive _unit || vehicle _abuser != _abuser || vehicle _unit != _unit};
		
		[_unit] spawn {
			_unit = _this select 0;
			if (!comIdle_hit) then {
				while {!(call comIdle_anim_check) && alive _unit} do {
					[[[_unit], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
					sleep 0.1;
				};
			};
		};
		
		comIdle_hit = false;

		_unit removeEventHandler ["HandleDamage",_HandleDamage_EH];
		_unit removeEventHandler ["Killed",_Killed_EH];
		_unit removeEventHandler ["AnimDone",_AnimDone_EH];
		
		_unit setVariable [_playerVariable, false, true];
	}], "BIS_fnc_spawn", _unit, false] spawn BIS_fnc_MP;
	
	waitUntil {!(_unit getVariable ["comIdle_abuseMe",false]) || !alive player || !alive _unit || !comIdle_idling || vehicle player != player || vehicle _unit != _unit};
	
	comIdle_idling = false;
	
	[] spawn {
		if (!comIdle_hit) then {
			while {!(call comIdle_anim_check) && alive player} do {
				[[[player], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
				sleep 0.1;
			};
		};
	};
	
	comIdle_hit = false;
	
	player removeEventHandler ["HandleDamage",_HandleDamage_EH];
	player removeEventHandler ["Killed",_Killed_EH];
	player removeEventHandler ["AnimDone",_AnimDone_EH];
	
	player setVariable [_playerVariable, false, true];
};

//======================================================================================
// Animation Check
//======================================================================================
// Checks if a player is in a "default" animation.
comIdle_anim_check = {
	_return = false;
	
	switch (animationState player) do {
		//Primary weapon
		case "amovpercmstpsraswrfldnon";
		case "aadjpercmstpsraswrfldup";
		case "aadjpercmstpsraswrfldleft";
		case "aadjpercmstpsraswrfldright";
		
		case "amovpknlmstpsraswrfldnon";
		case "aadjpknlmstpsraswrfldup";
		case "aadjpknlmstpsraswrfldleft";
		case "aadjpknlmstpsraswrfldright";
		
		case "amovppnemstpsraswrfldnon";
		case "aadjppnemstpsraswrfldup";
		case "aadjppnemstpsraswrfldleft";
		case "aadjppnemstpsraswrfldright";
		
		case "amovpercmstpslowwrfldnon";
		case "amovpknlmstpslowwrfldnon";
		
		//Secondary weapon
		case "amovpercmstpsraswpstdnon";
		case "aadjpercmstpsraswpstdup";
		case "aadjpercmstpsraswpstdleft";
		case "aadjpercmstpsraswpstdright";
		
		case "amovpknlmstpsraswpstdnon";
		case "aadjpknlmstpsraswpstdup";
		case "aadjpknlmstpsraswpstdleft";
		case "aadjpknlmstpsraswpstdright";
		
		case "amovppnemstpsraswpstdnon";
		case "aadjppnemstpsraswpstdup";
		case "aadjppnemstpsraswpstdleft";
		case "aadjppnemstpsraswpstdright";
		
		case "amovpercmstpslowwpstdnon";
		case "amovpknlmstpslowwpstdnon";
		
		//Launcher weapon
		case "amovpercmstpsraswlnrdnon";
		case "amovpknlmstpsraswlnrdnon";
		
		//Unarmed
		case "amovpercmstpsnonwnondnon";
		case "amovpknlmstpsnonwnondnon";
		case "amovppnemstpsnonwnondnon";
		
		//Binoculars
		case "amovpercmstpsoptwbindnon";
		case "amovpknlmstpsoptwbindnon";
		case "amovppnemstpsoptwbindnon": {_return = true};
	};
	
	_return
};
