#define _ARMA_

class CfgPatches
{
	class FG2_flashlights
	{
		name = "FG2 Flashlight Fix";
		author = "l4ndl0rd";
		requiredAddons[] =
		{
			"rhsusf_weapons"
		};
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		
	};
};
class CfgWeapons
{
	class acc_pointer_IR;
	class rhsusf_acc_anpeq15: acc_pointer_IR
	{
		class ItemInfo;
	};
	class rhsusf_acc_anpeq15_light: rhsusf_acc_anpeq15
	{
		class ItemInfo: ItemInfo
		{
			class Pointer{};
			class FlashLight
			{
				color[] = {233,233,255};
				ambient[] = {0.6,0.7,0.8};
				intensity = 200;
				innerAngle = 16;
				outerAngle = 100;
				coneFadeCoef = 10;
				dayLight = 1;
				useFlare = 1;
				FlareSize = 2;
				flareMaxDistance = 300;
				size = 1;
				onlyInNvg = 0;
				position = "flash dir";
				direction = "flash";
				scale[] = {0};
				class Attenuation
				{
					start = 0.5;
					constant = 32;
					linear = 1;
					quadratic = 0.2;
					hardLimitStart = 63;
					hardLimitEnd = 90;
				};
			};
		};
	};
};
