
Protection for player disconnect. Player units are set to be invulnerable automatically to prevent them from dying. Once the player reconnects and the unit is local to their pc again, the invulnerability is removed.

!ATTENTION! initPlayerServer will never be executed on servers that have the remote execution deactivated. There is a workaround tho. Use the search function to find that. This mod was created for the community I roll 
with, that does not have this limitation.

Instruction:

-   place the fg2_dbProtection.fsm into your mission
-   create a initPlayerServer.sqf and execFSM the fsm from there
-   for debugging purpose it is highly recommended to have at least one gamemaster module for the logged admin present.
    the protection will also fire if a player leaves early and noone takes over the unit - another player taking over that slot should be fine