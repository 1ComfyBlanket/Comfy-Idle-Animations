class CfgPatches {
	class com_idle 
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};	
		author[]= {"comfy blanket"}; 		
	};
};

class Extended_PostInit_EventHandlers 
{
		com_idle_Init = "if (!isDedicated) then {[] execVM '\com_idle\init.sqf'}";
};
