params["_ourPlayer", "_radiusPlayerDetected"];
_listEntitiesNear = (getPos _ourPlayer) nearEntities ["Man",_radiusPlayerDetected];
_listEnemiesNear = [];

{
	if (side _x == east && alive _x) then
		{
			_listEnemiesNear pushBack _x;
		};
} forEach _listEntitiesNear;

_knowingEnemies = [];
{
	if (_x knowsAbout _ourPlayer > 1.6) then {
		_knowingEnemies pushBack _x;
	}
} forEach _listEnemiesNear;
//hint str(_knowingEnemies);
_knowingEnemies;