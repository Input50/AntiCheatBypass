Players = game:GetService("Players")
local place = game.placeId

if CH then	

	local Embed = {
		['title'] = 'Beginning of Message logs in ' .. tostring(game:GetService("MarketplaceService"):GetProductInfo(place).Name) .. "(" .. place .. ")".. " at "..tostring(os.date("%m/%d/%y"))
	}

	local a = syn.request({
	   Url = wh,
	   Headers = {['Content-Type'] = 'application/json'},
	   Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {Embed}, ['content'] = ''}),
	   Method = "POST"
	})

	function logMsg(webhook, Player, Message)
	   local MessageEmbed = {
		   ['description'] = Player..": ".. Message
	   }
	   local a = syn.request({
		   Url = wh,
		   Headers = {['Content-Type'] = 'application/json'},
		   Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {MessageEmbed}, ['content'] = ''}),
		   Method = "POST"
	   })
	end

	for i,v in pairs(Players:GetPlayers()) do
		logMsg(wh, v.Name, " Is in the server")
	   v.Chatted:Connect(function(msg)
		   logMsg(wh, v.Name.."{" .. v.DisplayName .. "}", msg)
	   end)
	end

	Players.PlayerAdded:Connect(function(plar)
	   logMsg(wh, plar.Name, "Player has joined")
	end)

	Players.PlayerAdded:Connect(function(plr)
	   plr.Chatted:Connect(function(msg)
		   logMsg(wh, plr.Name, msg)
	   end)
	end)

elseif CH and wh ~= true then
	logs("false alarm")
end
