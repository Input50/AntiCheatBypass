--[[ decided to published this here cause why not.
This is a collection of scripts i formulated to execute as essentials pack in autoexec.
Nearly none of scripts are originally made by me
but i modified them over time, as i continued to learn lua.
This is meant to be used in autoexec
It lists of basic shit to just enchance or modified the roblox experience. Nothing here is to be hvh or hacking others other than the scripts in Games
Shit like Anti-Stream-Sniping, anti-report, AC bypasses I collected, Remove your nametags, basic noclip tool, multitool chatlogger, and more.
This thing is fully customizable and feel free to take anything.
Supports SW and Synapse and maybe some others I haven't fully tested.
Made by you, elsewhere

Note: I will leave comments to explain what each somewhat important stuff does
]]--

-- [[ Variables ]] --
_G.Logs = false -- enable logs for debugging
_G.Name = "" -- Obscure Name
Debug = false -- Run debugs for some scripts | prints and different function execution

function logs(str, debu) -- Debug print only functionality
	if _G.Logs == true then
		if debu == nil or debu ~= true then
			print(tostring(str))
		elseif debu == true then
			if Debug == true then
				print("DEBUG: " .. tostring(str))
			end
		end
	end
end

if not game:IsLoaded() then game.Loaded:Wait() end
place = game.placeId

-- ver - 2.0 | Re structuring of script order to run smoother and securely and also remove unneeded stuff
-- Order: Security, Settings, Loggers, Tools, Customs

loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Misc/FFlag.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Utilites/Settings.lua"),true))()

Settings = {
    -- Chat Logger
    CH = {
	    on = false, -- on/off
		wh = '' -- web url
	},
    ADN = { -- Anti-Display Names
		on = true,
		loaded = false,
	},
    ON = true, -- Obscure Names
    ASS = false, -- Anti-stream Snipe | Will not load if ADN loaded first
    NC = false, -- Noclip tool
    dmnX = {
		on = true,
		prem = true, -- DomainX
	},
	ER = { -- Error Reporter
		on = false,
		wh = '', -- webhook url
		mode = 'cli', -- wh or cli | console or webhook | console only works with krnl or syn | webhook aswell with syn and SW
		types = { -- enables the logging of each category
			prints = false,
			errors = true,
			warns  = true,
		}
	},
	CGames = {
		[6536671967] = 'https://raw.githubusercontent.com/Input50/Something/master/Games/SlayersUnleased.lua',
		[4282985734] = 'https://raw.githubusercontent.com/Input50/Something/master/Games/CombatWarriors.lua'
	 -- [gameID]     = '<link>',
	},
	Customs = true, -- load custom scripts
}

config = Settings

loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Main/Bypass.lua"),true))()
logs('(1/2) Security/Settigns Loaded', true)
-----------------------------------------------------------------------------------------------------------------------	
--- Anti-Display-Names
if config.ADN.on == true then
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Main/Anti-DisplayName.lua"),true))()
	config.ADN.loaded = true
	logs("(3a) Anti-DisplayName Deployed", true)
end
-----------------------------------------------------------------------------------------------------------------------	
--- Anti-Streamsnipe
if config.ASS == true and config.ADN.loaded ~= true then
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Main/AntiStreamSnipe.lua"),true))()
	logs("(3b) Anti-Streamsnipe protection", true)
end
-----------------------------------------------------------------------------------------------------------------------	
--- Obscure Names
if config.ON == true then
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Main/Renamer.lua"),true))()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Main/NameTag.lua"),true))()
	logs("(3c) NameGuard Deployed", true)
end
-----------------------------------------------------------------------------------------------------------------------

---	Loggers 
-- Errors
if config.ER.on == true then
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Main/Error%20Reporter.lua"),true))()
	logs('(3d) Error Reporter loaded', true)
end

-- Chat
if config.CH.on == true then
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/Something/master/Main/ChatLogger.lua"),true))()
	logs('(4a) Chat Logger Enabled', true)
end
-----------------------------------------------------------------------------------------------------------------------

---	Tools
-- Noclip
if config.NC == true then
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Input50/Something/master/Main/Noclip.lua'),true))()
	logs('(4b) Noclip Loaded', true)
end

-- domainX
if config.dmnX.on == true then

	-- [[ DomainX Theme ]] --
	if config.dmnX.prem == true then
		ThemeEnabled = true
		Theme = {
		  Name = "",
		  PrimaryColor = Color3.fromRGB(0, 0, 0),
		  SecondaryColor = Color3.fromRGB(0, 0, 0),
		  Font = "",
		}
	end
	loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexsoftworks/DomainX/main/source',true))()
	logs('(4c) DomainX Loaded', true)
end

--- Custom | Possible more addons soons
-- Custom Scripts

if config.Customs == true then
	local link = config.games[place]
	loadstring(game:HttpGet((link),true))()
	logs(place .. link, true)
end

logs('Loaded', false)