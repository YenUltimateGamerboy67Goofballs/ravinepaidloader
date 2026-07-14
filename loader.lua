-- Ravine Scripts - PAID Loader
local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "ravinepaid"
Junkie.identifier = "1064771"
Junkie.provider = "ravinepaid"

local result = (function()
    getgenv().UI_CLOSED = false
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    local Colors = {
        background    = Color3.fromRGB(10, 10, 12),
        surface       = Color3.fromRGB(18, 14, 14),
        surfaceLight  = Color3.fromRGB(28, 20, 20),
        primary       = Color3.fromRGB(192, 0, 14),
        success       = Color3.fromRGB(47, 183, 117),
        error         = Color3.fromRGB(248, 81, 73),
        textPrimary   = Color3.fromRGB(230, 220, 220),
        textSecondary = Color3.fromRGB(160, 130, 130),
        textMuted     = Color3.fromRGB(110, 90, 90),
        border        = Color3.fromRGB(60, 30, 30),
        gold          = Color3.fromRGB(255, 180, 40),
    }

    local DISCORD_LINK = "https://discord.gg/get-ravine"

    local function saveKey(key) pcall(function() writefile("rvpaid.txt", key) end) end
    local function loadKey()
        local ok, content = pcall(function() return readfile("rvpaid.txt") end)
        return ok and content or nil
    end
    local function delKey() pcall(function() delfile("rvpaid.txt") end) end

    local function icon(name, size, color)
        local icons = {shield=84528813312016, x=73070135088117, key=128426502701541, check=83827110621355}
        local id = icons[name]
        if id then
            local img = Instance.new("ImageLabel")
            img.BackgroundTransparency = 1
            img.Size = UDim2.new(0, size or 18, 0, size or 18)
            img.Image = "rbxassetid://" .. tostring(id)
            img.ImageColor3 = color or Color3.fromRGB(255, 255, 255)
            img.ScaleType = Enum.ScaleType.Fit
            return img
        end
        return nil
    end

    local gui = Instance.new("ScreenGui")
    gui.Name = "RavinePaid"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    gui.Parent = game:GetService("CoreGui")

    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.new()
    overlay.BackgroundTransparency = 1
    overlay.BorderSizePixel = 0
    overlay.Parent = gui
    TweenService:Create(overlay, TweenInfo.new(0.3), {BackgroundTransparency = 0.5}):Play()

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 480, 0, 280)
    main.Position = UDim2.new(0.5, -240, 0.5, -140)
    main.BackgroundColor3 = Colors.surface
    main.BorderSizePixel = 0
    main.BackgroundTransparency = 1
    main.Parent = overlay
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)
    local stroke = Instance.new("UIStroke", main)
    stroke.Color = Colors.gold
    stroke.Thickness = 1.5
    stroke.Transparency = 0.4
    TweenService:Create(main, TweenInfo.new(0.35, Enum.EasingStyle.Quad), {BackgroundTransparency = 0, Position = UDim2.new(0.5, -240, 0.5, -140)}):Play()

    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundColor3 = Colors.background
    header.BorderSizePixel = 0
    header.Parent = main
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 16)
    local hf = Instance.new("Frame", header)
    hf.Size = UDim2.new(1, 0, 0, 12)
    hf.Position = UDim2.new(0, 0, 1, -12)
    hf.BackgroundColor3 = Colors.background
    hf.BorderSizePixel = 0

    local shieldIcon = icon("shield", 20, Colors.gold)
    shieldIcon.Position = UDim2.new(0, 16, 0.5, -10)
    shieldIcon.Parent = header

    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -80, 1, 0)
    title.Position = UDim2.new(0, 42, 0, 0)
    title.Text = "Ravine - Paid Version"
    title.TextColor3 = Colors.textPrimary
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.Parent = header

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0, 26, 0, 26)
    close.Position = UDim2.new(1, -34, 0.5, -13)
    close.BackgroundColor3 = Colors.primary
    close.BackgroundTransparency = 0.8
    close.Text = ""
    close.AutoButtonColor = false
    close.Parent = header
    Instance.new("UICorner", close).CornerRadius = UDim.new(0, 6)
    local xIcon = icon("x", 14, Colors.textPrimary)
    xIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    xIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    xIcon.Parent = close
    close.MouseButton1Click:Connect(function()
        getgenv().UI_CLOSED = true
        TweenService:Create(main, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        TweenService:Create(overlay, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        task.wait(0.2)
        gui:Destroy()
    end)

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -50, 1, -70)
    content.Position = UDim2.new(0, 25, 0, 60)
    content.BackgroundTransparency = 1
    content.Parent = main

    local title2 = Instance.new("TextLabel")
    title2.Size = UDim2.new(1, 0, 0, 22)
    title2.Position = UDim2.new(0, 0, 0, 10)
    title2.BackgroundTransparency = 1
    title2.Text = "Enter License Key"
    title2.TextColor3 = Colors.textPrimary
    title2.TextSize = 16
    title2.TextXAlignment = Enum.TextXAlignment.Center
    title2.Font = Enum.Font.GothamBold
    title2.Parent = content

    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(1, 0, 0, 16)
    sub.Position = UDim2.new(0, 0, 0, 34)
    sub.BackgroundTransparency = 1
    sub.Text = "This is a paid script - buyers only"
    sub.TextColor3 = Colors.gold
    sub.TextSize = 11
    sub.TextXAlignment = Enum.TextXAlignment.Center
    sub.Font = Enum.Font.Gotham
    sub.Parent = content

    local inputBg = Instance.new("Frame")
    inputBg.Size = UDim2.new(1, 0, 0, 44)
    inputBg.Position = UDim2.new(0, 0, 0, 65)
    inputBg.BackgroundColor3 = Colors.surfaceLight
    inputBg.BorderSizePixel = 0
    inputBg.Parent = content
    Instance.new("UICorner", inputBg).CornerRadius = UDim.new(0, 10)
    local inputStroke = Instance.new("UIStroke", inputBg)
    inputStroke.Color = Colors.gold
    inputStroke.Thickness = 1
    inputStroke.Transparency = 0.4

    local keyIcon = icon("key", 16, Colors.gold)
    keyIcon.Position = UDim2.new(0, 14, 0.5, -8)
    keyIcon.Parent = inputBg

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -42, 1, 0)
    input.Position = UDim2.new(0, 36, 0, 0)
    input.BackgroundTransparency = 1
    input.PlaceholderText = "Enter your license key"
    input.PlaceholderColor3 = Colors.textMuted
    input.Text = ""
    input.TextColor3 = Colors.textPrimary
    input.TextSize = 13
    input.Font = Enum.Font.Gotham
    input.Parent = inputBg

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 18)
    status.Position = UDim2.new(0, 0, 0, 118)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.TextSize = 11
    status.Font = Enum.Font.Gotham
    status.TextXAlignment = Enum.TextXAlignment.Center
    status.Parent = content

    local getKey = Instance.new("TextButton")
    getKey.Size = UDim2.new(0.47, 0, 0, 38)
    getKey.Position = UDim2.new(0, 0, 0, 145)
    getKey.BackgroundColor3 = Colors.background
    getKey.Text = "Get Key"
    getKey.TextColor3 = Colors.gold
    getKey.TextSize = 13
    getKey.Font = Enum.Font.GothamBold
    getKey.AutoButtonColor = false
    getKey.Parent = content
    Instance.new("UICorner", getKey).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", getKey).Color = Colors.gold

    getKey.MouseButton1Click:Connect(function()
        local link = Junkie.get_key_link()
        if link and setclipboard then
            setclipboard(link)
            status.Text = "Link copied to clipboard!"
            status.TextColor3 = Colors.success
        else
            status.Text = "Failed to get link"
            status.TextColor3 = Colors.error
        end
        task.wait(3)
        status.Text = ""
    end)

    local verify = Instance.new("TextButton")
    verify.Size = UDim2.new(0.47, 0, 0, 38)
    verify.Position = UDim2.new(0.53, 0, 0, 145)
    verify.BackgroundColor3 = Colors.gold
    verify.Text = "Verify"
    verify.TextColor3 = Color3.fromRGB(20, 20, 20)
    verify.TextSize = 13
    verify.Font = Enum.Font.GothamBold
    verify.AutoButtonColor = false
    verify.Parent = content
    Instance.new("UICorner", verify).CornerRadius = UDim.new(0, 10)

    verify.MouseButton1Click:Connect(function()
        local k = input.Text:gsub("%s+", "")
        if k == "" then
            status.Text = "Please enter a key"
            status.TextColor3 = Colors.error
            return
        end
        status.Text = "Verifying..."
        status.TextColor3 = Colors.gold
        local r = Junkie.check_key(k)
        if r and r.valid then
            saveKey(k)
            getgenv().SCRIPT_KEY = k
            status.Text = "Verified!"
            status.TextColor3 = Colors.success
            task.wait(0.5)
            TweenService:Create(main, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(overlay, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            task.wait(0.2)
            gui:Destroy()
        else
            status.Text = "Invalid key"
            status.TextColor3 = Colors.error
        end
    end)

    getKey.MouseEnter:Connect(function() TweenService:Create(getKey, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(20, 20, 25)}):Play() end)
    getKey.MouseLeave:Connect(function() TweenService:Create(getKey, TweenInfo.new(0.15), {BackgroundColor3 = Colors.background}):Play() end)
    verify.MouseEnter:Connect(function() TweenService:Create(verify, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 200, 60)}):Play() end)
    verify.MouseLeave:Connect(function() TweenService:Create(verify, TweenInfo.new(0.15), {BackgroundColor3 = Colors.gold}):Play() end)

    local saved = loadKey()
    if saved then
        local r = Junkie.check_key(saved)
        if r and r.valid then
            getgenv().SCRIPT_KEY = saved
            TweenService:Create(main, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(overlay, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            task.wait(0.2)
            gui:Destroy()
            return getgenv().SCRIPT_KEY
        else
            delKey()
        end
    end

    while not getgenv().UI_CLOSED do task.wait(0.1) end
    return getgenv().SCRIPT_KEY
end)()

-- Paid Loader UI
if getgenv().SCRIPT_KEY and getgenv().SCRIPT_KEY ~= "" then
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local CoreGui = game:GetService("CoreGui")
    local player = Players.LocalPlayer
    local PlaceId = game.PlaceId

    local RavineLoader = Instance.new("ScreenGui")
    RavineLoader.Name = "RavineLoader"
    RavineLoader.ResetOnSpawn = false
    RavineLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    RavineLoader.Parent = (gethui and gethui()) or CoreGui

    local Accent = Color3.fromRGB(255, 0, 0)
    local Gold = Color3.fromRGB(255, 180, 40)
    local Background = Color3.fromRGB(15, 15, 15)
    local Secondary = Color3.fromRGB(25, 25, 25)
    local TextColor = Color3.fromRGB(255, 255, 255)
    local TextDim = Color3.fromRGB(150, 150, 150)

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 600, 0, 400)
    Main.Position = UDim2.new(0.5, -300, 0.5, -200)
    Main.BackgroundColor3 = Background
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Parent = RavineLoader
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, 140)
    Header.BackgroundColor3 = Secondary
    Header.BorderSizePixel = 0
    Header.Parent = Main
    Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)
    local HeaderFix = Instance.new("Frame", Header)
    HeaderFix.Size = UDim2.new(1, 0, 0, 12)
    HeaderFix.Position = UDim2.new(0, 0, 1, -12)
    HeaderFix.BackgroundColor3 = Secondary
    HeaderFix.BorderSizePixel = 0

    local Logo = Instance.new("ImageLabel", Header)
    Logo.Size = UDim2.new(0, 50, 0, 50)
    Logo.Position = UDim2.new(0, 20, 0, 20)
    Logo.BackgroundTransparency = 1
    Logo.Image = "rbxassetid://128553373538203"

    local TitleLabel = Instance.new("TextLabel", Header)
    TitleLabel.Size = UDim2.new(0, 200, 0, 30)
    TitleLabel.Position = UDim2.new(0, 80, 0, 18)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Ravine Scripts"
    TitleLabel.TextColor3 = TextColor
    TitleLabel.TextSize = 24
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local Version = Instance.new("TextLabel", Header)
    Version.Size = UDim2.new(0, 100, 0, 20)
    Version.Position = UDim2.new(0, 80, 0, 48)
    Version.BackgroundTransparency = 1
    Version.Text = "v1.0.0 | PAID"
    Version.TextColor3 = Gold
    Version.TextSize = 12
    Version.Font = Enum.Font.Gotham
    Version.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton", Header)
    CloseBtn.Size = UDim2.new(0, 35, 0, 35)
    CloseBtn.Position = UDim2.new(1, -45, 0, 15)
    CloseBtn.BackgroundColor3 = Accent
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = TextColor
    CloseBtn.TextSize = 16
    CloseBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
    CloseBtn.MouseButton1Click:Connect(function() RavineLoader:Destroy() end)

    local MinBtn = Instance.new("TextButton", Header)
    MinBtn.Size = UDim2.new(0, 35, 0, 35)
    MinBtn.Position = UDim2.new(1, -85, 0, 15)
    MinBtn.BackgroundColor3 = Secondary
    MinBtn.Text = "-"
    MinBtn.TextColor3 = TextColor
    MinBtn.TextSize = 20
    MinBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)
    MinBtn.MouseButton1Click:Connect(function() Main.Visible = false end)

    local StatsBar = Instance.new("Frame", Header)
    StatsBar.Size = UDim2.new(1, -40, 0, 30)
    StatsBar.Position = UDim2.new(0, 20, 0, 85)
    StatsBar.BackgroundColor3 = Background
    StatsBar.BorderSizePixel = 0
    Instance.new("UICorner", StatsBar).CornerRadius = UDim.new(0, 6)

    local StatsLabel = Instance.new("TextLabel", StatsBar)
    StatsLabel.Size = UDim2.new(1, 0, 1, 0)
    StatsLabel.BackgroundTransparency = 1
    StatsLabel.Text = "Welcome, " .. player.DisplayName .. " | Made by xaaaxaa/yen | PAID"
    StatsLabel.TextColor3 = TextDim
    StatsLabel.TextSize = 12
    StatsLabel.Font = Enum.Font.Gotham

    local FooterLabel = Instance.new("TextLabel", Header)
    FooterLabel.Size = UDim2.new(1, -40, 0, 15)
    FooterLabel.Position = UDim2.new(0, 20, 0, 118)
    FooterLabel.BackgroundTransparency = 1
    FooterLabel.Text = "discord.gg/get-ravine"
    FooterLabel.TextColor3 = Gold
    FooterLabel.TextSize = 10
    FooterLabel.Font = Enum.Font.Gotham
    FooterLabel.TextXAlignment = Enum.TextXAlignment.Center

    local ScriptsContainer = Instance.new("ScrollingFrame", Main)
    ScriptsContainer.Size = UDim2.new(1, -10, 1, -150)
    ScriptsContainer.Position = UDim2.new(0, 5, 0, 145)
    ScriptsContainer.BackgroundTransparency = 1
    ScriptsContainer.BorderSizePixel = 0
    ScriptsContainer.ScrollBarThickness = 3
    ScriptsContainer.ScrollBarImageColor3 = Accent
    ScriptsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)

    local ScriptList = Instance.new("UIListLayout", ScriptsContainer)
    ScriptList.Padding = UDim.new(0, 10)
    ScriptList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ScriptList.SortOrder = Enum.SortOrder.LayoutOrder

    local FIAS_IDS = {17698425045, 86098085533596, 18248633989}

    local function CreateCard(name, desc, icon, placeIds, scriptUrl)
        local validPlace = false
        if type(placeIds) == "table" then
            for _, id in ipairs(placeIds) do
                if PlaceId == id then validPlace = true; break end
            end
        else
            validPlace = PlaceId == placeIds
        end

        local Card = Instance.new("Frame", ScriptsContainer)
        Card.Size = UDim2.new(1, -10, 0, 70)
        Card.BackgroundColor3 = Secondary
        Card.BorderSizePixel = 0
        Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)
        local Icon = Instance.new("ImageLabel", Card)
        Icon.Size = UDim2.new(0, 45, 0, 45)
        Icon.Position = UDim2.new(0, 12, 0.5, -22)
        Icon.BackgroundTransparency = 1
        Icon.Image = icon
        Icon.ScaleType = Enum.ScaleType.Fit
        Instance.new("UICorner", Icon).CornerRadius = UDim.new(0, 6)
        local NameLabel = Instance.new("TextLabel", Card)
        NameLabel.Size = UDim2.new(1, -160, 0, 25)
        NameLabel.Position = UDim2.new(0, 70, 0, 10)
        NameLabel.BackgroundTransparency = 1
        NameLabel.Text = name
        NameLabel.TextColor3 = TextColor
        NameLabel.TextSize = 15
        NameLabel.Font = Enum.Font.GothamBold
        NameLabel.TextXAlignment = Enum.TextXAlignment.Left
        local DescLabel = Instance.new("TextLabel", Card)
        DescLabel.Size = UDim2.new(1, -160, 0, 20)
        DescLabel.Position = UDim2.new(0, 70, 0, 35)
        DescLabel.BackgroundTransparency = 1
        DescLabel.Text = desc
        DescLabel.TextColor3 = TextDim
        DescLabel.TextSize = 11
        DescLabel.Font = Enum.Font.Gotham
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        local LoadBtn = Instance.new("TextButton", Card)
        LoadBtn.Size = UDim2.new(0, 70, 0, 28)
        LoadBtn.Position = UDim2.new(1, -85, 0.5, -14)
        LoadBtn.BackgroundColor3 = validPlace and Accent or Color3.fromRGB(100, 100, 100)
        LoadBtn.Text = validPlace and "LOAD" or "WRONG GAME"
        LoadBtn.TextColor3 = TextColor
        LoadBtn.TextSize = validPlace and 12 or 9
        LoadBtn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", LoadBtn).CornerRadius = UDim.new(0, 5)
        if validPlace then
            LoadBtn.MouseEnter:Connect(function() TweenService:Create(LoadBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}):Play() end)
            LoadBtn.MouseLeave:Connect(function() TweenService:Create(LoadBtn, TweenInfo.new(0.2), {BackgroundColor3 = Accent}):Play() end)
            LoadBtn.MouseButton1Click:Connect(function()
                RavineLoader:Destroy()
                loadstring(game:HttpGet(scriptUrl))()
            end)
        end
        ScriptsContainer.CanvasSize = UDim2.new(0, 0, 0, ScriptList.AbsoluteContentSize.Y + 20)
    end

local Scripts = {
    {
        Name = "Ravine FIAS",
        Description = "Combat, Farming, ESP, Teleports, Visuals & More",
        Icon = "https://tr.rbxcdn.com/180DAY-7673b5e1c0a3a7b07c67aa457adf05ea/768/432/Image/Webp/noFilter",
        PlaceIds = {17698425045, 86098085533596, 18248633989, 118758941554698},
        ScriptUrl = "https://api.jnkie.com/api/v1/luascripts/public/dd10132a062f2844864b34294b4ca7ebdc9739df46f35337458565dab152bb12/download"
    },
    {
        Name = "Ravine Fight on A Baseplate",
        Description = "Kill Aura, Auto Weave, No Collide, Anti Shake, & More",
        Icon = "https://tr.rbxcdn.com/180DAY-fb0455d36bd1cd15f946c57abb8f2c6d/256/256/Image/Webp/noFilter",
        PlaceIds = {130960021905304, 137378874406308},
        ScriptUrl = "https://api.jnkie.com/api/v1/luascripts/public/1d349056bca8764ab9639f23872367047609c580a6880b67018eadf7835a71b6/download"
    },
    {
        Name = "Ravine Rivals",
        Description = "Aimbot, Silent Aim, ESP, Speed Boost, Fly",
        Icon = "https://tr.rbxcdn.com/180DAY-fb0455d36bd1cd15f946c57abb8f2c6d/256/256/Image/Webp/noFilter",
        PlaceIds = {137233438285284},
        ScriptUrl = "https://api.jnkie.com/api/v1/luascripts/public/90c1d17e56dde077f07093c3ed646b294ddff0ed0e463355c39d4de0c5ee3319/download"
    },
    {
        Name = "Ravine Chicken Farm",
        Description = "Auto Collect, Deposit, Upgrade, Merge, Lucky Blocks",
        Icon = "https://tr.rbxcdn.com/180DAY-fb0455d36bd1cd15f946c57abb8f2c6d/256/256/Image/Webp/noFilter",
        PlaceIds = {137233438285284},
        ScriptUrl = "https://api.jnkie.com/api/v1/luascripts/public/ac60f1676292ca48e5182d186ffe451cba01de6464c2b02153ff36b6adee900f/download"
    },
}

    for _, scriptData in ipairs(Scripts) do
        CreateCard(scriptData.Name, scriptData.Description, scriptData.Icon, scriptData.PlaceIds, scriptData.ScriptUrl)
    end

    local dragging, dragStart, startPos
    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = Main.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
end
