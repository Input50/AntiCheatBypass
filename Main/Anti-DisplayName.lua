-- [==[ Created by mothra#1337 ]==]
-- (Anti-Displayname v6)
local AntiDisplayName = loadstring(game:HttpGet('https://pastebin.com/raw/hCMXnKWa'))(function()
    getgenv().Preferences = {}
end)

Preferences = {
    RetroNaming = false,
    ShowOriginalName = true,
    ApplyToLeaderboard = false,
    IdentifyFriends = {Toggle = true, Identifier = '[Friend]'},
    IdentifyBlocked = {Toggle = true, Identifier = '[Blocked]'},
    IdentifyPremium = {Toggle = true, Identifier = '[Premium]'},
    IdentifyDeveloper = {Toggle = true, Identifier = '[Game Dev]'},
    SpoofLocalPlayer = {Toggle = false, UseRandomName = false, NewName = 'Random Name Lol'},
    Orientation = 'Horizontal'
}
