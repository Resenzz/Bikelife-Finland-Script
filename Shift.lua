local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local g = Instance.new("ScreenGui")
g.Name = "ShiftUI"
g.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
g.ResetOnSpawn = false

local gear = 0
local minimized = false

local function update(lbl)
	if gear == 0 then
		lbl.Text = "N"
	else
		lbl.Text = tostring(gear)
	end
end

local function shift(key, dir, lbl)
	VIM:SendKeyEvent(true, key, false, game)
	task.wait()
	VIM:SendKeyEvent(false, key, false, game)

	gear += dir
	if gear < 0 then gear = 0 end
	if gear > 6 then gear = 6 end

	update(lbl)
end


local main = Instance.new("Frame", g)
main.Size = UDim2.new(0,160,0,200)
main.Position = UDim2.new(1,-180,1,-220)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)


local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,30)
top.BackgroundColor3 = Color3.fromRGB(20,20,20)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,-60,1,0)
title.Position = UDim2.new(0,5,0,0)
title.BackgroundTransparency = 1
title.Text = "RSZ | Shift"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.Gotham
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left


local minBtn = Instance.new("TextButton", top)
minBtn.Size = UDim2.new(0,25,0,20)
minBtn.Position = UDim2.new(1,-55,0.5,-10)
minBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
minBtn.Text = "-"
minBtn.TextColor3 = Color3.new(1,1,1)


local closeBtn = Instance.new("TextButton", top)
closeBtn.Size = UDim2.new(0,25,0,20)
closeBtn.Position = UDim2.new(1,-28,0.5,-10)
closeBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)


local dragging = false
local dragStart, startPos

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)


local content = Instance.new("Frame", main)
content.Size = UDim2.new(1,0,1,-30)
content.Position = UDim2.new(0,0,0,30)
content.BackgroundTransparency = 1


local gearLabel = Instance.new("TextLabel", content)
gearLabel.Size = UDim2.new(1,0,0,50)
gearLabel.BackgroundTransparency = 1
gearLabel.TextColor3 = Color3.new(1,1,1)
gearLabel.Font = Enum.Font.GothamBold
gearLabel.TextScaled = true
gearLabel.Text = "N"


local up = Instance.new("TextButton", content)
up.Size = UDim2.new(1,-10,0,50)
up.Position = UDim2.new(0,5,0,55)
up.BackgroundColor3 = Color3.fromRGB(50,50,50)
up.Text = "▲"
up.TextScaled = true
up.TextColor3 = Color3.new(1,1,1)


local down = Instance.new("TextButton", content)
down.Size = UDim2.new(1,-10,0,50)
down.Position = UDim2.new(0,5,0,110)
down.BackgroundColor3 = Color3.fromRGB(50,50,50)
down.Text = "▼"
down.TextScaled = true
down.TextColor3 = Color3.new(1,1,1)


up.MouseButton1Click:Connect(function()
	shift(Enum.KeyCode.E, 1, gearLabel)
end)

down.MouseButton1Click:Connect(function()
	shift(Enum.KeyCode.Q, -1, gearLabel)
end)


minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized

	if minimized then
		TweenService:Create(main, TweenInfo.new(0.25), {Size = UDim2.new(0,160,0,30)}):Play()
		content.Visible = false
	else
		TweenService:Create(main, TweenInfo.new(0.25), {Size = UDim2.new(0,160,0,200)}):Play()
		content.Visible = true
	end
end)


closeBtn.MouseButton1Click:Connect(function()
	g:Destroy()
end)
