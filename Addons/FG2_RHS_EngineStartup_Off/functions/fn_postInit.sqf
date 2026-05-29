/*
	FG2 RHS Engine Startup Off
	Disables RHS engine startup behavior globally.
*/

RHS_ENGINE_STARTUP_OFF = "off";

if (isServer) then
{
	publicVariable "RHS_ENGINE_STARTUP_OFF";
};