local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")

local function MakeDraggable(DragPoint,Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos = false
		AddConnection(DragPoint.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		AddConnection(DragPoint.InputChanged, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		AddConnection(UserInputService.InputChanged, function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				--TweenService:Create(Main, TweenInfo.new(0.05, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
				Main.Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
			end
		end)
	end)
end

a = true

local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local ImageButton = Instance.new("ImageButton")
local UICorner_2 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.CoreGui

ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.105158381, 0, 0.214285716, 0)
ImageLabel.Size = UDim2.new(0, 70, 0, 62)
ImageLabel.Image = "rbxassetid://104881244646977"
ImageLabel.ImageTransparency = 0.390

UICorner.CornerRadius = UDim.new(0.5, 1)
UICorner.Parent = ImageLabel

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.638974369, 0, 0.28174603, 0)
ImageButton.Size = UDim2.new(0, 99, 0, 99)
ImageButton.Image = "rbxassetid://137860230578436"
ImageButton.ImageTransparency = 0.500
ImageButton.MouseButton1Down:connect(function()
a = not a
if a then
game.CoreGui.knixhub.Main:TweenSize(UDim2.new(0, 560, 0, 319), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
knixhub.Enabled = true
uitoggled = false
else
game.CoreGui.knixhub.Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
knixhub.Enabled = false
uitoggled = true
end
end)

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = ImageButton

MakeDraggable(ImageButton,ImageButton)