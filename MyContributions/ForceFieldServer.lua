local Sequence = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(9, 137, 207)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0, 255, 255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(9, 137, 207))})
local Center = (script.Parent:FindFirstChild("Torso") or script.Parent:FindFirstChild("UpperTorso"))

function PointInSequence(sequence,a)
	local KeyPoints = sequence.Keypoints
	
	local ReturnedColor = KeyPoints[1].Value	
	
	for k,v in pairs(KeyPoints) do
		if v.Time > a then
			local Difference = v.Time - KeyPoints[k-1].Time
			local Sepparation = v.Time - a
			local Proportion = Sepparation/Difference
			
			return KeyPoints[k-1].Value:Lerp(v.Value,Proportion)
		end
	end
end

--..In case someone didn't even read that last line in the header...
if not script.Parent:FindFirstChildOfClass("Humanoid") then
	--This script only runs when in its character
	local GoalParent = game:GetService("StarterPlayer"):FindFirstChildOfClass("StarterCharacterScripts")
	if not GoalParent then
	elseif GoalParent and not GoalParent:FindFirstChild(script.Name) then
		script.Parent = GoalParent
	end
end

local Shields = {}

function CreateShields(ForceField)	
	local shield = Instance.new("Part")
	shield.Name = "Shield"
	shield.Massless = true
	shield.formFactor = "Custom"
	shield.Material = "ForceField"
	shield.Size = Vector3.new(0,0,0)
	shield.Color = Color3.fromRGB(9, 137, 207)
	shield.Transparency = -2
	shield.TopSurface = 0
	shield.BottomSurface = 0
	shield.CanCollide = false
	local Mesh = Instance.new("SpecialMesh",shield)
	Mesh.Scale = (Vector3.new(1.5,1.5,1.5) * (Center.Size.magnitude*1.5)) * 30
	Mesh.MeshType = "Sphere"
	local Weld = Instance.new("Weld",shield)
	Weld.Part0 = shield
	Weld.Part1 = Center
	local light = Instance.new("PointLight",shield)
	light.Name = "ForceFieldLight"
	light.Brightness = 2
	light.Color = Color3.fromRGB(9, 137, 207)
	light.Range = 10
	light.Enabled = true
	shield.Parent = ForceField
	table.insert(Shields, shield)
end

function CycleShields()
	local Val = 0
	while true do
		Val = Val+1
		local NoShields = true
		for Index, Shield in ipairs(Shields) do
			if Shield:IsDescendantOf(script.Parent) then
				Shield.Color = PointInSequence(Sequence,tick()%1)
                if Val >= 2 then
                    Val = 0
		            local P = game.Players:GetPlayers()
		            for i = 1, #P do
                        game.ReplicatedStorage:WaitForChild("SafeZone"):WaitForChild("RemoteEvent"):FireClient(P[i], Shield.Position)
		            end
                end
				NoShields = false
			else
				table.remove(Shields, Index)
			end
		end
		
		if NoShields then
			break
		end
		
		game:GetService("RunService").Stepped:Wait()
	end
end

function OnChildAdded(Child)
	if Child:IsA("ForceField") then
		Child.Visible = false
		CreateShields(Child)
		CycleShields()
	end
end

local FF = script.Parent:FindFirstChildOfClass("ForceField")
if FF then
	FF.Visible = false
	CreateShields(FF)
	CycleShields()
end

script.Parent.ChildAdded:Connect(OnChildAdded)