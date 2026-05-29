class CfgPatches
{
	class FG2_DC_Protection
	{
		name = "FG2 DC Protection";
		author = "l4ndl0rd";
		url = "";

		requiredVersion = 2.18;
		requiredAddons[] =
		{
			"cba_main",
			"cba_xeh"
		};

		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class FG2_DCP
	{
		tag = "FG2_DCP";

		class Core
		{
			file = "\fg2_dcProtection\functions";

			class initServer {};
			class registerZenContext {};

			class isProtected {};
			class resetUnit {};
			class resetAll {};
			class requestResetUnit {};

			class handleDisconnect {};
			class handleUserSelectedPlayer {};
		};
	};
};

class Extended_PostInit_EventHandlers
{
	class FG2_DC_Protection
	{
		init = "call FG2_DCP_fnc_initServer; call FG2_DCP_fnc_registerZenContext;";
	};
};

/*
	Fallback-Whitelist für Missionen mit restriktivem RemoteExec.

	Hinweis:
	Wenn eine Mission ihre eigene CfgRemoteExec hart einschränkt oder überschreibt,
	muss FG2_DCP_fnc_requestResetUnit ggf. zusätzlich in der missionseigenen
	description.ext erlaubt werden.
*/
class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;

		class FG2_DCP_fnc_requestResetUnit
		{
			allowedTargets = 2;
		};
	};
};