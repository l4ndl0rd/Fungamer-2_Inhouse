if (!hasInterface) exitWith {};

[
	{
		!isNil "zen_context_menu_fnc_createAction"
		&& {!isNil "zen_context_menu_fnc_addAction"}
	},
	{
		if (missionNamespace getVariable ["FG2_DCP_ZEN_registered", false]) exitWith {};

		missionNamespace setVariable ["FG2_DCP_ZEN_registered", true];

		private _categoryAction = [
			"FG2_DCP_Category",
			"FG2 DC Protection",
			"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\defend_ca.paa",
			{},
			{true}
		] call zen_context_menu_fnc_createAction;

		private _categoryPath = [
			_categoryAction,
			[],
			10
		] call zen_context_menu_fnc_addAction;


		private _restoreDamageAction = [
			"FG2_DCP_RestoreDamage",
			"Restore Damage",
			"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca.paa",
			{
				params [
					"_position",
					"_objects",
					"_groups",
					"_waypoints",
					"_markers",
					"_hoveredEntity",
					"_args"
				];

				private _unit = objNull;

				if (!isNull _hoveredEntity && {_hoveredEntity isKindOf "CAManBase"}) then {
					_unit = _hoveredEntity;
				} else {
					{
						if (_x isKindOf "CAManBase") exitWith {
							_unit = _x;
						};
					} forEach _objects;
				};

				if (isNull _unit) exitWith {
					systemChat "[FG2][DCP] Keine gültige Einheit ausgewählt.";
				};

				if (!(_unit getVariable ["FG2_DCP_protected", false])) exitWith {
					systemChat format [
						"[FG2][DCP] Einheit ist nicht geschützt: %1",
						name _unit
					];
				};

				[_unit, "zen_context_restore_damage"] remoteExecCall [
					"FG2_DCP_fnc_requestResetUnit",
					2
				];

				systemChat format [
					"[FG2][DCP] Restore Damage angefordert für: %1",
					name _unit
				];

				diag_log format [
					"[FG2][DCP] ZEN RestoreDamage requested. unit=%1 name=%2",
					_unit,
					name _unit
				];
			},
			{
				params [
					"_position",
					"_objects",
					"_groups",
					"_waypoints",
					"_markers",
					"_hoveredEntity",
					"_args"
				];

				private _unit = objNull;

				if (!isNull _hoveredEntity && {_hoveredEntity isKindOf "CAManBase"}) then {
					_unit = _hoveredEntity;
				} else {
					{
						if (_x isKindOf "CAManBase") exitWith {
							_unit = _x;
						};
					} forEach _objects;
				};

				!isNull _unit
				&& {
					_unit getVariable ["FG2_DCP_protected", false]
				}
			}
		] call zen_context_menu_fnc_createAction;

		[
			_restoreDamageAction,
			_categoryPath,
			10
		] call zen_context_menu_fnc_addAction;

		diag_log "[FG2][DCP] ZEN context menu registered.";
	}
] call CBA_fnc_waitUntilAndExecute;