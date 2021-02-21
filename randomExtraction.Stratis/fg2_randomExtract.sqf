private ["_group1","_group2","_group3","_randnum"];
_group1 = _this select 0;
_group2 = _this select 1;
_group3 = _this select 2;
_randnum = round(random 2);


if (_randnum == 0) then
{
dostop EXT_1_1; EXT_1_1 land "LAND";
dostop EXT_1_2; EXT_1_2 land "LAND";
"LZ Alpha" setMarkerPos getPos LZ_1;
};

if (_randnum == 1) then
{
dostop EXT_1; EXT_1 land "LAND";
dostop EXT_1_2; EXT_1_2 land "LAND";
"LZ Bravo" setMarkerPos getPos LZ_2;
};

if (_randnum == 2) then
{
dostop EXT_1; EXT_1 land "LAND";
dostop EXT_1_1; EXT_1_1 land "LAND";
"LZ Charlie" setMarkerPos getPos LZ_3;
};