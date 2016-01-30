----------------------------------------------------------------------------------------------------
-- localized English (cinematics module) strings
--

--get the add-on engine
local AddOnName = ...;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

--window module
L["CINEMATICS"] = "Cinematics"
L["CINEMATICS_MESSAGE"] = "%s : %s"
L["CINEMATICS_SKIP"] = "Cinematic |cff0070de%d|r |cffff0000skipped|r, type |cff0070de/%s play|r or |cff0070de/%s play %d|r to view it."
L["CINEMATICS_SKIP_GLOBAL"] = "Skip by any char"
L["CINEMATICS_SKIP_GLOBAL_DESC"] = "Skip the cinematics that has been seen by any char"
L["CINEMATICS_SKIP_CHAR"] = "Skip by this char"
L["CINEMATICS_SKIP_CHAR_DESC"] = "Skip the cinematics that has been seen by this char"
L["CINEMATICS_SKIP_ALL"] = "Skip All"
L["CINEMATICS_SKIP_ALL_DESC"] = "Skip all cinematics, regardless if they are seen or not"
L["CINEMATICS_PLAYING"] = "Playing cinematic : |cff0070de%d|r."