----------------------------------------------------------------------------------------------------
-- localized English (main) strings
--

--get the AddOn engine
local AddOnName = ...;

--force localization to Spanish (only for testing)
--_G.GAME_LOCALE = "esES"

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

--main strings
L["LOAD_MESSAGE"] = "%s (version |cff0070de%s|r) loaded, type /%s or /%s for options."
L["CONFIG_WINDOW"] = "%s (version |cff0070de%s|r) by |cffffffffCecile|r - |cff0070deEU|r - |cffff2020Zul'jin|r"
L["PROFILES"] = "Profiles"
L["ABOUT"] = [[

This AddOn allows to automatically |cff82c5ffskip|r in-game |cff82c5ffcinematics|r.

Could be |cff82c5ffconfigured|r to skip cinematics |cff82c5ffalready seen|r by the current |cff82c5ffchar|r, any |cff82c5ffaccount|r char or |cff82c5ffall|r cinematics.

By |cff82c5ffdefault|r will |cff82c5ffskip|r cinematics already |cff82c5ffseen by any char|r in the account |cff82c5ffsince AddOn installation|r.


|cff0070deUsage:|r


Type |cff82c5ff/clm|r to |cff82c5ffconfigure|r the AddOn.

Type |cff82c5ff/clm play|r to |cff82c5ffview|r the |cff82c5fflast|r cinematic.

Type |cff82c5ff/clm play <number>|r to |cff82c5ffview a particular|r cinematic.


|cff0070deNotes:|r

This AddOn is made by a request from |cff82c5ffLaodice|r (AKA the terror of |cff0070deEU|r - |cffff2020Zul'jin|r Auction House)

]]