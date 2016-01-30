----------------------------------------------------------------------------------------------------
-- localized Spanish (main) strings
--

--get the AddOn engine
local AddOnName = ...;

--Spanish or Latin America Spanish
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esES")
if not L then
	L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esMX");
	if not L then
		return;
	end
end

--main strings
L["LOAD_MESSAGE"] = "%s (versión |cff0070de%s|r) cargado, escribe /%s o /%s para opciones."
L["CONFIG_WINDOW"] = "%s (version |cff0070de%s|r) creado por |cffffffffCecile|r - |cff0070deEU|r - |cffff2020Zul'jin|r"
L["MINIMAP_LABEL"] = "%s (|cff0070de%s|r)"
L["MINIMAP_HELP_1"] = "|cFFCFCFCFClick Izquierdo|r: Abre el lanzador"
L["MINIMAP_HELP_2"] = "|cFFCFCFCFClick Derecho|r: Abre la configuración"
L["PROFILES"] = "Perfiles"
L["BINDING_DESC"] = "Abrir Lanzador Rápido"
L["LAUNCH_BINDING_DESC"] = "Lanzar Último Comando"
L["ABOUT"] = [[

Este AddOn permite |cff82c5ffsaltar|r automaticamente las |cff82c5ffcinematicas|r en el juego.

Se puede |cff82c5ffconfigurar|r para saltar cinematicas |cff82c5ffya vistas|r por el |cff82c5ffpersonaje|r actual, cualquier personaje de la |cff82c5ffcuenta|r o |cff82c5fftodas|r las cinematicas.

Por |cff82c5ffdefecto|r se |cff82c5ffsaltar|r las cinematicas |cff82c5ffvistas por cualquier personaje|r de la cuenta |cff82c5ff desde la instalacion del AddOn|r.


|cff0070deUso:|r


Teclea |cff82c5ff/clm|r para |cff82c5ffconfigurar|r el AddOn.

Teclea |cff82c5ff/clm play|r oara |cff82c5ffver|r la |cff82c5ffultima|r cinematica.

Teclea |cff82c5ff/clm play <numero>|r para ver una cinematica |cff82c5ffen particular|r.


|cff0070deNotas:|r

Este AddOn es una peticion de |cff82c5ffLaodice|r (AKA el terror de la subasta de |cff0070deEU|r - |cffff2020Zul'jin|r)

]]