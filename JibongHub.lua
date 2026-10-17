-- JIBONG HUB PREMIUM
-- Mobile UI Prototype
-- Untuk Roblox Studio

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local PURPLE = Color3.fromRGB(145, 75, 255)
local DARK = Color3.fromRGB(18, 18, 27)
local PANEL = Color3.fromRGB(29, 29, 43)
local WHITE = Color3.fromRGB(245, 245, 255)

local gui = Instance.new("ScreenGui")
gui.Name = "JibongHub"
gui.ResetOnSpawn = false
gui.DisplayOrder = 100
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(330, 360)
main.Position = UDim2.new(0.5, -165, 0.5, -180)
main.BackgroundColor3 = DARK
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = PURPLE
stroke.Thickness = 1.5
stroke.Parent = main

local function createButton(parent, text, size, position)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = PANEL
    button.TextColor3 = WHITE
    button.Text = text
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = true
    button.BorderSizePixel = 0
    button.Parent = parent

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 8)

    return button
end

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 48)
header.BackgroundColor3 = PURPLE
header.BorderSizePixel = 0
header.Parent = main

Instance.new("UICorner", header).CornerRadius =
    UDim.new(0, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -55, 1, 0)
title.Position = UDim2.fromOffset(14, 0)
title.BackgroundTransparency = 1
title.Text = "JIBONG HUB"
title.TextColor3 = WHITE
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local minimize = createButton(
    header, "—",
    UDim2.fromOffset(34, 30),
    UDim2.new(1, -42, 0, 9)
)
minimize.BackgroundColor3 = DARK

-- Tabs
local tabNames = {
    "Home", "Egg Tracker", "Player", "Settings"
}

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -20, 0, 38)
tabBar.Position = UDim2.fromOffset(10, 58)
tabBar.BackgroundTransparency = 1
tabBar.Parent = main

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 4)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = tabBar

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -110)
content.Position = UDim2.fromOffset(10, 102)
content.BackgroundTransparency = 1
content.Parent = main

local currentTab = nil

local function clearContent()
    for _, child in ipairs(content:GetChildren()) do
        child:Destroy()
    end
end

local function showTab(tabName)
    currentTab = tabName
    clearContent()

    local heading = Instance.new("TextLabel")
    heading.Size = UDim2.new(1, 0, 0, 35)
    heading.BackgroundTransparency = 1
    heading.Text = tabName
    heading.TextColor3 = PURPLE
    heading.TextSize = 18
    heading.Font = Enum.Font.GothamBold
    heading.TextXAlignment = Enum.TextXAlignment.Left
    heading.Parent = content

    if tabName == "Home" then
        local welcome = Instance.new("TextLabel")
        welcome.Size = UDim2.new(1, 0, 0, 55)
        welcome.Position = UDim2.fromOffset(0, 40)
        welcome.BackgroundTransparency = 1
        welcome.Text = "Welcome to Jibong HUB!"
        welcome.TextColor3 = WHITE
        welcome.TextSize = 15
        welcome.Font = Enum.Font.Gotham
        welcome.Parent = content

        local info = Instance.new("TextLabel")
        info.Size = UDim2.new(1, 0, 0, 45)
        info.Position = UDim2.fromOffset(0, 85)
        info.BackgroundTransparency = 1
        info.Text = "Premium Mobile UI Prototype"
        info.TextColor3 = Color3.fromRGB(170, 170, 190)
        info.TextSize = 12
        info.Font = Enum.Font.Gotham
        info.Parent = content

    elseif tabName == "Egg Tracker" then
        local info = Instance.new("TextLabel")
        info.Size = UDim2.new(1, 0, 0, 75)
        info.Position = UDim2.fromOffset(0, 40)
        info.BackgroundTransparency = 1
        info.TextWrapped = true
        info.Text = "Egg Tracker belum terhubung ke data game."
        info.TextColor3 = WHITE
        info.TextSize = 13
        info.Font = Enum.Font.Gotham
        info.Parent = content

    elseif tabName == "Player" then
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 0, 35)
        nameLabel.Position = UDim2.fromOffset(0, 40)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = "Username: " .. player.Name
        nameLabel.TextColor3 = WHITE
        nameLabel.TextSize = 13
        nameLabel.Font = Enum.Font.Gotham
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Parent = content

        local idLabel = Instance.new("TextLabel")
        idLabel.Size = UDim2.new(1, 0, 0, 35)
        idLabel.Position = UDim2.fromOffset(0, 75)
        idLabel.BackgroundTransparency = 1
        idLabel.Text = "User ID: " .. player.UserId
        idLabel.TextColor3 = WHITE
        idLabel.TextSize = 13
        idLabel.Font = Enum.Font.Gotham
        idLabel.TextXAlignment = Enum.TextXAlignment.Left
        idLabel.Parent = content

    elseif tabName == "Settings" then
        local toggle = createButton(
            content, "UI Animation: ON",
            UDim2.new(1, 0, 0, 40),
            UDim2.fromOffset(0, 45)
        )

        local animationEnabled = true

        toggle.Activated:Connect(function()
            animationEnabled = not animationEnabled
            toggle.Text = animationEnabled
                and "UI Animation: ON"
                or "UI Animation: OFF"
        end)
    end
end

for index, tabName in ipairs(tabNames) do
    local tab = createButton(
        tabBar,
        tabName,
        UDim2.new(0, 0, 1, 0),
        UDim2.new()
    )

    tab.AutomaticSize = Enum.AutomaticSize.X
    tab.Size = UDim2.new(0, 75, 1, 0)
    tab.LayoutOrder = index

    tab.Activated:Connect(function()
        showTab(tabName)
    end)
end

-- Minimize / restore
local minimized = false

minimize.Activated:Connect(function()
    minimized = not minimized

    if minimized then
        content.Visible = false
        tabBar.Visible = false
        main.Size = UDim2.fromOffset(330, 48)
        minimize.Text = "+"
    else
        main.Size = UDim2.fromOffset(330, 360)
        tabBar.Visible = true
        content.Visible = true
        minimize.Text = "—"
    end
end)

-- Drag with mouse or touch
local dragging = false
local dragStart
local startPosition

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end)

header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

showTab("Home")

print("Jibong HUB loaded successfully!")
