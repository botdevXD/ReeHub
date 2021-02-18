local CheckSupportOBV = (coco and "Coco") or (COCO_LOADED and "Coco") or (syn and "SynapseX") or (is_sirhurt_closure and "Sirhurt") or (issentinelclosure and "Sentinel") or (KRNL_LOADED and "Krnl")

if CheckSupportOBV then
	getgenv().REEHUB_ISREADY_TO_LOAD = false
else
	_G.REEHUB_ISREADY_TO_LOAD = false
end

local ReeHub_GameDetect = {}

local SupportedGames = {
	["292439477"] = "Phantom Forces",
	["4872321990"] = "Islands",
	["5899156129"] = "Islands",
	["4779613061"] = "South London 2",
	["6094061470"] = "Arcade Empire"
}
function GetSupportedGames(PlaceID)
	if SupportedGames[tostring(PlaceID)] then
		return SupportedGames[tostring(PlaceID)]
	else
		return "Game not supported!"
	end
end

function RainBow(X)
	return math.acos(math.cos(X * math.pi)) / math.pi 
end

function ReeHub_GameDetect:SetUpGameDetect()
	local ReeHubGameDetect = Instance.new("ScreenGui")
	local Container = Instance.new("ImageLabel")
	local Effect = Instance.new("ImageLabel")
	local TextButton = Instance.new("TextButton")
	local TextButton_Roundify_4px = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local Shadow = Instance.new("ImageLabel")
	local UIListLayout = Instance.new("UIListLayout")

	ReeHubGameDetect.Name = "ReeHub Game Detect"
	ReeHubGameDetect.Parent = game:GetService("CoreGui")

	Container.Name = "Container"
	Container.Parent = ReeHubGameDetect
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.BorderSizePixel = 0
	Container.ClipsDescendants = true
	Container.Position = UDim2.new(0.357865691, 0, 0.301587313, 0)
	Container.Image = "rbxassetid://5554237731"
	Container.ImageColor3 = Color3.fromRGB(30, 30, 30)

	Effect.Name = "Effect"
	Effect.Parent = Container
	Effect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Effect.BackgroundTransparency = 1.000
	Effect.BorderSizePixel = 0
	Effect.Position = UDim2.new(-0.00135754352, 0, -0.00178351055, 0)
	Effect.Size = UDim2.new(0, 281, 0, 121)
	Effect.Image = "http://www.roblox.com/asset/?id=5876199170"

	TextButton.Parent = Container
	TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.BackgroundTransparency = 1.000
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.114, 0, 0.63499999, 0)
	TextButton.Size = UDim2.new(0, 216, 0, 50)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000
	TextButton.MouseButton1Click:Connect(function()
		if CheckSupportOBV then
			REEHUB_ISREADY_TO_LOAD = true
		else
			_G.REEHUB_ISREADY_TO_LOAD = true
		end
		ReeHubGameDetect:Destroy()
	end)

	TextButton_Roundify_4px.Name = "TextButton_Roundify_4px"
	TextButton_Roundify_4px.Parent = TextButton
	TextButton_Roundify_4px.Active = true
	TextButton_Roundify_4px.AnchorPoint = Vector2.new(0.5, 0.5)
	TextButton_Roundify_4px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_Roundify_4px.BackgroundTransparency = 1.000
	TextButton_Roundify_4px.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextButton_Roundify_4px.Selectable = true
	TextButton_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
	TextButton_Roundify_4px.Image = "rbxassetid://3570695787"
	TextButton_Roundify_4px.ImageColor3 = Color3.fromRGB(50, 50, 50)
	TextButton_Roundify_4px.ScaleType = Enum.ScaleType.Slice
	TextButton_Roundify_4px.SliceCenter = Rect.new(100, 100, 100, 100)
	TextButton_Roundify_4px.SliceScale = 0.040

	TextLabel.Parent = TextButton_Roundify_4px
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.0398048125, 0, -0.00507934578, 0)
	TextLabel.Size = UDim2.new(0, 198, 0, 50)
	TextLabel.Font = Enum.Font.SourceSansLight
	TextLabel.Text = GetSupportedGames(game.PlaceId)
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 40.000
	TextLabel.TextWrapped = true

	Shadow.Name = "Shadow"
	Shadow.Parent = Container
	Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Shadow.BackgroundTransparency = 1.000
	Shadow.BorderSizePixel = 0
	Shadow.ClipsDescendants = true
	Shadow.Position = UDim2.new(-0.0576426014, 0, -0.065255627, 0)
	Shadow.Size = UDim2.new(0, 313, 0, 211)
	Shadow.Image = "rbxassetid://5554236805"
	Shadow.ImageColor3 = Color3.fromRGB(170, 0, 0)

	UIListLayout.Parent = ReeHubGameDetect
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

	local Tween = game:GetService("TweenService")
	local FirstTween = Tween:Create(Container, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
		Size = UDim2.new(0, 281,0, 189)
	})
	FirstTween:Play()
	FirstTween.Completed:Wait()
	Container.ClipsDescendants = false
	
	local count = 0
	game:GetService("RunService").RenderStepped:Connect(function()
		TextLabel.TextColor3 = Color3.fromHSV(RainBow(count), 1, 1)
		count = count + 0.001
	end)
	
end

return ReeHub_GameDetect
