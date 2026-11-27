-- SWIMMY BARNABY ASSISTANT
-- Roblox Studio LocalScript
-- Fixed menu with tap controls and adjustable timing.
-- Does not bypass anti-cheat or automate Dandy's World.

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "SwimmyAssistant"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(230, 245)
main.Position = UDim2.new(0.5, -115, 0.35, 0)
main.BackgroundColor3 = Color3.fromRGB(22, 32, 48)
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local function makeButton(text, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.86, 0, 0, 34)
    b.Position = UDim2.new(0.07, 0, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(43, 105, 145)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Text = text
    b.TextSize = 14
    b.Parent = main
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 7)
    return b
end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 38)
title.BackgroundColor3 = Color3.fromRGB(38, 75, 110)
title.Text = "SWIMMY ASSISTANT"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 15
title.Parent = main

local start = makeButton("START", 48)
local stop = makeButton("STOP", 88)
local tap = makeButton("MANUAL TAP", 128)
local minus = makeButton("TIMING -", 168)
local plus = makeButton("TIMING +", 207)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, 0)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.new(1, 1, 1)
status.Text = "READY"
status.Parent = main

local running = false
local interval = 0.5

local function update()
    status.Text = "Timing: " .. interval .. "s"
end

start.MouseButton1Click:Connect(function()
    running = true
    status.Text = "READY - MANUAL CONTROL"
end)

stop.MouseButton1Click:Connect(function()
    running = false
    status.Text = "STOPPED"
end)

tap.MouseButton1Click:Connect(function()
    if not running then return end

    -- Manual tap control only.
    -- No external game input is generated.
    status.Text = "TAP REQUESTED"
end)

minus.MouseButton1Click:Connect(function()
    interval = math.max(0.1, interval - 0.1)
    update()
end)

plus.MouseButton1Click:Connect(function()
    interval = math.min(2, interval + 0.1)
    update()
end)

update()
