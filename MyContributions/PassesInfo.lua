local Market = game:GetService("MarketplaceService")

local module = {
	["InfDNA"] = {
		Image = "rbxassetid://" .. Market:GetProductInfo(8835896, Enum.InfoType.GamePass).IconImageAssetId,
		Text = "Infinite DNA",
		Price = 2500,
		Id = 8835896,
		Order = 1,
	},
	
	["2xStrength"] = {
		Image = "rbxassetid://" .. Market:GetProductInfo(8835949, Enum.InfoType.GamePass).IconImageAssetId,
		Text = "2x Strength",
		Price = 150,
		Id = 8835949,
		Order = 1,
	},
	
	["2xGold"] = {
		Image = "rbxassetid://" .. Market:GetProductInfo(8835996, Enum.InfoType.GamePass).IconImageAssetId,
		Text = "2x Gold",
		Price = 170,
		Id = 8835996,
		Order = 1,
	},
	
	["2xSpeed"] = {
		Image = "rbxassetid://" .. Market:GetProductInfo(8836084, Enum.InfoType.GamePass).IconImageAssetId,
		Text = "2x Speed",
		Price = 299,
		Id = 8836084,
		Order = 1,
	},
	
	["VIP"] = {
		Image = "rbxassetid://" .. Market:GetProductInfo(8836050, Enum.InfoType.GamePass).IconImageAssetId,
		Text = "VIP",
		Price = 599,
		Id = 8836050,
		Order = 1,
	},
}

return module
