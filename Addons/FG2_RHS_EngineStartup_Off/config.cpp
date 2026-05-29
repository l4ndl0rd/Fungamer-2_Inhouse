#define _ARMA_

class CfgPatches
{
	class FG2_RHS_EngineStartup_Off
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] =
		{
			"rhs_main",
			"rhs_c_tanks",
			"rhsusf_main"
		};
		name = "FG2 RHS Engine Startup Off";
		author = "l4ndl0rd";
	};
};

class CfgFunctions
{
	class FG2_RHS_EngineStartup_Off
	{
		tag = "FG2_RHS_ENGINE";

		class Init
		{
			file = "\FG2_RHS_EngineStartup_Off\functions";
			class postInit
			{
				postInit = 1;
			};
		};
	};
};