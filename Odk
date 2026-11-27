
-- Swimmy Barnaby Survival Assistant
-- Simulation prototype for Roblox Studio

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "SwimmyAssistant"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(230, 180)
frame.Position = UDim2.new(0.5, -115, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25, 32, 45)
frame.Parent = gui

local function makeButton(name, text, pos)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(0.85, 0, 0, 35)
    b.Position = pos
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(45, 110, 150)
    b.Parent = frame
    return b
end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "SWIMMY SURVIVAL"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Parent = frame

local start = makeButton("Start", "START SIMULATION", UDim2.new(0.075,0,0,45))
local stop = makeButton("Stop", "STOP", UDim2.new(0.075,0,0,85))

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,0,0,35)
status.Position = UDim2.new(0,0,0,130)
status.Text = "Status: Ready"
status.TextColor3 = Color3.new(1,1,1)
status.BackgroundTransparency = 1
status.Parent = frame

local running = false
local velocity = 0
local position = 250
local gravity = 0.18
local simulatedTaps = 0

local function predict()
    local predicted = position + velocity * 8

    if predicted > 300 then
        velocity = -4.2
        simulatedTaps += 1
        return "Simulated tap recommended"
    end

    return "No tap needed"
end

start.MouseButton1Click:Connect(function()
    running = true
    status.Text = "Status: Simulating"
end)

stop.MouseButton1Click:Connect(function()
    running = false
    status.Text = "Status: Stopped"
end)

RunService.Heartbeat:Connect(function()
    if not running then return end

    velocity += gravity
    position += velocity

    status.Text = predict()
        .. "\nSimulated taps: " .. simulatedTaps

    if position < 0 or position > 500 then
        running = false
        status.Text = "Simulation ended: Collision"
    end
end)
