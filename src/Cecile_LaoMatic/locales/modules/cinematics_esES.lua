----------------------------------------------------------------------------------------------------
-- localized Spanish (cinematics module) strings
--

--get the add-on engine
local AddOnName = ...;

--Spanish or Latin America Spanish
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esES")
if not L then
  L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esMX");
  if not L then
    return;
  end
end

--window module
L["CINEMATICS"] = "Cinematicas"
L["CINEMATICS_MESSAGE"] = "%s : %s"
L["CINEMATICS_SKIP"] = "Cinematica |cff0070de%d|r |cffff0000saltada|r, teclea |cff0070de/%s play|r o |cff0070de/%s play %d|r para verla."
L["CINEMATICS_SKIP_GLOBAL"] = "Saltar cualquier personaje"
L["CINEMATICS_SKIP_GLOBAL_DESC"] = "Salta las cinematicas vistas por cualquier personaje"
L["CINEMATICS_SKIP_CHAR"] = "Saltar este personaje"
L["CINEMATICS_SKIP_CHAR_DESC"] = "Saltar las cinematicas vista por este personaje"
L["CINEMATICS_SKIP_ALL"] = "Saltar Todas"
L["CINEMATICS_SKIP_ALL_DESC"] = "Salta todas las cinematicas, independientemente de que se hayan visto o no"
L["CINEMATICS_PLAYING"] = "Reproduciendo cinematica : |cff0070de%d|r."
