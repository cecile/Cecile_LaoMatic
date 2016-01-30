----------------------------------------------------------------------------------------------------
-- cinematics module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("cinematics");

--get the locale
local L=Engine.Locale;

--debug
local debug = Engine.AddOn:GetModule("debug");

--module defaults
mod.Defaults = {
  profile = {
    skipSeeChar = false,
    skipSeeGlobal = true,
    skipAll = false,
  },
  char = {
    movies = {},
  },
  global = {
    movies = {},
  },
};

--module options table
mod.Options = {
  order = 2,
  name = L["CINEMATICS"],
  type = "group",
  args = {
    skipSeeChar = {
      order = 1,
      type = "toggle",
      name = L["CINEMATICS_SKIP_CHAR"],
      desc = L["CINEMATICS_SKIP_CHAR_DESC"],
      get = function()
        return Engine.Profile.cinematics.skipSeeChar;
      end,
      set = function(_,value)

        Engine.Profile.cinematics.skipSeeChar = value;

        Engine.AddOn:OnCfgChange();

      end,
    },
    skipSeeGlobal = {
      order = 2,
      type = "toggle",
      name = L["CINEMATICS_SKIP_GLOBAL"],
      desc = L["CINEMATICS_SKIP_GLOBAL_DESC"],
      get = function()
        return Engine.Profile.cinematics.skipSeeGlobal;
      end,
      set = function(_,value)

        Engine.Profile.cinematics.skipSeeGlobal = value;

        Engine.AddOn:OnCfgChange();

      end,
    },
    skipAll = {
      order = 3,
      type = "toggle",
      name = L["CINEMATICS_SKIP_ALL"],
      desc = L["CINEMATICS_SKIP_ALL_DESC"],
      get = function()
        return Engine.Profile.cinematics.skipAll;
      end,
      set = function(_,value)

        Engine.Profile.cinematics.skipAll = value;

        Engine.AddOn:OnCfgChange();

      end,
    },
  }
};

function mod:message(text)
  print(string.format(L["CINEMATICS_MESSAGE"],self.Version.Title, text));
end

function mod:LoadProfileSettings()
  self.charMovies = Engine.DB.char.cinematics.movies;
  self.globalMovies = Engine.DB.global.cinematics.movies;

  self.skipSeeChar = Engine.Profile.cinematics.skipSeeChar;
  self.skipSeeGlobal = Engine.Profile.cinematics.skipSeeGlobal;
  self.skipAll = Engine.Profile.cinematics.skipAll;

end

--profile change
function mod.OnProfileChanged()
  mod:LoadProfileSettings();
end

--initialize the module
function mod:OnInitialize()

  debug("cinematics module initialize");

  self:LoadProfileSettings();

end

function mod.contain(array,item)

    for key, value in pairs(array) do
        if value == item then return key end
    end
    return false

end

function mod.updateSee(array,movie)
  local see = mod.contain(array,movie);

  if not(see) then
    table.insert(array,movie);
  end

  return see;
end

function mod.PlayCinematic(movie)
  mod:message(string.format(L["CINEMATICS_PLAYING"],movie));
  return mod.originalPlayMovie(_G.MovieFrame, movie);
end

function mod.PlayMovie(_, movie)
  debug("PlayMovie: %d", movie);
  mod.lastMovie = movie;

  local seeByGlobal = mod.updateSee(mod.globalMovies,movie);
  local seeByChar = mod.updateSee(mod.charMovies,movie);

  if mod.skipAll then
      mod:message(string.format(L["CINEMATICS_SKIP"],movie, Engine.slash1, Engine.slash1, movie));
      _G.GameMovieFinished();
  else
    if mod.skipSeeGlobal and seeByGlobal then
      mod:message(string.format(L["CINEMATICS_SKIP"],movie, Engine.slash1, Engine.slash1, movie));
      _G.GameMovieFinished();
    else
      if mod.skipSeeChar and seeByChar then
        mod:message(string.format(L["CINEMATICS_SKIP"],movie, Engine.slash1, Engine.slash1, movie));
        _G.GameMovieFinished();
      else
        mod.PlayCinematic(movie);
      end
    end
  end

  return true;
end

function mod:OnEnable()

  mod.originalPlayMovie = _G["MovieFrame_PlayMovie"];
  _G["MovieFrame_PlayMovie"] = mod.PlayMovie;

  self.Version = Engine.AddOn:GetModule("version");

end

function mod:OnDisable()

  _G["MovieFrame_PlayMovie"] = self.originalPlayMovie;

end

--handle commands
function mod.handleCommand(args)

  --has this module handle the command?
  local handleIt = false;


  --if the command is 'debug'
  if string.find(args,"play") then

    local movie = tonumber(args:match("play (.*)")) or mod.lastMovie;

    if(movie) then
      mod.PlayCinematic(movie);
    end

    --this module has handle the command
    handleIt = true;

  end

  return handleIt;

end