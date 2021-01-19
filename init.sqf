// Comfy Idle Animations by comfy blanket
// version 1.51 for ACE 

// #include "\userconfig\com_idle\com_idle_config.hpp"

if (isDedicated) exitWith {};

waitUntil {!(isnull (findDisplay 46)) && !isNil "ace_interact_menu_fnc_createAction" && !isNil "ace_interact_menu_fnc_addActionToObject"};

comIdle_idling = false;
comIdle_hit = false;

call compile preprocessFileLineNumbers "com_idle\fnc_anim.sqf";
call compile preprocessFileLineNumbers "com_idle\fnc_eh.sqf";

//======================================================================================
// Menu Selection Actions
//======================================================================================
// The 'comment "";' lines prevent a 'Type Script, expected Bool' error.
// Except not anymore with ACE but I'm just leaving it there.

// ACE self-interact entry for animations
_action = ['comIdle_stances','Idle Stances','',{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Cancel animation
_action = ['comIdle_stop','Cancel Animation','',{["stop"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances"], _action] call ace_interact_menu_fnc_addActionToObject;

// Standing animations
_action = ['comIdle_standing','Standing','',{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_stand','Stand','',{["stand"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_big_guy','Big Guy','',{["big_guy"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_briefing_active','Active Briefing','',{["briefing_active"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_piss','Piss','',{["piss"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_navigate','Navigate','',{["navigate"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_guide','Guide','',{["guide"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_signal','Signal','',{["signal"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_radio','Radio','',{["radio"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_arrested','Arrested','',{["arrested"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_briefing','Briefing','',{["briefing"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_interrogative','Interrogative','',{["interrogative"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_speaking','Speaking','',{["speaking"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_starter_pistol','Starter Pistol','',{["starter_pistol"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_standing"], _action] call ace_interact_menu_fnc_addActionToObject;

// Sitting animations
_action = ['comIdle_sitting','Sitting','',{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_sit','Sit','',{["sit"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_sitting"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_sit_table','Sit Table','',{["sit_table"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_sitting"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_sit_high','Sit High','',{["sit_high"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_sitting"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_relax','Relax','',{["relax"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_sitting"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_sit_chair','Sit Chair','',{["sit_chair"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_sitting"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_sit_table_chair','Sit Chair Table','',{["sit_table_chair"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_sitting"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_gaming','Gaming','',{["gaming"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_sitting"], _action] call ace_interact_menu_fnc_addActionToObject;

// Miscellaneous Animations
_action = ['comIdle_misc','Miscellaneous','',{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_allow_abuse','Allow Abuse','',{["allow_abuse"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_abuse_target','Abuse Target','',{["abuse_target"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_repair','Repair','',{["repair"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_epic_split','Epic Split','',{["epic_split"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_under_fire','Under Fire','',{["under_fire"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_fire_left','Fire Left','',{["fire_left"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_injured','Injured','',{["injured"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['comIdle_karate','Karate','',{["karate"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

// _action = ['comIdle_repair_wheel','Repair Wheel','',{["repair_wheel"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
// [player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

// _action = ['comIdle_repair_varied','Repair Varied','',{["repair_varied"] call com_idle_play;},{true}] call ace_interact_menu_fnc_createAction;
// [player, 1, ["ACE_SelfActions", "comIdle_stances", "comIdle_misc"], _action] call ace_interact_menu_fnc_addActionToObject;

// Animation function
com_idle_play = {
	if (vehicle player != player || !alive player) exitWith {};

	_gesture = _this select 0;
	
	switch (_gesture) do {
		case "stop": {
			if (!comIdle_idling) exitWith {};
			comIdle_idling = false;
			
		}; 
		case "allow_abuse": {
			if (player getVariable ["comIdle_abuseMe",false]) then {
				player setVariable ["comIdle_abuseMe",false,false];
			} else {
				player setVariable ["comIdle_abuseMe",true,true];
				hintSilent "You can now be abused!";
				[] spawn {
					for "_i" from 1 to 1200 do {
						if (!(player getVariable ["comIdle_abuseMe",false])) exitWith {};
						sleep 0.1;
					};
					player setVariable ["comIdle_abuseMe",false,true];
					hintSilent "You can no longer be abused.";
				};
				comment "";
			};
		};
		case "briefing": 	{
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubBriefing_lookAround1","HubBriefing_lookAround2","HubBriefing_pointAtTable","HubBriefing_pointLeft","HubBriefing_pointRight","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_talkAround","HubBriefing_think"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "sit": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1","HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1","HubSittingChairC_idle1","HubSittingChairC_idle2","HubSittingChairC_idle3","HubSittingChairC_move1"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		/*
		case "walk": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_Ending_Adams1","Acts_Ending_Adams2","Acts_Ending_Adams3","Acts_Ending_Lacey1","Acts_Ending_Lacey2","Acts_Ending_Lacey3"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		*/
		case "sit_table": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubSittingAtTableU_idle1","HubSittingAtTableU_idle2","HubSittingAtTableU_idle3"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "sit_high": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubSittingHighB_idle1","HubSittingHighB_idle2","HubSittingHighB_idle3"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "stand": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3","HubStandingUC_idle1","HubStandingUC_idle2","HubStandingUC_idle3","HubStandingUC_move1","HubStandingUC_move2"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "big_guy": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubStandingUB_idle1","HubStandingUB_idle2","HubStandingUB_idle3","HubStandingUB_move1"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "repair": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubFixingVehicleProne_idle1"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "repair_varied": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["InBaseMoves_assemblingVehicleErc","InBaseMoves_repairVehicleKnl","InBaseMoves_repairVehiclePne"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		/*
		case "abused": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_Abuse_abuser"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		*/
		case "briefing_active": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_C_in1_briefing","Acts_A_M01_briefing","Acts_A_M02_briefing","Acts_A_M03_briefing","Acts_A_M04_briefing","Acts_A_M05_briefing","Acts_A_OUT_briefing"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "abuse_target": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_unit = cursorTarget;
			if (!(_unit isKindOf "MAN") || _unit distance player > 5 || !alive _unit || !(_unit getVariable ["comIdle_abuseMe",false])) exitWith {};
			[_unit] spawn comIdle_abuseAnim;
			comment "";
		};
		case "piss": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_AidlPercMstpSlowWrflDnon_pissing"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "navigate": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_NavigatingChopper_Loop"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "wave": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_PercMstpSlowWrflDnon_handup1","Acts_PercMstpSlowWrflDnon_handup1b","Acts_PercMstpSlowWrflDnon_handup1c","Acts_PercMstpSlowWrflDnon_handup2","Acts_PercMstpSlowWrflDnon_handup2b","Acts_PercMstpSlowWrflDnon_handup2c"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "guide": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_ShowingTheRightWay_loop"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "signal": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_SignalToCheck"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "epic_split": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_EpicSplit"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "radio": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_Kore_TalkingOverRadio_loop"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "relax": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_SittingWounded_wave","Acts_SittingWounded_breath"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "arrested": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["AmovPercMstpSsurWnonDnon"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "sit_chair": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1","HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1","HubSittingChairC_idle1","HubSittingChairC_idle2","HubSittingChairC_idle3","HubSittingChairC_move1"];
			[_animArray,"chair"] spawn comIdle_plainAnim;
			comment "";
		};
		case "sit_table_chair": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["HubSittingAtTableU_idle1","HubSittingAtTableU_idle2","HubSittingAtTableU_idle3"];
			[_animArray,"chair"] spawn comIdle_plainAnim;
			comment "";
		};
		/*
		case "sit_toilet": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_obj = cursorTarget;
			if (player distance _obj > 5 || (typeOf _obj != "Land_ToiletBox_F" && typeOf _obj != "Land_Toilet")) exitWith {};
			_animArray = ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1","HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1","HubSittingChairC_idle1","HubSittingChairC_idle2","HubSittingChairC_idle3","HubSittingChairC_move1"];
			[_animArray,"toilet_sit",_obj] spawn comIdle_plainAnim;
			comment "";
		};
		*/
		case "piss_toilet": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_obj = cursorTarget;
			if (player distance _obj > 5 || (typeOf _obj != "Land_ToiletBox_F" && typeOf _obj != "Land_Toilet")) exitWith {};
			_animArray = ["Acts_AidlPercMstpSlowWrflDnon_pissing"];
			[_animArray,"toilet_piss",_obj] spawn comIdle_botAnim;
			comment "";
		};
		/*
		case "lacey_test": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["LaceyTest2a"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		*/
		case "under_fire": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["acts_CrouchingCoveringRifle01"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "fire_left": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["acts_CrouchingFiringLeftRifle01","acts_CrouchingFiringLeftRifle02","acts_CrouchingFiringLeftRifle03","acts_CrouchingFiringLeftRifle04"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "injured": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_UnconsciousStandUp_part1"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "karate": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["AmovPercMstpSnonWnonDnon_exerciseKata"];
			[_animArray] spawn comIdle_botAnim;
			comment "";
		};
		case "interrogative": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_Abuse_Akhanteros"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "speaking": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_StandingSpeakingUnarmed"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "gaming": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_BoatAttacked03"];
			[_animArray,"laptop"] spawn comIdle_botAnim;
			comment "";
		};
		case "starter_pistol": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_starterPistol_fire"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
		case "repair_wheel": {
			if (comIdle_idling || !(call comIdle_anim_check)) exitWith {};
			_animArray = ["Acts_carFixingWheel"];
			[_animArray] spawn comIdle_plainAnim;
			comment "";
		};
	};
};

