-- JIBONG HUB PREMIUM v1.0
-- UI untuk Roblox Studio

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local PURPLE = Color3.fromRGB(207, 51, 151)
local BACKGROUND = Color3.fromRGB(9, 9, 12)
local CARD = Color3.fromRGB(20, 19, 25)
local WHITE = Color3.fromRGB(245, 245, 250)
local MUTED = Color3.fromRGB(155, 153, 165)

local gui = Instance.new("ScreenGui")
gui.Name = "JibongHub"
gui.ResetOnSpawn = false
gui.DisplayOrder = 100
gui.Parent = playerGui

-- Floating button
local openButton = Instance.new("TextButton")
openButton.Name = "OpenJibongHub"
openButton.Size = UDim2.fromOffset(60, 60)
openButton.Position = UDim2.new(0, 18, 0.35, 0)
openButton.BackgroundColor3 = BACKGROUND
openButton.Text = "J"
openButton.TextColor3 = PURPLE
openButton.TextSize = 34
openButton.Font = Enum.Font.GothamBold
openButton.Parent = gui

Instance.new("UICorner", openButton).CornerRadius =
    UDim.new(0, 16)

local openStroke = Instance.new("UIStroke")
openStroke.Color = PURPLE
openStroke.Thickness = 2
openStroke.Parent = openButton

-- Main panel
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.88, 0, 0.78, 0)
main.Position = UDim2.new(0.06, 0, 0.11, 0)
main.BackgroundColor3 = BACKGROUND
main.BorderSizePixel = 0
main.Visible = false
main.ClipsDescendants = true
main.Parent = gui

local sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.MinSize = Vector2.new(300, 300)
sizeConstraint.MaxSize = Vector2.new(900, 650)
sizeConstraint.Parent = main

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 15)

local outline = Instance.new("UIStroke")
outline.Color = Color3.fromRGB(65, 44, 67)
outline.Thickness = 1.2
outline.Parent = main

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 58)
header.BackgroundColor3 = BACKGROUND
header.BorderSizePixel = 0
header.Parent = main

local logo = Instance.new("TextLabel")
logo.Size = UDim2.fromOffset(45, 50)
logo.Position = UDim2.fromOffset(12, 3)
logo.BackgroundTransparency = 1
logo.Text = "J"
logo.TextColor3 = PURPLE
logo.TextSize = 35
logo.Font = Enum.Font.GothamBold
logo.Parent = header

local title = Instance.new("TextLabel")
title.Position = UDim2.fromOffset(60, 0)
title.Size = UDim2.new(1, -150, 1, 0)
title.BackgroundTransparency = 1
title.Text = "JIBONG HUB"
title.TextColor3 = WHITE
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(40, 40)
minimize.Position = UDim2.new(1, -48, 0, 9)
minimize.BackgroundTransparency = 1
minimize.Text = "—"
minimize.TextColor3 = WHITE
minimize.TextSize = 25
minimize.Parent = header

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -20, 0, 1)
divider.Position = UDim2.new(0, 10, 0, 57)
divider.BackgroundColor3 = PURPLE
divider.BorderSizePixel = 0
divider.Parent = main

-- Sidebar
local sidebar = Instance.new("ScrollingFrame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 142, 1, -70)
sidebar.Position = UDim2.fromOffset(8, 65)
sidebar.BackgroundTransparency = 1
sidebar.BorderSizePixel = 0
sidebar.ScrollBarThickness = 2
sidebar.CanvasSize = UDim2.new(0, 0, 0, 370)
sidebar.Parent = main

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.Padding = UDim.new(0, 7)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Parent = sidebar

local sidePadding = Instance.new("UIPadding")
sidePadding.PaddingTop = UDim.new(0, 5)
sidePadding.PaddingBottom = UDim.new(0, 8)
sidePadding.Parent = sidebar

-- Main content
local content = Instance.new("ScrollingFrame")
content.Name = "Content"
content.Position = UDim2.new(0, 158, 0, 66)
content.Size = UDim2.new(1, -168, 1, -76)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ScrollBarThickness = 3
content.CanvasSize = UDim2.new(0, 0, 0, 600)
content.Parent = main

local currentPage

local function makeLabel(parent, text, position, size, textSize)
    local label = Instance.new("TextLabel")
    label.Position = position
    label.Size = size
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = WHITE
    label.TextSize = textSize or 14
    label.Font = Enum.Font.Gotham
    label.TextWrapped = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    return label
end

local function makeCard(parent, position, size)
    local card = Instance.new("Frame")
    card.Position = position
    card.Size = size
    card.BackgroundColor3 = CARD
    card.BorderSizePixel = 0
    card.Parent = parent

    Instance.new("UICorner", card).CornerRadius =
        UDim.new(0, 12)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(48, 45, 54)
    stroke.Thickness = 1
    stroke.Parent = card

    return card
end

local function clearContent()
    for _, item in ipairs(content:GetChildren()) do
        if not item:IsA("UIListLayout") then
            item:Destroy()
        end
    end
end

local function showPage(page)
    currentPage = page
    clearContent()

    makeLabel(
        content, page,
        UDim2.fromOffset(8, 3),
        UDim2.new(1, -16, 0, 38), 21
    ).Font = Enum.Font.GothamBold

    if page == "About" then
        local profile = makeCard(
            content,
            UDim2.fromOffset(5, 48),
            UDim2.new(1, -15, 0, 112)
        )

        local avatar = Instance.new("ImageLabel")
        avatar.Position = UDim2.fromOffset(14, 22)
        avatar.Size = UDim2.fromOffset(60, 60)
        avatar.BackgroundColor3 = CARD
        avatar.Parent = profile

        Instance.new("UICorner", avatar).CornerRadius =
            UDim.new(1, 0)

        task.spawn(function()
            local ok, image = pcall(function()
                return Players:GetUserThumbnailAsync(
                    player.UserId,
                    Enum.ThumbnailType.HeadShot,
                    Enum.ThumbnailSize.Size100x100
                )
            end)

            if ok and avatar.Parent then
                avatar.Image = image
            end
        end)

        makeLabel(
            profile, player.DisplayName,
            UDim2.fromOffset(88, 24),
            UDim2.new(1, -95, 0, 25), 16
        ).Font = Enum.Font.GothamBold

        makeLabel(
            profile, "@" .. player.Name,
            UDim2.fromOffset(88, 50),
            UDim2.new(1, -95, 0, 22), 12
        ).TextColor3 = MUTED

        makeLabel(
            profile, "Jibong HUB Premium UI",
            UDim2.fromOffset(88, 73),
            UDim2.new(1, -95, 0, 20), 11
        ).TextColor3 = MUTED

        local status = makeCard(
            content,
            UDim2.fromOffset(5, 172),
            UDim2.new(1, -15, 0, 72)
        )

        makeLabel(
            status, "●  STATUS",
            UDim2.fromOffset(14, 10),
            UDim2.new(1, -28, 0, 22), 14
        ).TextColor3 = Color3.fromRGB(255, 175, 90)

        makeLabel(
            status, "Jibong HUB is running",
            UDim2.fromOffset(14, 36),
            UDim2.new(1, -28, 0, 22), 12
        ).TextColor3 = MUTED

        local news = makeCard(
            content,
            UDim2.fromOffset(5, 258),
            UDim2.new(1, -15, 0, 65)
        )

        makeLabel(
            news, "What's new",
            UDim2.fromOffset(14, 8),
            UDim2.new(1, -28, 0, 23), 14
        ).Font = Enum.Font.GothamBold

        makeLabel(
            news, "Welcome to Jibong HUB v1.0",
            UDim2.fromOffset(14, 32),
            UDim2.new(1, -28, 0, 22), 11
        ).TextColor3 = MUTED

    elseif page == "Dashboard" then
        local card = makeCard(
            content,
            UDim2.fromOffset(5, 48),
            UDim2.new(1, -15, 0, 100)
        )

        makeLabel(
            card, "PLAYER INFORMATION",
            UDim2.fromOffset(14, 12),
            UDim2.new(1, -28, 0, 25), 14
        ).Font = Enum.Font.GothamBold

        makeLabel(
            card, "Username: " .. player.Name ..
                "\nUser ID: " .. player.UserId,
            UDim2.fromOffset(14, 43),
            UDim2.new(1, -28, 0, 48), 12
        ).TextColor3 = MUTED

    elseif page == "Automation" then
        local card = makeCard(
            content,
            UDim2.fromOffset(5, 48),
            UDim2.new(1, -15, 0, 95)
        )

        makeLabel(
            card, "Automation Settings",
            UDim2.fromOffset(14, 8),
            UDim2.new(1, -28, 0, 25), 14
        ).Font = Enum.Font.GothamBold

        makeLabel(
            card, "No game automation is connected.",
            UDim2.fromOffset(14, 38),
            UDim2.new(1, -28, 0, 40), 12
        ).TextColor3 = MUTED

    elseif page == "Inventory" then
        makeLabel(
            content, "Inventory display is not connected to game data.",
            UDim2.fromOffset(8, 55),
            UDim2.new(1, -16, 0, 70), 13
        ).TextColor3 = MUTED

    elseif page == "Character" then
        local humanoid = player.Character
            and player.Character:FindFirstChildOfClass("Humanoid")

        local health = humanoid and
            math.floor(humanoid.Health) or 0

        makeLabel(
            content, "Player: " .. player.DisplayName ..
                "\nHealth: " .. health,
            UDim2.fromOffset(8, 55),
            UDim2.new(1, -16, 0, 70), 13
        )

    elseif page == "ESP" then
        makeLabel(
            content,
            "ESP preview is disabled. This page can be used for authorized debugging tools.",
            UDim2.fromOffset(8, 55),
            UDim2.new(1, -16, 0, 90), 13
        ).TextColor3 = MUTED

    elseif page == "Settings" then
        local button = Instance.new("TextButton")
        button.Position = UDim2.fromOffset(5, 48)
        button.Size = UDim2.new(1, -15, 0, 45)
        button.BackgroundColor3 = CARD
        button.TextColor3 = WHITE
        button.TextSize = 13
        button.Font = Enum.Font.GothamSemibold
        button.Text = "Accent: Pink"
        button.Parent = content

        Instance.new("UICorner", button).CornerRadius =
            UDim.new(0, 9)

        local pink = true

        button.Activated:Connect(function()
            pink = not pink
            PURPLE = pink
                and Color3.fromRGB(207, 51, 151)
                or Color3.fromRGB(125, 85, 255)

            button.Text = pink and "Accent: Pink" or "Accent: Purple"
            outline.Color = PURPLE
            openStroke.Color = PURPLE
            divider.BackgroundColor3 = PURPLE
            logo.TextColor3 = PURPLE

            TweenService:Create(
                button,
                TweenInfo.new(0.15),
                {BackgroundColor3 = CARD}
            ):Play()
        end)
    end

    content.CanvasPosition = Vector2.zero
end

local pages = {
    {"About", "ⓘ"},
    {"Dashboard", "☰"},
    {"Automation", "▣"},
    {"Inventory", "◇"},
    {"Character", "♙"},
    {"ESP", "◎"},
    {"Settings", "⚙"}
}

local pageButtons = {}

for index, data in ipairs(pages) do
    local page, icon = data[1], data[2]

    local button = Instance.new("TextButton")
    button.Name = page .. "Button"
    button.Size = UDim2.new(1, -5, 0, 43)
    button.BackgroundColor3 = CARD
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Text = "  " .. icon .. "    " .. page
    button.TextColor3 = MUTED
    button.TextSize = 12
    button.Font = Enum.Font.GothamSemibold
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.LayoutOrder = index
    button.Parent = sidebar

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 9)

    pageButtons[page] = button

    button.Activated:Connect(function()
        for _, other in pairs(pageButtons) do
            other.BackgroundTransparency = 1
            other.TextColor3 = MUTED
        end

        button.BackgroundTransparency = 0
        button.BackgroundColor3 = PURPLE
        button.TextColor3 = WHITE

        showPage(page)
    end)
end

-- Search field
local search = Instance.new("TextBox")
search.Name = "Search"
search.Size = UDim2.fromOffset(115, 30)
search.Position = UDim2.new(1, -175, 0, 14)
search.BackgroundColor3 = CARD
search
