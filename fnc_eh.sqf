comIdle_HandleDamage_EH = {
	_unit = _this select 0;
	_damage = _this select 2;
	
	// If the _unit is a bot for certain animations, the damage will be "passed" to the player.
	// It can't be enough damage to kill the player since it would bypass FAR revive and that would be shitty.
	if (!isPlayer _unit) then {
		// The _unit it turned into the player since the bot is deleted when the animation is cancelled, thus cancelling
		// the bot's animation is pointless.
		_unit = player;
		_hp = (damage player) + _damage;
		if (_hp >= 0.95) then {
			player setDamage 0.95;
		} else {
			player setDamage _hp;
		};
	};
	
	// For animations where you put another unit into an animation
	[_unit] spawn {
		_unit = _this select 0;
		while {!(call comIdle_anim_check) && alive _unit} do {
			if (_unit != player) then {
				[[[_unit], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
				[[[player], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
			} else {
				[[[_unit], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
			};
			sleep 0.1;
		};
	};
	
	comIdle_idling = false;
	comIdle_hit = true;
};

// Prevents people from being dead in their idle animation. In other words, this will drop them to the ground.
comIdle_Killed_EH = {
	_unit = _this select 0;
	
	// For animations where you put another unit into an animation
	[_unit] spawn {
		_unit = _this select 0;
		while {!(call comIdle_anim_check) && alive _unit} do {
			if (_unit != player) then {
				[[[_unit], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
				[[[player], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
			} else {
				[[[_unit], {(_this select 0) switchMove ""}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
			};
			sleep 0.1;
		};
	};
	
	comIdle_idling = false;
	comIdle_hit = true;
};

// Loops animation automatically
comIdle_AnimDone_EH = {
	comIdle_loop = true;
};

//If a player disconnects their animation is cancelled and their bot, if any, is deleted
[{
	if (isNil "comIdle_onPlayerDisconnected") then {
		comIdle_onPlayerDisconnected = true;
		
		["comIdle_onPlayerDisconnected_someId", "onPlayerDisconnected", {
			// The bot was given a variable unique to the player that spawned it so that it can be deleted in the event that the
			// player disconnects from the server.
			_botVariable = format["comIdle_bot_%1",_uid];
			{
				if (_x getVariable [_botVariable, false]) then
				{
					deleteVehicle _x;
				};
			} forEach allUnits;
			
			// If you're in a vehicle you can't run idle animations. This prevents the body from doing anything weird. Just in case.
			_playerVariable = format["comIdle_player_%1",_uid];
			{
				if (vehicle _x == _x && _x getVariable [_playerVariable, false]) then {
					[[[_x], {
						_unit = _this select 0;
						_unit switchMove "";
						_unit hideObject false;
					}], "BIS_fnc_spawn", true, false] spawn BIS_fnc_MP;
				};
			} forEach allUnits;
		}] call BIS_fnc_addStackedEventHandler;
	};
}, "BIS_fnc_spawn", false, false] spawn BIS_fnc_MP;


