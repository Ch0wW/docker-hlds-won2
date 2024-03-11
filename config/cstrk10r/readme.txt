______________________________________
Counter-Strike Mod for Half-Life
v1.0 Release Documentation -- Readme.txt
http://www.counter-strike.net
______________________________________

v1.0
-----
[11.8.00]
- added three new weapons:
  (H&K UMP .45, FN Five-Seven, & SIG SG-550)
- redone player models
- incorporated Valve's model blending technology
- left beta stages



BETA 7.1
--------
[9.13.00]

- fixed de_vegas crashing
- tweaked burst fire accuracy system
- slightly improved vehicle code
- included missing skies (for cs_arabstreets, de_train)
- fixed mp_timelimit bug
- added APC to cs_siege
- new server variable, "mp_maxrounds X"   {X = maximum number of rounds to be played on a map, if X = 0, then maps will rotate based on mp_timelimit}
- fixed crosshairs {They now expand regardless of lag}
- fixed player heights {Player's POV is now representative of the third person player model}
- fixed shotgun not showing up in VGUI menus in as_ maps for CTs
- included new death icon for headshots



BETA 7.0
--------
[8.26.00]

- added dual Berettas
- added redone Knife Model (added a secondary attack mode for knife)
- fully implemented VGUI
- added new player model (Seal Team 6)
- added several new player animations
- fixed locked chasecam
- gave VIP a USP
- added cs_office, as_highrise, cs_arabstreets, de_foption & de_vegas
- fixed many bugs & exploits
- added driveable vehicle support
- added driveable vehicle test map de_jeepathon2000

New Commands:
------------

setinfo vgui_menus X  
{X = 0 or 1,  0 disables VGUI menus, 1 enables VGUI menus}
(also available through the "Play CS" > "Customize" menu)

*Note: If the buy weapon system malfunctions, disable the vgui
through the "Play CS" > "Customize" menu

*Note: de_jeepathon2000 is meant as a test/prototype map only.






BETA 6.6
--------
[6.22.00]

- added new command 'timeleft'
- fixed stalled connection bug
- new sniper crosshair
- fixes "laggy rifle firing"
- fixed many cheats
- updated cs_estate

New Commands:
------------

timeleft
{tells you how much time is left on the map}



BETA 6.5
--------
[6.8.00]

- Integrates Valve's rewrite of the HL networking system
- Added Smoke Grenade
- Added "Gorilla Warface" player model
- Redone models for .45 USP, M3,  SG-552, and Colt M4A1 
- Added more realistic smoke f/x, and shell ejection
- Added Valve's Chasecam modes (roam, free, and locked)
- Integrates Nighthawk's Model Bounds Checker algorithm
- Added as_forest.bsp, de_cbble.bsp, de_aztec.bsp, as_tundra.bsp, cs_italy, es_trinity, cs_estate
- Added map voting system
- Updated maps


New Map Voting System:
---------------------

players type 'listmaps' to see the maps available to vote on, and then they type 
'votemap X'      where X is the corresponding number of the map.

Server admins who want to add new maps must also 
add an entry into mapcycle.txt,  that allows players 
to vote on any new maps.


New 6.5 Commands:
-----------------

fastsprites X    
x = 0   : regular transparent smoke grenade sprites
x = 1   : simple transparent smoke grenade sprites
x = 2   : VERY simple transparent smoke grenade sprites

max_shells   X         
X = maximum number of shells at one time

max_smokepuffs   X       
X = max. number of smoke puffs at one time

mp_tkpunish  0/1       
if set to 1, TK'ers will sit out next round

mp_hostagepenalty   X       
X = max. number of hostages you can kill before the server boots you out... setting this to 0 will shut off this command

mp_logmessages  0/1   
used for server admins to spit out chat messages in their log files

mp_forcechasecam  0/1
Setting this to 1 will force chasecam to be teammate only
(useful for LAN games)





BETA 6.1
[server side only]
--------
[3.24.00]
- off center shooting fixed
- greatly improved nightvision
- can buy nightvision using the 'buyequip' command
- ammo bugs fixed
- 120 round limit for the mp5 and tmp
- prisoners are notified when someone escapes
- draw games eliminated, now scenario specific
- new TK 1 round "time-out" penalty 


BETA 6.0
--------
[3.10.00]

- added MAC-10 weapon
- added Steyr Aug weapon
- added new gametype: Assassination (as_x)
- added new gametype: Escape (es_x)
- added right and left handed weapons
- added new radar tracking for teammates
- re-added Night Vision Goggles
- added new Terrorist Snow player model
- added new CT French GIGN player model
- tweaked player speeds / acceleration
- added new radio commands
- redone mp5 model / animations
- added maps de_fang, es_jail, es_frantic,
  as_oilrig, as_riverside, cs_747
- updated previous maps



Misc 6.0 Notes:
---------------
Assassination Gameplay: One member of the CT team will serve as the VIP.
The object is to get the VIP safely to the pre-defined escape points. If he
dies, the CT's lose the round. If he makes it safely, the CT's win. VIP has
a unique skin, only carries a knife, and has ample body armor. Certain
weapons cannot be purchased by each team in this gameplay scenario.

Escape Gameplay: The T team starts out in a fortified location and must
"escape" to one of the pre-defined escape points. The CT's must exterminate
them before they can escape. The T's win the round once 50% of the team has
successfully escaped. They can also break into the armory to steal weapons,
or just get out of there. The two teams will switch roles after every 8
rounds of play.

After buying NVG, you toggle it on/off by using the "nightvision" command. Be
warned that the NVG will not be effective on every hardware setup. It may or not
work well for you.

To switch between right and left hand weapons, go to:
multiplayer > Customize > Advanced Options
There will be a checkbox for you to select the hand of your choice.








BETA 5.2
--------
[1.10.00]

- Fixed crashing bugs 
- Implemented a new lower bandwidth chasecam
- Prevented players from changing name when they're dead
- Fixed scoreboard not showing 20 players
- Show scoreboard at the end of the map rotation



BETA 5.0
--------
[12.23.99]

New Content:
- Added Benelli XM 1014 fully automatic shotgun
- New Hostage model and two new skins.
- SAS model added as a selectable CT
- Added maps cs_backalley and de_train
- Updated maps cs_station, de_nuke, de_dust, and de_prodigy
- New icons for HUD (money, weapons, armor, timer, C4, defuse Kit, scoreboard)
- Added buy zones, reload zones, hostage, and bomb target zones to HUD.
- an extensive help manual located at \half-life\cstrike\manual\index.htm.
- Verbose Auto-help
- added auto-id

Gameplay Changes:
- C4 is now an equipment item in slot 5 (to plant, select then hold down fire)
- C4 can only be planted in bomb delivery zone
- To defuse a bomb Counter Terrorists must target C4, press and hold the USE key
- CTs can defuse C4 without a defuse kit in 10 seconds
- CTs can defuse C4 with a defuse kit in 5 seconds 
- A progress meter is added showing CTs their progress defusing a bomb
- A progress meter is added showing Ts their progress planting a bomb (this takes 3 seconds)
- Defuse kit now an item which can be purchased - Nobody starts with a defuse kit
- Defusing bomb wins round for Counter Terrorists
- C4 can be dropped for other teammates
- Hostages are automatically rescued at hostage rescue zones
- Counter Terrorist and Terrorist teams are now labeled
- Individual frags can be toggled on or off
- Ghosts can be made visible to other ghosts (client defined)
- Pre-Round grace timer standard setting 6 seconds (server defined)
- Three observer modes: classic ghost, locked chasecam and freelook chasecam ( press jump to toggle)
- Auto-find teammate in observer mode (primary fire)
- New radio messages and organization of radio keys (standard, group and report messages)
- Can hear other players reloading
- Mission briefing added to maps (can also be invoked during round)



BETA 4.1
--------
[12.1.99]

[server side only release]
-team chat while dead works
-icon mixup for bomb/defuser fixed
-slightly less money given to losers
-allow Ts to pick up C4 if it's not planted in the proper spot (crouch)
-default C4 timer to 35 seconds
-toned down P228
-prevent players from buying stuff when they're dead by using aliases
-accuracies tweaked



BETA 4.0
--------
[11.5.99]

- Added Sig P228 pistol, and Steyr Scout sniper rifle
- Added new gameplay scenario involving C4 bombs
- tweaked firing system for all guns
- added High-Explosive (HE) grenades
- modified hostage rescue scenario (rescuing 50% of the hostages will result in a CT win)
- modified kick vote system (only 65% of a team is needed to kick vote someone off)
- loose guns are removed at the start of a round. (no more gun running)
- loser bonuses are increased to allow the losing team to stand a fighting chance
- altered money bonuses for rescuing hostages :
- added cs_station, de_nuke, de_dust, de_prodigy
- modified cs_ship, cs_siege, cs_docks, cs_tire, cs_facility
- automatic flashbang .wav added back
- new, closer rescue points added to cs_ship, cs_siege, cs_tire
- new ammo system, primary and secondary (less mind boggling)



BETA 3.1
--------
[9.16.99]

- Bullet penetration bug fixed
- Radio .wav's now have lower volume
- Removed automatic .wav's (death, flashbang)
- fixed MRAD_ENEMYSPOTTED error
- Disorientation system changed
- Added "ignoreradio" command to only ignore .wav's
- Flashbang Shrapnel altered



BETA 3.0
--------
[9.14.99]

- Added a knife weapon for those last resort situations
- Added a kevlar+helmet combination
- *GREATLY* improved hostage path AI
- Added concussion grenades which shoot out shrapnel as well as a bright flash
- Added a new weapon, the Fabrique Nationale P90 submachine gun
- Added a radio system
- Modified the scoreboard
- modified the shotgun



BETA 2.1
--------
[8.17.99]

- added new vesion of cs_assault (compatible w/ hlserver.exe)
- added scientist model for hlserver.exe
- added assault's proper sky
- fixed telefragging  (cs_alley will no longer telefrag)
- fixed dropweapon
- fixed those spurious 'player joined' messages
- changed Ak-47 price



BETA 2.0
--------
[8.13.99]

NEW Features :
- Three new guns added : {Sig SG-552 Commando , AK-47 , Desert Eagle}
- Added silencers to the USP .45 Tactical and the Colt M4A1
- Added a round timer which shows how much time is left in the round
- Added team scores which shows how many rounds a team has won
- Added Night Vision Goggles
- Added new entity for mappers to use (info_hostage_rescue)
- Optimized all the models for lower r_speeds!
- Ability to assign keys to all of the commands from the controls menu  
  (courtesy of cannelbrae of Gunman project)



BETA 1.2
--------
[7.20.99]

- 5 second "molasses period" at the start of all rounds to dissuade rushing tactics 
- kick option added
- Refined the prices for some of the gunS
- made the kevlar MUCH more effective (it now covers people's arms) 
- made jumping and shooting MUCH more inaccurate for all the guns
- added a $16,000 salary cap 
- tweaked the bonus money awards. 
- tweaked the flashbangs effectiveness



BETA 1.1
--------
[6.27.99]

- greatly improved server stability, crashes should be eliminated
- primary servers will now work with CS
- fixed the ammo and armour reset bugs
- balanced the economic system a bit
- added new firing mode for the glock18
- enabled 'mp_friendlyfire' command for server admins
- fixed map rotation
- adds two new maps: cs_assault & cs_desert
- cs_siege fixes
- cs_wpndepot fixes



BETA 1.0
--------
[6.19.99]
Features :

- weapons: usp, glock, shotgun, m4a1, mp5 navy, TMP, awp, G3/SG-1 & FN M249 PARA 
- hostage rescue scenario
- custom maps: cs_siege, cs_mansion, cs_wpndepot, cs_prison



-------------------------------------------------------------



Counter-Strike is a modification (MOD) to the excellent game, Half-Life. It modifies the multiplayer aspects of Half-Life to bring to it a more team-oriented gameplay. Not terribly unlike Team Fortress 2, Counter-Strike provides the player with an experience that a trained counter-terrorist unit or terrorist unit experiences.
 
The MOD is team-based featuring one team playing the role of the terrorist and the other team playing the role of the counter-terrorist. Each side has access to different guns and equipment, as well as different abilities. Maps have have different goals such as: hostage rescue, assassination, bomb defusion, Terrorist escape, etc. 

Weapons include the usual assortment of pistols, shotguns, assault rifles, sniper rifles, grenades, demolition devices. Each side has access to a different subset of weapons so for example only the counter-terrorist can use the M4A1, and only the terrorists can use the AK-47.

We are confident that we've created a MOD quite unlike any other. We hope you will be immersed in
the frightening and intense world of Counter-Terrorism.






------------------ credits ---------------------------------


THE CS TEAM
-----------


| Name | Gooseman
| E-mail| gooseman@counter-strike.net 
| Position | Project leader, Head modeler, Head coder, Head-job



| Name | cliffe
| E-mail| cliffe@counter-strike.net 
| Position | 2d-graphics, sound effects, QA, PR, jack of all trades, etc.




The Mappers:
------------

cs_italy
by DigiChaos
& GlenC

as_highrise
by MattS aka [BA]Pantera
pantera@hushmail.com

cs_arabstreets
by Paramedic911
jason911@home.com

as_tundra
by Zaphod Beeblebrox
coyote@eudoramail.com

cs_estate
by Zaphod Beeblebrox
coyote@eudoramail.com

as_oilrig
by MacMan 
macmaninfi@aol.com

cs_backalley
by TYR 
tyr@barking-dog.com

de_aztec
by Barney (aka Narby)
fragged101@yahoo.com

de_vegas
by Cadaver

de_train
by Chris Mair
chris@barking-dog.com

cs_militia
by Andrew Aumann
andrewja@home.com

cs_747 
by Markus
witchdawn@hotmail.com

cs_docks
by N0TH1NG
N0TH1NG@mailcity.com

cs_siege
by N0TH1NG
N0TH1NG@mailcity.com

cs_assault 
by CryptR 
lmuur@dlc.fi

de_dust
by Davej
dv@btinternet.com

de_cbble
by Davej
dv@btinternet.com

de_prodigy
by Hobbit
hobbit@bellatlantic.net

cs_office
by Hobbit
hobbit@bellatlantic.net

de_nuke
by MEEEEDIC
jogi@netads.de


The texture Artists:
--------------------

Chris Ashton (aka Macman)
MacManInfi@aol.com

Ido Magal
ido@dnai.com 



Splash and Console 2d Art:
--------------------------

Cliffe

High Quality Shell:
------------------
John "Rizzuh" Jensen


Special Thanks:
---------------

Thanks to:
----------

Mr_Grim			: for his help in coding the radio system, and other things
BETA test team	        : for helping us test.. and for providing the occasional premature leak
Valve Software	        : for their constant support
Fanny			: for giving Gooseman motivation!
David "Nighthawk" Flor  : for the Model Bounds Checker algorithm
Mappers, Texture artists


Extra special thanks to:
-----------------------
Ben Wilder <wilder@cleanweb.net>
For writing the program to mirror the weapons to the right hand!

Also thanks to:
---------------
Oddjob, Mr. Grim, and Dallas Frank of the A-Team; Mindvision for the great installer; MTG; A.J. McLean; Hyperboy; BetaMax @ GFN (Brent Bussey); Valve Software; Art Min; Erik Johnston; Stikky & Adrian @ Gameplay; Lestat, Anarchy, Matt; BizzyBlaster; D0gzilla; Chris Mair; Barking Dog Studios; Gamefan Network; Mutated Jellyfish; Gameplay.com; Darkman; TeamGT; Justin Bunnell, Hal; Erik Johnston @ Valve; Leon Hartwig; Arcticom's Fro; shirow @ mod central; Geronimo; Peter North; Eyeburn; all the server admins who have helped us test .dll's; RzE; MatteusX; John Jensen, Mr. Fraggle, all the CS mappers and texture artists; and the CS players. 

---------------
For full, detailed information on playing Counter-Strike visit
BarrysWorld Guides - Counter Strike @:
http://guides.barrysworld.com/cs/

Also see manual.html in your cstrike directory for more documentation.






Console Commands:
-----------------



max_shells   X         
X = maximum number of shells at one time

max_smokepuffs   X       
X = max. number of smoke puffs at one time

mp_tkpunish  0/1       
if set to 1, TK'ers will sit out next round

mp_hostagepenalty   X       
X = max. number of hostages you can kill before the server boots you out... setting this to 0 will shut off this command

mp_logmessages  0/1   
used for server admins to spit ouf chat messages in their log files

mp_forcechasecam  0/1
Setting this to 1 will force chasecam to be teammate only
(useful for LAN games)

mp_friendly_grenade_damage 0/1
Toggles friendly grenade damage

mp_autoteambalance 0/1
Toggles auto balancing of teams

mp_limitteams (default 2)
Maximum number of players that one team can have over the other. To entirely disable team limiting, set to 0.

sv_restartround (default 0 sec)
Time until the game restarts fresh, or 0 to not restart. This will reset all frags, scores, weapons and money to default. Use this to coordinate clan matches.

mp_autokick (default 1)
Enable automatic team-killer banning and idle client kicking.

mp_c4timer (default 45 sec)
C4 timer duration. Minimum of 15, maximum of 90.

mp_freezetime (default 6 sec)
The length in seconds of the Freeze period at the beginning of rounds. Set to 0 to disable.

mp_roundtime (default 5 min)
The maximum length a round can last, in minutes. Minimum of 3, maximum of 15.

mp_friendlyfire (default 0)
Set to 1 to enable friendly fire, 0 to disable.

mp_timelimit (default 0 min)
Period between map rotations.

mp_footsteps (default 1)
Set to 1 to enable footsteps, 0 to disable.

mp_flashlight (default 1)
Set to 1 to enable the use of flashlights, 0 to disable.

*for a more complete and detailed listing of CS commands, visit:
http://server.counter-strike.net/cscmd.html


Client Options:


rate (default 2500)
This command controls how much information you recieve from the server you are connected to. For a 14.4 connection set your rate to 1500, a 33.6k connection should be 3000, a 56k 3500, an ISDN should be 5000, and all connections faster than that should be between 5000 and 9999.

cl_observercrosshair (default 1)
Set to 1 to enable crosshairs in Observer mode, 0 to disable.

nightvision
Bind this key to toggle NVG when purchased.

drawradar
Shows radar

hideradar
Hides radar.



InfoKey Keynames:
-----------------

dm (default 1)
Set to 1 to display map briefings after loading new levels, 0 to disable.

ah (default 1)
Set to 1 to enable auto-help, 0 to disable. Auto-help gives the player hint messages throughout the game.




---------------------



Don't forget to visit the other sites on the Counter-strike.net network!

The Official CS Web Site
http://www.counter-strike.net/

CSSkins
http://skins.counter-strike.net/

CSNation
http://csnation.counter-strike.net/


Counter-Server
http://server.counter-strike.net/

Z_Malloc Overflow
http://zmalloc.counter-strike.net/

Bots @ CS.net
http://bot.counter-strike.net/





--readme.txt by cliffe : any flames to cliffe@counter-strike.net


