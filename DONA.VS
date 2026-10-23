-- Drakon hub | by Davy...
-- v33: correção Bat Bypass, fundo sem afetar texto, TRIPA ON/OFF e Insta Reset S2.
-- [[ Hii! this file was cracked by SOURCE_CODE ]]
-- [[ TIMESTAMP: 08:59:18 ]]

--[[fmwm.1.ZmZhLTFiMTAzNzkzLThlNGUtNGE5MS1hYTEwLTc4NzUxMTNlYjNkNS1iNDAwM2FjN3wxYjEwMzc5My04ZTRlLTRhOTEtYWExMC03ODc1MTEzZWIzZDV8MjcwZjFmNWU4NWY1ZjNhNWFhZDA0YjBhNDU3ZmNiNWF8MTc5MTM3NDM2Mw.01941f355025]]
-- thin prelude
pcall(function()
  -- prelude
  pcall(function() if _G._FAULMOR_DIAG then print('DIAG: PRELUDE_START') end end)
  local _lO0lO = ""
  local _lI1lI = "9DE67514-21A8-4953-A107-19413497B8DC"
  local _lOo0O = nil
  local _l1i1l = nil
  local _l0IiI = "free"
  local _l1oO0 = nil
  local _lI0o1 = 78
  local _l0l0l = "Potassium"
  local _lI1i1 = false
  local function _fm_hb_env()
    local ok, e = pcall(function() return type(getgenv) == 'function' and getgenv() end)
    if ok and type(e) == 'table' then return e end
    local ok2, e2 = pcall(function() return type(getfenv) == 'function' and getfenv(0) end)
    if ok2 and type(e2) == 'table' then return e2 end
    return _G
  end
  do
    local env=nil do local gg=nil local ok,g=pcall(function() return type(getgenv) == 'function' and getgenv() end) if ok and type(g)=='table' then gg=g end local function tr(l) if type(getfenv) == 'function' then local ok2,e=pcall(getfenv,l) if ok2 and type(e)=='table' then return e end end end env=tr(2) or tr(3) or gg or tr(1) or tr(0) or _G end
    if type(env) == 'table' then
      env.LRM_ScriptKey = _lO0lO
      env.LRM_HWID = _lI1lI
      env.LRM_LinkedDiscordID = _lOo0O
      env.LRM_LinkedDiscordName = _l1i1l
      env.LRM_KeyType = _l0IiI
      env.LRM_KeyExpiresAt = _l1oO0
      env.LRM_TotalExecutions = _lI0o1
      env.LRM_Executor = _l0l0l
      env.LRM_IsPremium = _lI1i1
      local _spawn = (type(task) == 'table' and type(task.spawn) == 'function' and task.spawn) or (type(coroutine) == 'table' and type(coroutine.create) == 'function' and type(coroutine.resume) == 'function' and function(f) local co=coroutine.create(f); pcall(coroutine.resume, co) end)
      local _wait = (type(task) == 'table' and type(task.wait) == 'function' and task.wait) or (type(wait) == 'function' and wait)
      local _unpack = (type(table) == 'table' and type(table.unpack) == 'function' and table.unpack) or (type(unpack) == 'function' and unpack)
      if _spawn then env.LRM_Spawn = _spawn end
      if _wait then env.LRM_Wait = _wait end
      if _unpack then env.LRM_Unpack = _unpack end
    end
  end
  -- Bloco de sessão removido para não expor token/identificador nem enviar dados a servidor.
  -- end prelude

end)
-- Loader remoto removido: não baixa nem executa código de servidor externo.

repeat task.wait() until game:IsLoaded()
Players = game:GetService("Players")
RunService = game:GetService("RunService")
UIS = game:GetService("UserInputService")
Lighting = game:GetService("Lighting")
HS = game:GetService("HttpService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
TS_G = game:GetService("TweenService")
LP = Players.LocalPlayer
camera = workspace.CurrentCamera
CONFIG_FILE = "DONA.VS.json"
HUB_COLOR_OPTIONS = {"original", "gold", "violet"}
DEFAULT_HUB_COLOR = HUB_COLOR_OPTIONS[1]


-- Identidade visual compartilhada: mantém o nome e os créditos originais.
DaHubBrandStyle = {
    text = "DONA.VS",
    fontMode = "original",
    labels = setmetatable({}, {__mode = "k"}),
    silver = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(155, 160, 170)),
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(225, 230, 240)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.65, Color3.fromRGB(225, 230, 240)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(155, 160, 170)),
    }),
}
function DaHubBrandStyle.apply(label)
    DaHubBrandStyle.labels[label] = label:GetAttribute("DaHubBaseTitleSize") or label.TextSize
    label:SetAttribute("DaHubBaseTitleSize", DaHubBrandStyle.labels[label])
    label.Font = DaHubBrandStyle.fontMode == "balloon" and Enum.Font.FredokaOne or Enum.Font.GothamBlack
    label.TextSize = DaHubBrandStyle.labels[label] * (DaHubBrandStyle.fontMode == "balloon" and 1.2 or 1)
    label.TextWrapped = false
    local sizeLimit = label:FindFirstChild("DaHubTitleSizeLimit") or Instance.new("UITextSizeConstraint", label)
    sizeLimit.Name = "DaHubTitleSizeLimit"
    sizeLimit.MinTextSize = 10
    sizeLimit.MaxTextSize = label.TextSize
    label.TextScaled = true
    local gradient = label:FindFirstChildOfClass("UIGradient") or Instance.new("UIGradient", label)
    gradient.Name = "DaHubBrandShine"
    gradient.Color = DaHubBrandStyle.silver
    gradient.Rotation = 0
    -- Brilho prateado estático: evita um tween infinito para cada título.
end

function DaHubBrandStyle.setFont(mode, shouldSave)
    DaHubBrandStyle.fontMode = mode == "balloon" and "balloon" or "original"
    for label, baseSize in pairs(DaHubBrandStyle.labels) do
        if label.Parent then
            label.Font = DaHubBrandStyle.fontMode == "balloon" and Enum.Font.FredokaOne or Enum.Font.GothamBlack
            label.TextSize = baseSize * (DaHubBrandStyle.fontMode == "balloon" and 1.2 or 1)
            local limit = label:FindFirstChild("DaHubTitleSizeLimit")
            if limit then limit.MaxTextSize = label.TextSize end
        end
    end
    if S and S.refreshHubFontSelection then S.refreshHubFontSelection() end
    if shouldSave and saveConfig then saveConfig() end
end

-- INTRO AUTÓNOMA CON MÚSICA
-- Ejecutable en Roblox/Luau. Muestra la intro completa y permite omitirla
-- tocando o haciendo clic en cualquier parte.


-- Música de la intro. Se detiene al tocar “TAP ANYWHERE TO SKIP”.
INTRO_MUSIC_URL = "https://files.catbox.moe/y4q5y3.mp3"
INTRO_MUSIC_FILE = "cleanhub_intro_song_14.mp3"
INTRO_MUSIC_VOLUME = 1
SoundService = game:GetService("SoundService")

local function resolveIntroMusicId()
    local assetGetter = getcustomasset or getsynasset
    if type(assetGetter) == "function" and type(writefile) == "function" then
        local exists = false
        if type(isfile) == "function" then
            pcall(function() exists = isfile(INTRO_MUSIC_FILE) end)
        end
        if not exists then
            local ok, data = pcall(function() return game:HttpGet(INTRO_MUSIC_URL) end)
            if ok and type(data) == "string" and #data > 0 then
                pcall(writefile, INTRO_MUSIC_FILE, data)
            end
        end
        local ok, asset = pcall(assetGetter, INTRO_MUSIC_FILE)
        if ok and asset then return asset end
    end
    return INTRO_MUSIC_URL
end

-- Valores usados por la animación original.
v76 = {
    [1]=12, [6]=32, [10]=0.15, [13]=0.4, [14]=6, [20]=3,
    [26]=255, [31]=5, [37]=22, [52]=100, [58]=1, [72]=60,
    [89]=2, [94]="Frame", [95]=4, [100]=10, [104]=false,
    [150]="TextButton", [164]=0.5, [168]=1, [175]=0, [187]=6, [198]=true,
}
_G._VantaSkipIntro = false
_G._VantaIntroActive = true

									local function showIntro(onFinished)
									local introSound
									local function stopIntroMusic()
										if introSound then
											pcall(function() introSound:Stop() end)
											pcall(function() introSound:Destroy() end)
											introSound = nil
										end
									end

										if _G._VantaLoadIntroCleanup then
											pcall(_G._VantaLoadIntroCleanup)
										end


										local flag19 = UIS.TouchEnabled and not UIS.KeyboardEnabled
										local playerGui = LP:WaitForChild("PlayerGui")
										local vantaLoadIntro = playerGui:FindFirstChild("VantaLoadIntro")

										if vantaLoadIntro then
											vantaLoadIntro:Destroy()
										end

										local vantaLoadIntroBlur = Lighting:FindFirstChild("VantaLoadIntroBlur")

										if vantaLoadIntroBlur then
											vantaLoadIntroBlur:Destroy()
										end

										local screenGui = Instance.new("ScreenGui")
										screenGui.Name = "VantaLoadIntro"

										if _G._VantaMountOnTop then
											_G._VantaMountOnTop(screenGui, 1000005)
										else
											screenGui.ResetOnSpawn = v76[104]
											screenGui.DisplayOrder = 1000005
											screenGui.Parent = playerGui
										end

										screenGui.IgnoreGuiInset = true

										introSound = Instance.new("Sound")
										introSound.Name = "VantaIntroMusic"
										introSound.SoundId = resolveIntroMusicId()
										introSound.Volume = INTRO_MUSIC_VOLUME
										introSound.Looped = false
										introSound.Parent = SoundService
										pcall(function() introSound:Play() end)
										local instance = Instance.new(v76[94])
										instance.BackgroundColor3 = Color3.fromRGB(v76[31], v76[31], 8)
										instance.BackgroundTransparency = 1
										instance.BorderSizePixel = 0
										instance.Size = UDim2.fromScale(1, 1)
										instance.ZIndex = 1000
										instance.Parent = screenGui
										local frame = Instance.new("Frame")
										frame.Name = "MovingStars"
										frame.BackgroundTransparency = 1
										frame.BorderSizePixel = v76[175]
										frame.Size = UDim2.fromScale(1, 1)
										frame.ClipsDescendants = v76[198]
										frame.ZIndex = 1001
										frame.Parent = instance
										frame.Visible = false -- eliminar puntitos/estrellas
										local tbl24 = {}
										local n32 = 0 -- sin puntitos/estrellas

										for i = 1, n32 do
											local frame2 = Instance.new("Frame")
											frame2.BackgroundColor3 = i % v76[187] == v76[175] and Color3.fromRGB(225, 225, 225) or Color3.fromRGB(245, 245, 245)
											frame2.BackgroundTransparency = v76[168]
											frame2.BorderSizePixel = 0
											frame2.AnchorPoint = Vector2.new(0.5, 0.5)
											frame2.Size = UDim2.fromOffset(i % 9 == 0 and 3 or v76[89], i % 9 == 0 and 3 or 2)
											frame2.ZIndex = 1001
											frame2.Parent = frame
											local uiCorner = Instance.new("UICorner")
											uiCorner.CornerRadius = UDim.new(1, 0)
											uiCorner.Parent = frame2

											tbl24[i] = {
												frame = frame2,
												x = i * 37 % 101 / v76[52],
												y = i * 61 % 101 / 100,
												speed = 0.008 + i % v76[31] * 0.004,
												phase = i * 0.83,
												opacity = 0.35 + i % v76[95] * 0.1,
											}
										end

										local frame2 = Instance.new("Frame")
										frame2.Name = "VantaWordmark"
										frame2.BackgroundTransparency = v76[168]
										frame2.BorderSizePixel = 0
										frame2.AnchorPoint = Vector2.new(0.5, 0.5)
										frame2.Position = UDim2.fromScale(0.5, 0.43)
										frame2.Size = flag19 and UDim2.fromOffset(340, 105) or UDim2.fromOffset(820, 230)
										frame2.ClipsDescendants = false
										frame2.ZIndex = 1003
										frame2.Parent = instance
										local uiScale = Instance.new("UIScale")
										uiScale.Scale = 0.86
										uiScale.Parent = frame2
										local tbl25 = {}

										local tbl26 = {
											id = 116838820706368,
											from = Vector2.new(-v76[13], 0.2),
											final = Vector2.new(0.08, 0.5),
											rotation = -v76[6],
											delay = 0.02,
										}

										local tbl27 = {
											id = 100562870418590,
											from = Vector2.new(0.3, -0.55),
											final = Vector2.new(0.245, 0.5),
											rotation = 20,
											delay = 0.12,
										}

										local tbl28 = {
											id = 139374055352240,
											from = Vector2.new(1.42, 0.3),
											final = Vector2.new(0.41, 0.5),
											rotation = -22,
											delay = 0.22,
										}

										local tbl29 = {
											id = 102192810852440,
											from = Vector2.new(0.68, 1.55),
											final = Vector2.new(0.575, 0.5),
											rotation = 27,
											delay = 0.32,
										}

										local tbl30 = {
											id = 112072591999551,
											from = Vector2.new(1.48, -0.42),
											final = Vector2.new(0.74, 0.5),
											rotation = 18,
											delay = 0.42,
										}
										local tbl32 = {
											id = 92498386894715,
											from = Vector2.new(-0.35, 1.35),
											final = Vector2.new(0.905, 0.5),
											rotation = -14,
											delay = 0.52,
										}

										for i = 1, #DaHubBrandStyle.text do
										    local source = ({tbl26, tbl27, tbl28, tbl29, tbl30, tbl32})[(i - 1) % 6 + 1]
										    tbl25[i] = {
										        from = source.from,
										        final = Vector2.new((i - 0.5) / #DaHubBrandStyle.text, 0.5),
										        rotation = source.rotation,
										        delay = (i - 1) * 0.06,
										    }
										end
										local tbl31 = {}

										for i, v94 in ipairs(tbl25) do
											local frame3 = Instance.new("Frame")
											frame3.BackgroundTransparency = 1
											frame3.BorderSizePixel = 0
											frame3.AnchorPoint = Vector2.new(0.5, 0.5)
											frame3.Position = UDim2.fromScale(v94.from.X, v94.from.Y)
											frame3.Size = UDim2.fromScale(1 / #DaHubBrandStyle.text, v76[168])
											frame3.Rotation = v94.rotation
											frame3.ZIndex = 1003 + i
											frame3.Parent = frame2
											local imageLabel = Instance.new("TextLabel")
											imageLabel.BackgroundTransparency = 1
											imageLabel.BorderSizePixel = 0
											imageLabel.Text = string.sub(DaHubBrandStyle.text, i, i)
											imageLabel.Font = Enum.Font.GothamBlack
											imageLabel.TextScaled = true
											imageLabel.TextColor3 = Color3.fromRGB(v76[26], 255, 255)
											imageLabel.TextTransparency = v76[168]
											imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
											imageLabel.Position = UDim2.fromScale(0.5, 0.5)
											imageLabel.Size = UDim2.fromScale(1, v76[168])
											imageLabel.ZIndex = 1004 + i
											imageLabel.Parent = frame3
											imageLabel.TextSize = flag19 and 100 or 230
											DaHubBrandStyle.apply(imageLabel)
											tbl31[i] = { slot = frame3, image = imageLabel, spec = v94 }
										end

										local textLabel = Instance.new("TextLabel")
										textLabel.BackgroundTransparency = v76[168]
										textLabel.Text = "TAP ANYWHERE TO SKIP"
										textLabel.TextColor3 = Color3.fromRGB(240, 240, 244)
										textLabel.TextTransparency = 1
										textLabel.TextSize = flag19 and 16 or 20
										textLabel.Font = Enum.Font.GothamMedium
										textLabel.AnchorPoint = Vector2.new(0.5, v76[164])
										textLabel.Position = flag19 and UDim2.new(0.5, 0, 0.43, 82) or UDim2.new(0.5, 0, 0.43, 155)
										textLabel.Size = UDim2.new(0.8, 0, 0, 24)
										textLabel.ZIndex = 1010
										textLabel.Parent = instance
										local textLabel2 = Instance.new("TextLabel")
										textLabel2.BackgroundTransparency = 1
										textLabel2.Text = "by Davy..."
										textLabel2.TextColor3 = Color3.fromRGB(166, 168, 178)
										textLabel2.TextTransparency = 1
										textLabel2.TextSize = flag19 and 14 or 18
										textLabel2.Font = Enum.Font.GothamMedium
										textLabel2.AnchorPoint = Vector2.new(0.5, v76[164])
										textLabel2.Position = flag19 and UDim2.new(0.5, 0, 0.43, 102) or UDim2.new(0.5, 0, 0.43, 183)
										textLabel2.Size = UDim2.new(0.8, 0, 0, 22)
										textLabel2.ZIndex = 1010
										textLabel2.Parent = instance
										local instance2 = Instance.new(v76[150])
										instance2.BackgroundTransparency = 1
										instance2.Text = ""
										instance2.AutoButtonColor = false
										instance2.Size = UDim2.fromScale(v76[168], 1)
										instance2.ZIndex = 1011
										instance2.Parent = instance
										local blurEffect = Instance.new("BlurEffect")
										blurEffect.Name = "VantaLoadIntroBlur"
										blurEffect.Size = v76[175]
										blurEffect.Parent = Lighting
										local flag20 = true
										local flag21 = false

										local function fn33(arg2)
											local n33 = math.clamp(arg2, 0, v76[168])
											return n33 * n33 * (v76[20] - 2 * n33)
										end

										local function fn34(arg2, arg3, arg4, arg5)
											local n33 = 1 - arg5
											return Vector2.new(n33 * n33 * arg2.X + v76[89] * n33 * arg5 * arg3.X + arg5 * arg5 * arg4.X, n33 * n33 * arg2.Y + 2 * n33 * arg5 * arg3.Y + arg5 * arg5 * arg4.Y)
										end

										local function fn35()
											if flag21 then
												return
											end
											flag21 = true
											flag20 = false
											stopIntroMusic()
											local tweenInfo = TweenInfo.new(0.42, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)


											TS_G:Create(instance, tweenInfo, { BackgroundTransparency = 1 }):Play()
											TS_G:Create(uiScale, tweenInfo, { Scale = 0.72 }):Play()
											TS_G:Create(blurEffect, tweenInfo, { Size = 0 }):Play()
											TS_G:Create(textLabel, tweenInfo, { TextTransparency = v76[168] }):Play()
											TS_G:Create(textLabel2, tweenInfo, { TextTransparency = 1 }):Play()

											for _, v94 in ipairs(tbl24) do
												TS_G:Create(v94.frame, tweenInfo, { BackgroundTransparency = 1 }):Play()
											end

											for _, v94 in ipairs(tbl31) do
												TS_G:Create(v94.image, tweenInfo, { TextTransparency = 1 }):Play()
											end

											task.delay(0.42, function()
												if screenGui.Parent then
													screenGui:Destroy()
												end

												if blurEffect.Parent then
													blurEffect:Destroy()
												end

												_G._VantaLoadIntroCleanup = nil

												if onFinished then
													onFinished()
												end
											end)
										end

										_G._VantaLoadIntroCleanup = function()
											flag20 = v76[104]
											flag21 = true
											stopIntroMusic()


											if screenGui.Parent then
												screenGui:Destroy()
											end

											if blurEffect.Parent then
												blurEffect:Destroy()
											end
										end

										instance2.Activated:Connect(fn35)
										TS_G:Create(instance, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.5 }):Play()
										TS_G:Create(blurEffect, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = 10 }):Play()
										TS_G:Create(textLabel, TweenInfo.new(0.25), { TextTransparency = 0.22 }):Play()
										TS_G:Create(textLabel2, TweenInfo.new(0.25), { TextTransparency = 0.18 }):Play()

										task.spawn(function()
											local now2 = os.clock()

											while flag20 and not flag21 do
												local n33 = os.clock() - now2
												local v94 = fn33((n33 - 0.38) / 0.9)
												local n34 = math.sin(n33 * 1.62) * v94
												local n35 = math.sin(n33 * 3.24) * v94
												uiScale.Scale = 0.86 + fn33(n33 / 0.78) * 0.14 + n34 * 0.012
												local v95 = fn33(n33 / 0.42)

												for _, v96 in ipairs(tbl24) do
													local n36 = (v96.x + n33 * v96.speed) % 1.12 - 0.06
													local n37 = v96.y + math.sin(n33 * 0.78 + v96.phase) * 0.012
													local n38 = (math.sin(n33 * v76[89] + v96.phase) + 1) * 0.5
													v96.frame.Position = UDim2.fromScale(n36, n37)
													v96.frame.BackgroundTransparency = v76[168] - v95 * (v96.opacity + n38 * v76[10])
												end

												for i, v96 in ipairs(tbl31) do
													local spec = v96.spec
													local n36 = i - 3
													local n37 = math.abs(n36) / 2
													local n38 = math.clamp((n33 - spec.delay) / 0.96, 0, 1)
													local n39 = 1 - (v76[168] - n38) ^ 3
													local v97 = fn34(spec.from, Vector2.new((spec.from.X + spec.final.X) * 0.5 - n36 * 0.08, (spec.from.Y + spec.final.Y) * 0.5 + (i % v76[89] == 0 and -0.23 or 0.23)), spec.final, n39)
													v96.slot.Position = UDim2.fromScale(v97.X + n36 * n34 * 0.009, v97.Y + (n37 * n37 * v76[1] - v76[14]) * n34 / 230 + n35 * (1 - n37) * 2.4 / 230)
													v96.slot.Size = UDim2.fromScale(0.16 * (v76[168] + n34 * (0.035 + n37 * 0.055)), 1 - n34 * (0.028 + n37 * 0.045))
													v96.slot.Rotation = spec.rotation * (v76[168] - n39) + n36 * n34 * 5.8 + n35 * (v76[168] - n37) * 0.8
													local v98 = math.sin(n33 * 2.85 + i * 0.82)
													local v99 = math.sin(n33 * 2.1 + i * 0.64)
													v96.image.Position = UDim2.new(0.5, 0, 0.5, v99 * 1.35)
													v96.image.Size = UDim2.fromScale(1 + v98 * 0.026, 1 - v98 * 0.038)
													v96.image.Rotation = v99 * 0.9
													v96.image.TextTransparency = 1 - fn33((n38 - 0.02) / 0.18)
												end

												RunService.RenderStepped:Wait()
											end
										end)

										task.delay(v76[100], fn35)
									end

local function clearOldDaHubInterface()
    if type(_G._DaHubBatBypassCleanup) == "function" then
        pcall(_G._DaHubBatBypassCleanup)
        _G._DaHubBatBypassCleanup = nil
    end
    local playerGui = LP:WaitForChild("PlayerGui")
    local roots = {playerGui}
    local coreOk, coreGui = pcall(function() return game:GetService("CoreGui") end)
    if coreOk and coreGui then table.insert(roots, coreGui) end

    for _, root in ipairs(roots) do
        for _, guiName in ipairs({"DaHub", "DaHubStealHUD", "StealBarMovableSmall", "DaHub_FloatingPanel", "FloatingModeMenu", "BrainrotIntroGui"}) do
            local oldGui = root:FindFirstChild(guiName)
            if oldGui then pcall(function() oldGui:Destroy() end) end
        end
    end

    local character = LP.Character
    local head = character and character:FindFirstChild("Head")
    local oldBillboard = head and head:FindFirstChild("DaHubSpeedBB")
    if oldBillboard then oldBillboard:Destroy() end
end

clearOldDaHubInterface()

removedAccessories = {}

local function removeCharacterAccessories()
    local char = LP.Character
    if not char then return end
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("Accessory") or child:IsA("Hat") or (child:IsA("Model") and child:FindFirstChild("Handle")) then
            table.insert(removedAccessories, {parent = child.Parent, acc = child})
            child.Parent = nil
        end
    end
end

local function restoreAccessories()
    for _, item in ipairs(removedAccessories) do
        if item.acc and not item.acc.Parent then
            item.acc.Parent = item.parent
        end
    end
    removedAccessories = {}
end

local function safeWritefile(path, data) if type(writefile) == "function" then pcall(writefile, path, data) end end
local function safeReadfile(path) if type(readfile) == "function" then local ok, data = pcall(readfile, path) return ok and data or nil end return nil end
local function safeIsfile(path) if type(isfile) == "function" then local ok, res = pcall(isfile, path) return ok and res end return false end
local function safeSetfpscap(v) if type(setfpscap) == "function" then pcall(setfpscap, v) end end
local function safeSethiddenproperty(obj, prop, val) if type(sethiddenproperty) == "function" then pcall(sethiddenproperty, obj, prop, val) end end

S = {
    espEnabled = false, espPlayerCache = {players = {}, addConn = nil, remConn = nil, colorConn = nil, _colorAcc = 0}, setESPVisual = nil,
    NS = 70, CS = 45, LS = 22, LCS = 22,
    speedMode = false, laggerMode = 0,
    antiRagdollEnabled = false, medusaCounterEnabled = false,
    medusaDebounce = false, medusaLastUsed = 0, medusaConns = {}, MEDUSA_COOLDOWN = 25,
    unwalkEnabled = false,
    autoLeftEnabled = false, autoRightEnabled = false,
    autoLeftSetVisual = nil, autoRightSetVisual = nil,
    _btnAAL = nil, _bsAAL = nil, _l1AAL = nil, _l2AAL = nil,
    _btnAAR = nil, _bsAAR = nil, _l1AAR = nil, _l2AAR = nil,
    _btnBAT = nil, _bsBAT = nil, _l1BAT = nil, _l2BAT = nil,
    _setPButtonActive = nil, speedCounterLabel = nil, speedDiscordLabel = nil, speedLabelLastUpdate = 0,
    batBypassEnabled = false, setBatBypassVisual = nil,
    informationE01Enabled = true, setInformationE01Visual = nil,
    batAimbotEnabled = false, batAimbotSetVisual = nil, batAimbotConn = nil,
    tpBatEnabled = false, tpBatSetVisual = nil, tpBatConn = nil, tpBatHitCooldown = false,
    tpBatAntiDieConnections = {}, batTpEnabled = false, _smartBatTpDriving = false,
    autoSwingEnabled = true, autoBatEquippedThisRun = false,
    _autoBatTarget = nil, _autoBatLastScan = 0,
    resetAutoBatMotion = nil,
    batCounterEnabled = false, batCounterConn = nil, batCounterDebounce = false,
    setBatCounterVisual = nil,
    medusaSkinMode = "Off", medusaSkinSelectorLabel = nil,
    batSkinMode = "Off", batSkinSelectorLabel = nil, batSkinConnections = {},
    displaySkin = "Off", displaySkinSelectorLabel = nil, customSkinEnabled = false, _skinApplyToken = 0,
    fpsBoostEnabled = false,
    lockUIEnabled = false,
    mainMenuFrame = nil, miniToggleButton = nil, floatingPanelFrame = nil, floatingPanelGui = nil,
    _floatingButtonInfos = nil, _floatingFreeButtonLayer = nil, _floatingUpdateLayout = nil,
    mainGuiScaleObj = nil, floatingGuiScaleObj = nil,
    hubColor = DEFAULT_HUB_COLOR,
    optimizerMode = "standard", setTripaVisual = nil,
    _noclipTimer = 0, _fpsCount = 0, _lastFpsTime = tick(), currentFPS = 0,
    alConn = nil, arConn = nil, alPhase = 1, arPhase = 1,
    progressFill = nil, progressPct = nil, progressBarFrame = nil, topBarHUD = nil, stealHudCard = nil,
    stealActive = false,
    setLaggerVisual = nil, speedClk = nil, setFpsVisual = nil,
    setAntiRagVisual = nil, setMedusaVisual = nil,
    setUnwalkVisual = nil, setDarkVisual = nil, setInstaGrab = nil,
    normalBox = nil, carryBox = nil, laggerBox = nil,
    radInput = nil, setLockUI_Visual = nil, setHideOpiumButtons = nil,
    holdJumpEnabled = false, holdJumpConn = nil, setHoldJumpVisual = nil,
    stealDurationBox = nil,
    hudBgLabel = nil,
    hudBarPos = nil,
    dropBrainrotActive = false,
    dropMode = 1, -- Drakon: 1 = Fling, 2 = Jump Drop
    lastDropTime = 0,
    _dropSpeedMode = nil,
    _dropLaggerMode = nil,
    tpDownHeightTrigger = 20,
    Steal = {
        AutoStealEnabled = false, StealRadius = 61, StealDuration = 1.3,
        Data = {}, plotCache = {}, plotCacheTime = {}, cachedPrompts = {}, promptCacheTime = 0,
        isStealing = false, stealStartTime = nil, lastStealTick = 0,
    },
    KB = {
        DropBrainrot = {kb = Enum.KeyCode.X, gp = Enum.KeyCode.ButtonR2},
        AutoLeft = {kb = Enum.KeyCode.Z, gp = Enum.KeyCode.DPadLeft},
        AutoRight = {kb = Enum.KeyCode.C, gp = Enum.KeyCode.DPadRight},
        AutoBat = {kb = Enum.KeyCode.E, gp = Enum.KeyCode.ButtonY},
        BatBypass = {kb = Enum.KeyCode.V, gp = Enum.KeyCode.ButtonB},
        TPFlor = {kb = Enum.KeyCode.F, gp = Enum.KeyCode.ButtonA},
        GuiHide = {kb = Enum.KeyCode.LeftControl, gp = Enum.KeyCode.ButtonSelect},
        SpeedToggle = {kb = Enum.KeyCode.Q, gp = Enum.KeyCode.DPadUp},
        LaggerToggle = {kb = Enum.KeyCode.R, gp = Enum.KeyCode.DPadDown},
    },
    AP = {
        L1 = Vector3.new(-476.47, -6.28, 92.73), L2 = Vector3.new(-483.12, -4.95, 94.81),
        L_FACE = Vector3.new(-482.25, -4.96, 92.09),
        R1 = Vector3.new(-476.16, -6.52, 25.62), R2 = Vector3.new(-483.06, -5.03, 25.48),
        R_FACE = Vector3.new(-482.06, -6.93, 35.47),
    },
    Conns = {autoSteal = nil, antiRag = nil, anchor = {}, progress = nil},
    moveConn = nil, speedEnabled = true, h = nil, hrp = nil,
    lastMoveDir = Vector3.new(0,0,0),
    MOVE_KEYS = {
        [Enum.KeyCode.W] = true, [Enum.KeyCode.A] = true,
        [Enum.KeyCode.S] = true, [Enum.KeyCode.D] = true,
        [Enum.KeyCode.Up] = true, [Enum.KeyCode.Left] = true,
        [Enum.KeyCode.Down] = true, [Enum.KeyCode.Right] = true,
    },
    lockMobileButtons = false,
    editMobileButtons = false,
    mobileButtonStyle = "original",
    IS_TOUCH_DEVICE = UIS.TouchEnabled,
    IS_MOBILE = UIS.TouchEnabled and not UIS.KeyboardEnabled,
    phoneGuiScale = 0.72,
    phoneButtonsScale = 0.86,
    mobileButtonPositions = {},
    mobileButtonRefs = {},
    floatingFreeButtonPositions = {},
    CONFIG_FILE = CONFIG_FILE,
    _floatingButtons = {},
    BAT_HIT_RANGE = 16,
    _holdJumpCooldownUntil = 0,
    holdJumpPressed = false,
    holdJumpActive = false,
    _youtResetInProgress = false,
    antiFlingEnabled = false, setAntiFlingVisual = nil,
    bodyLockEnabled = false, bodyLockRange = 20, bodyLockConnection = nil, bodyLockSetVisual = nil,
    currentAnimPack = "Off", originalAnimPack = nil, animPackConnection = nil, animSelectorLabel = nil,
    antiLagEnabled = false, setAntiLagVisual = nil,
    vividGraphicsEnabled = false, vividEffects = {},
    skyTheme = "Off", skySelectorLabel = nil,
    krobloxMode = "Off", krobloxSelectorLabel = nil,
    stretchEnabled = false, stretchFOV = 120,
    origFOV = nil, stretchConn = nil, stretchFovConn = nil,
}

-- ===== PLAYER ESP (VX7 COMPOSITE: BOX + HIGHLIGHT + SPEED CARD + TRACERS) =====
PLAYER_ESP_COLOR = Color3.fromRGB(255, 255, 255)
PLAYER_ESP_FILL_TRANSPARENCY = 0.7
PLAYER_ESP_OUTLINE_TRANSPARENCY = 0.3
PLAYER_ESP_BIND_NAME = "DaHub_VX7_PlayerESP"

local function ensurePlayerESPGui()
    local cache = S.espPlayerCache
    if cache.screenGui and cache.screenGui.Parent then return cache.screenGui end
    local playerGui = LP:FindFirstChildOfClass("PlayerGui") or LP:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DaHub_VX7_PlayerESP"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 998
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.Parent = playerGui
    cache.screenGui = screenGui
    return screenGui
end

local function removeESPHighlight(playerData)
    if playerData and playerData.highlight then
        pcall(function() playerData.highlight:Destroy() end)
        playerData.highlight = nil
    end
end

local function disconnectESPConnection(playerData, name)
    local connection = playerData and playerData[name]
    if connection then
        pcall(function() connection:Disconnect() end)
        playerData[name] = nil
    end
end

local function removeESPForPlayer(player)
    local cache = S.espPlayerCache
    local data = cache and cache.players[player]
    if not data then return end
    disconnectESPConnection(data, "charConn")
    disconnectESPConnection(data, "charRemovingConn")
    removeESPHighlight(data)
    for _, key in ipairs({"box", "infoFrame", "tracer"}) do
        if data[key] then pcall(function() data[key]:Destroy() end); data[key] = nil end
    end
    data.speedLabel = nil
    data.nameLabel = nil
    cache.players[player] = nil
end

local function clearESP()
    local cache = S.espPlayerCache
    if not cache then return end
    local players = {}
    for player in pairs(cache.players) do table.insert(players, player) end
    for _, player in ipairs(players) do removeESPForPlayer(player) end
end

local function createESPBox(parent)
    local box = Instance.new("Frame")
    box.Name = "VX7_ESPBox2D"
    box.BackgroundColor3 = PLAYER_ESP_COLOR
    box.BackgroundTransparency = 0.75
    box.BorderSizePixel = 0
    box.Visible = false
    box.ZIndex = 2
    box.Parent = parent
    local stroke = Instance.new("UIStroke")
    stroke.Color = PLAYER_ESP_COLOR
    stroke.Thickness = 1.5
    stroke.Transparency = 0
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = box
    return box
end

local function createESPTracer(parent)
    local tracer = Instance.new("Frame")
    tracer.Name = "VX7_ESPTracer"
    tracer.AnchorPoint = Vector2.new(0.5, 0.5)
    tracer.BackgroundColor3 = PLAYER_ESP_COLOR
    tracer.BackgroundTransparency = 0.1
    tracer.BorderSizePixel = 0
    tracer.Visible = false
    tracer.ZIndex = 1
    tracer.Parent = parent
    local stroke = Instance.new("UIStroke", tracer)
    stroke.Color = Color3.fromRGB(20, 20, 24)
    stroke.Thickness = 0.75
    stroke.Transparency = 0.25
    return tracer
end

local function updateESPTracer(tracer, camera, root)
    if not tracer then return end
    tracer.Visible = false
    if not camera or not root then return end
    local target, onScreen = camera:WorldToViewportPoint(root.Position)
    if not onScreen or target.Z <= 0 then return end
    local viewport = camera.ViewportSize
    local originX, originY = viewport.X * 0.5, viewport.Y - 8
    local dx, dy = target.X - originX, target.Y - originY
    local length = math.sqrt(dx * dx + dy * dy)
    if length ~= length or length == math.huge or length < 1 then return end
    tracer.Position = UDim2.fromOffset((originX + target.X) * 0.5, (originY + target.Y) * 0.5)
    tracer.Size = UDim2.fromOffset(length, 2)
    tracer.Rotation = math.deg(math.atan2(dy, dx))
    tracer.BackgroundColor3 = PLAYER_ESP_COLOR
    tracer.Visible = true
end

local function createESPInfoCard(parent, player)
    local root = Instance.new("Frame")
    root.Name = "VX7_EI_" .. tostring(player.UserId)
    root.Size = UDim2.fromOffset(174, 59)
    root.AnchorPoint = Vector2.new(0.5, 1)
    root.BackgroundTransparency = 1
    root.BorderSizePixel = 0
    root.Visible = false
    root.Parent = parent

    local avatarBack = Instance.new("Frame")
    avatarBack.Size = UDim2.fromOffset(34, 34)
    avatarBack.Position = UDim2.fromOffset(8, 3)
    avatarBack.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
    avatarBack.BorderSizePixel = 0
    avatarBack.Parent = root
    Instance.new("UICorner", avatarBack).CornerRadius = UDim.new(1, 0)

    local avatar = Instance.new("ImageLabel")
    avatar.Name = "Avatar"
    avatar.Size = UDim2.new(1, -4, 1, -4)
    avatar.Position = UDim2.fromOffset(2, 2)
    avatar.BackgroundTransparency = 1
    avatar.ScaleType = Enum.ScaleType.Crop
    avatar.Parent = avatarBack
    Instance.new("UICorner", avatar).CornerRadius = UDim.new(1, 0)
    task.spawn(function()
        local ok, image = pcall(function()
            return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
        end)
        if ok and image and avatar.Parent then avatar.Image = image end
    end)

    local speed = Instance.new("TextLabel")
    speed.Name = "Speed"
    speed.Size = UDim2.new(1, 0, 0, 40)
    speed.Position = UDim2.new(0, 0, 0, 0)
    speed.BackgroundTransparency = 1
    speed.Text = "0.0"
    speed.TextColor3 = PLAYER_ESP_COLOR
    speed.Font = Enum.Font.GothamBlack
    speed.TextSize = 30
    speed.TextXAlignment = Enum.TextXAlignment.Center
    speed.TextYAlignment = Enum.TextYAlignment.Center
    speed.TextStrokeTransparency = 0
    speed.TextStrokeColor3 = Color3.fromRGB(20, 20, 24)
    speed.Parent = root

    local displayName = Instance.new("TextLabel")
    displayName.Name = "DisplayName"
    displayName.Size = UDim2.new(1, 0, 0, 17)
    displayName.Position = UDim2.new(0, 0, 0, 40)
    displayName.BackgroundTransparency = 1
    displayName.Text = player.DisplayName
    displayName.TextColor3 = PLAYER_ESP_COLOR
    displayName.Font = Enum.Font.GothamBold
    displayName.TextSize = 10
    displayName.TextXAlignment = Enum.TextXAlignment.Center
    displayName.TextStrokeTransparency = 0
    displayName.TextStrokeColor3 = Color3.fromRGB(20, 20, 24)
    displayName.Parent = root
    return root, speed, displayName
end

local function setPlayerESPCharacter(playerData, character)
    removeESPHighlight(playerData)
    if not S.espEnabled or not character or not character.Parent then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "VX7_ESPPlayer"
    highlight.Adornee = character
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillTransparency = PLAYER_ESP_FILL_TRANSPARENCY
    highlight.OutlineTransparency = PLAYER_ESP_OUTLINE_TRANSPARENCY
    highlight.FillColor = PLAYER_ESP_COLOR
    highlight.OutlineColor = PLAYER_ESP_COLOR
    pcall(function() highlight:SetAttribute("VX7ESP", true) end)
    highlight.Parent = character
    playerData.highlight = highlight
end

local function watchESPPlayer(player)
    if not player or player == LP then return end
    removeESPForPlayer(player)
    local cache = S.espPlayerCache
    local data = {lastSpeedText = nil}
    cache.players[player] = data
    local screenGui = ensurePlayerESPGui()
    data.box = createESPBox(screenGui)
    data.tracer = createESPTracer(screenGui)
    data.infoFrame, data.speedLabel, data.nameLabel = createESPInfoCard(screenGui, player)
    setPlayerESPCharacter(data, player.Character)

    data.charConn = player.CharacterAdded:Connect(function(character)
        task.delay(0.1, function()
            if S.espEnabled and cache.players[player] == data then
                setPlayerESPCharacter(data, character)
            end
        end)
    end)
    data.charRemovingConn = player.CharacterRemoving:Connect(function(character)
        if data.highlight and data.highlight.Adornee == character then removeESPHighlight(data) end
        if data.box then data.box.Visible = false end
        if data.infoFrame then data.infoFrame.Visible = false end
        if data.tracer then data.tracer.Visible = false end
    end)
end

local function updateESP(deltaTime)
    if not S.espEnabled then return end
    local cache = S.espPlayerCache
    local currentCamera = workspace.CurrentCamera
    if not currentCamera then
        for _, data in pairs(cache.players) do
            if data.tracer then data.tracer.Visible = false end
        end
        return
    end
    cache.infoAccumulator = (cache.infoAccumulator or 0) + (deltaTime or 1 / 60)
    local updateInfo = cache.infoAccumulator >= 1 / 30
    if updateInfo then cache.infoAccumulator = 0 end

    for player, data in pairs(cache.players) do
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local head = character and character:FindFirstChild("Head")
        if character and humanoid and humanoid.Health > 0 and root then
            updateESPTracer(data.tracer, currentCamera, root)
            local headPos = (head and head.Position or root.Position + Vector3.new(0, 1, 0)) + Vector3.new(0, 1.6, 0)
            local footPos = root.Position - Vector3.new(0, 3, 0)
            local topScreen, topOnScreen = currentCamera:WorldToViewportPoint(headPos)
            local bottomScreen, bottomOnScreen = currentCamera:WorldToViewportPoint(footPos)
            if data.box and topOnScreen and bottomOnScreen and topScreen.Z > 0 and bottomScreen.Z > 0 then
                local height = math.abs(bottomScreen.Y - topScreen.Y)
                local width = height * 0.55
                if height == height and width == width and height > 0 then
                    data.box.Size = UDim2.fromOffset(width, height)
                    data.box.Position = UDim2.fromOffset((topScreen.X + bottomScreen.X) * 0.5 - width * 0.5, math.min(topScreen.Y, bottomScreen.Y))
                    data.box.Visible = true
                else
                    data.box.Visible = false
                end
            elseif data.box then
                data.box.Visible = false
            end

            if updateInfo and data.infoFrame and data.speedLabel then
                local cardPos, onScreen = currentCamera:WorldToViewportPoint(root.Position + Vector3.new(0, 3.45, 0))
                if onScreen and cardPos.Z > 0 then
                    data.infoFrame.Position = UDim2.fromOffset(cardPos.X, cardPos.Y)
                    data.infoFrame.Visible = true
                    local velocity = root.AssemblyLinearVelocity
                    local speedText = tostring(math.floor(Vector3.new(velocity.X, 0, velocity.Z).Magnitude * 10 + 0.5) / 10)
                    if data.lastSpeedText ~= speedText then
                        data.lastSpeedText = speedText
                        data.speedLabel.Text = speedText
                    end
                    data.speedLabel.TextColor3 = PLAYER_ESP_COLOR
                else
                    data.infoFrame.Visible = false
                end
            end
            local highlight = data.highlight
            if (not highlight or not highlight.Parent or highlight.Adornee ~= character) and S.espEnabled then
                setPlayerESPCharacter(data, character)
            elseif highlight then
                if highlight.FillColor ~= PLAYER_ESP_COLOR then highlight.FillColor = PLAYER_ESP_COLOR end
                if highlight.OutlineColor ~= PLAYER_ESP_COLOR then highlight.OutlineColor = PLAYER_ESP_COLOR end
            end
        else
            if data.box then data.box.Visible = false end
            if data.infoFrame then data.infoFrame.Visible = false end
            if data.highlight then removeESPHighlight(data) end
            if data.tracer then data.tracer.Visible = false end
        end
    end
end

local function stopESPLoop()
    S.espEnabled = false
    local cache = S.espPlayerCache
    if not cache then return end
    for _, name in ipairs({"addConn", "remConn", "renderConn"}) do
        local connection = cache[name]
        if connection then pcall(function() connection:Disconnect() end); cache[name] = nil end
    end
    if cache.renderBound then
        pcall(function() RunService:UnbindFromRenderStep(PLAYER_ESP_BIND_NAME) end)
        cache.renderBound = false
    end
    clearESP()
    if cache.screenGui then
        pcall(function() cache.screenGui:Destroy() end)
        cache.screenGui = nil
    end
    cache.infoAccumulator = 0
end

local function startESPLoop()
    stopESPLoop()
    S.espEnabled = true
    local cache = S.espPlayerCache
    ensurePlayerESPGui()
    for _, player in ipairs(Players:GetPlayers()) do watchESPPlayer(player) end
    cache.addConn = Players.PlayerAdded:Connect(watchESPPlayer)
    cache.remConn = Players.PlayerRemoving:Connect(removeESPForPlayer)
    local bindOk = pcall(function()
        RunService:BindToRenderStep(PLAYER_ESP_BIND_NAME, Enum.RenderPriority.Camera.Value + 2, updateESP)
    end)
    if bindOk then
        cache.renderBound = true
    else
        cache.renderConn = RunService.RenderStepped:Connect(updateESP)
    end
end

local function toggleESP(on)
    if on then startESPLoop() else stopESPLoop() end
end

SWING_COOLDOWN = 0.25
AUTO_BAT_SPEED, AUTO_BAT_VERT_SPEED, AUTO_BAT_DIST, AUTO_BAT_HEIGHT, AUTO_BAT_V_OFF, AUTO_BAT_TURN_SPEED, AUTO_BAT_MAX_TURN_RATE =
    58, 52, 0.15, 0.35, 0.65, 285, 28

S.ui = function(pcVal, mobVal) return S.IS_MOBILE and mobVal or pcVal end
local function applyPhoneGuiScale(frame, scaleValue, storeKey)
    if not frame then return end
    local scaleObj = frame:FindFirstChild("DaHubPhoneScale")
    if not scaleObj then
        scaleObj = Instance.new("UIScale")
        scaleObj.Name = "DaHubPhoneScale"
        scaleObj.Parent = frame
    end
    scaleObj.Scale = S.IS_TOUCH_DEVICE and scaleValue or 1
    if storeKey then
        S[storeKey] = scaleObj
    end
end
S.getActiveSpeed = function()
    if S.laggerMode == 1 then return S.LS
    elseif S.laggerMode == 2 then return S.LCS
    elseif S.speedMode then return S.CS
    else return S.NS
    end
end
S.getSpeedModeName = function()
    if S.laggerMode == 1 then return "Lagger Normal Speed" end
    if S.laggerMode == 2 then return "Lagger Carry Speed" end
    return S.speedMode and "Carry" or "Normal"
end
S.getAutoPathSpeed = function()
    if S.laggerMode == 1 then return S.LS
    elseif S.laggerMode == 2 then return S.LCS
    else return S.NS end
end

local function isSpeedRagdollState(hum)
    if not hum then return true end
    local st = hum:GetState()
    return hum.PlatformStand
        or st == Enum.HumanoidStateType.Physics
        or st == Enum.HumanoidStateType.Ragdoll
        or st == Enum.HumanoidStateType.FallingDown
end

-- VX7's original speed core: obstacle resolution, step assist, spoof hooks and LV sync.
S._vxSpeedMotion =
	{ smoothed = Vector2.zero, lastMagnitude = 0, stepToken = 0, stepTarget = nil, stepExpires = 0, root = nil }
S._unifiedMovementEnabled = S._unifiedMovementEnabled ~= false
S._vxSpeedCollisionParams = RaycastParams.new()
S._vxSpeedCollisionParams.FilterType = Enum.RaycastFilterType.Exclude
S._vxSpeedCollisionParams.IgnoreWater = true
pcall(function()
	S._vxSpeedCollisionParams.RespectCanCollide = true
end)
function S._vxSpeedPulseVertical(parent, arg, lineVelocity, arg2)
	if not parent or not parent.Parent then
		return
	end
	local name, name2 = arg .. "Attachment", arg .. "LinearVelocity"
	local attachment = parent:FindFirstChild(name)
	if not attachment then
		attachment = Instance.new("Attachment")
		attachment.Name = name
		attachment.Parent = parent
	end
	local linearVelocity = parent:FindFirstChild(name2)
	if not linearVelocity then
		linearVelocity = Instance.new("LinearVelocity")
		linearVelocity.Name = name2
		linearVelocity.Attachment0 = attachment
		linearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
		linearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Line
		linearVelocity.LineDirection = Vector3.new(0, 1, 0)
		linearVelocity.ForceLimitsEnabled = false
		linearVelocity.Parent = parent
	end
	linearVelocity:SetAttribute("VX7Pulse", {} and (os.clock()) or 0)
	local attribute = linearVelocity:GetAttribute("VX7Pulse")
	linearVelocity.LineVelocity = lineVelocity or 0
	linearVelocity.Enabled = true
	task.delay(arg2 or 0.12, function()
		if not linearVelocity.Parent or linearVelocity:GetAttribute("VX7Pulse") ~= attribute then
			return
		end
		pcall(function()
			linearVelocity:Destroy()
		end)
		if attachment.Parent then
			pcall(function()
				attachment:Destroy()
			end)
		end
	end)
end
function S._vxSpeedCheckRoof(arg, arg2)
	if not arg or not arg.Parent or S._youtResetInProgress or S.dropBrainrotActive then
		return false
	end
	if S.batTpEnabled or S._smartBatTpDriving then
		return false
	end
	local n23 = math.max(arg.AssemblyLinearVelocity.Y, 0)
	if n23 <= 0.25 then
		return false
	end
	local vxSpeedCollisionParams = S._vxSpeedCollisionParams
	vxSpeedCollisionParams.FilterDescendantsInstances = { arg.Parent }
	local n24 = math.clamp(arg2 or 0.016666666666666666, 0.004166666666666667, 0.06666666666666667)
	if
		not workspace:Raycast(
			arg.Position,
			Vector3.new(0, 3.05 + math.min(n23 * n24, 0.9), 0),
			vxSpeedCollisionParams
		)
	then
		return false
	end
	S._vxSpeedClearStep(arg)
	S._vxSpeedPulseVertical(arg, "VX7VampireRoofGuard", 0, 0.14)
	return true
end
function S._vxSpeedClearStep(arg)
	local vxSpeedMotion = S._vxSpeedMotion
	vxSpeedMotion.stepToken = vxSpeedMotion.stepToken + 1
	vxSpeedMotion.stepTarget = nil
	vxSpeedMotion.stepExpires = 0
	if not arg then
		return
	end
	local vX7SpeedStepLinearVelocity = arg:FindFirstChild("VX7SpeedStepLinearVelocity")
	if vX7SpeedStepLinearVelocity then
		pcall(function()
			vX7SpeedStepLinearVelocity:Destroy()
		end)
	end
	local vX7SpeedStepAttachment = arg:FindFirstChild("VX7SpeedStepAttachment")
	if vX7SpeedStepAttachment then
		pcall(function()
			vX7SpeedStepAttachment:Destroy()
		end)
	end
end
function S._vxSpeedRequestStep(root, stepTarget)
	if not root or not root.Parent or not stepTarget or stepTarget <= root.Position.Y + 0.05 then
		return
	end
	local vxSpeedMotion, now3 = S._vxSpeedMotion, os.clock()
	if vxSpeedMotion.stepTarget and vxSpeedMotion.root == root and now3 < vxSpeedMotion.stepExpires then
		vxSpeedMotion.stepTarget = math.max(vxSpeedMotion.stepTarget, stepTarget)
		vxSpeedMotion.stepExpires = math.max(vxSpeedMotion.stepExpires, now3 + 0.32)
		return
	end
	S._vxSpeedClearStep(root)
	vxSpeedMotion.root = root
	vxSpeedMotion.stepTarget = stepTarget
	vxSpeedMotion.stepExpires = now3 + 0.32
	local stepToken = vxSpeedMotion.stepToken
	task.spawn(function()
		while
			vxSpeedMotion.stepToken == stepToken
			and root.Parent
			and root.Parent == LP.Character
			and os.clock() < vxSpeedMotion.stepExpires
		do
			local n23 = (vxSpeedMotion.stepTarget or root.Position.Y) - root.Position.Y
			if n23 <= 0.05 then
				break
			end
			S._vxSpeedCollisionParams.FilterDescendantsInstances = { root.Parent }
			if
				workspace:Raycast(
					root.Position,
					Vector3.new(0, 3.05 + math.min(n23, 2.35), 0),
					S._vxSpeedCollisionParams
				)
			then
				break
			end
			local vX7SpeedStepAttachment = root:FindFirstChild("VX7SpeedStepAttachment")
			if not vX7SpeedStepAttachment then
				vX7SpeedStepAttachment = Instance.new("Attachment")
				vX7SpeedStepAttachment.Name = "VX7SpeedStepAttachment"
				vX7SpeedStepAttachment.Parent = root
			end
			local vX7SpeedStepLinearVelocity = root:FindFirstChild("VX7SpeedStepLinearVelocity")
			if not vX7SpeedStepLinearVelocity then
				vX7SpeedStepLinearVelocity = Instance.new("LinearVelocity")
				vX7SpeedStepLinearVelocity.Name = "VX7SpeedStepLinearVelocity"
				vX7SpeedStepLinearVelocity.Attachment0 = vX7SpeedStepAttachment
				vX7SpeedStepLinearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
				vX7SpeedStepLinearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Line
				vX7SpeedStepLinearVelocity.LineDirection = Vector3.new(0, 1, 0)
				vX7SpeedStepLinearVelocity.ForceLimitsEnabled = false
				vX7SpeedStepLinearVelocity.Parent = root
			end
			vX7SpeedStepLinearVelocity.LineVelocity = math.clamp(n23 * 11, 7, 17)
			vX7SpeedStepLinearVelocity.Enabled = true
			RunService.Heartbeat:Wait()
		end
		if vxSpeedMotion.stepToken == stepToken then
			S._vxSpeedClearStep(root)
		end
	end)
end
function S._vxSpeedWalkableStep(arg, arg2, arg3, arg4, arg5)
	if not arg2 or not arg or not arg.Parent or not arg3 or arg3.Magnitude < 0.01 then
		return false
	end
	local vxSpeedCollisionParams = S._vxSpeedCollisionParams
	vxSpeedCollisionParams.FilterDescendantsInstances = { arg.Parent }
	local hit = workspace:Raycast(arg.Position, Vector3.new(0, -7, 0), vxSpeedCollisionParams)
	if not hit or hit.Normal.Y < 0.45 then
		return false
	end
	local n23, n24 =
		math.clamp((arg2.HipHeight or 2) + 0.25, 1.35, 2.35),
		arg.Position + arg3.Unit * (arg5 + math.min(arg4, 0.65) + 0.08)
	arg3 = workspace:Raycast(
		Vector3.new(n24.X, hit.Position.Y + n23 + 0.25, n24.Z),
		Vector3.new(0, -n23 - 0.45, 0),
		vxSpeedCollisionParams
	)
	if not arg3 or arg3.Normal.Y < 0.55 then
		return false
	end
	n24 = arg3.Position.Y - hit.Position.Y
	if n24 > 0.05 and n24 <= n23 then
		return true, arg3.Position.Y + (arg2.HipHeight or 2) + arg.Size.Y * 0.5 + 0.06
	end
	return false
end
function S._vxSpeedResolveHorizontal(arg, arg2, arg3, arg4)
	local vector = Vector3.new(arg3.X, 0, arg3.Z)
	if vector.Magnitude < 0.01 then
		return vector, false, false
	end
	local vxSpeedCollisionParams = S._vxSpeedCollisionParams
	vxSpeedCollisionParams.FilterDescendantsInstances = { arg.Parent }
	local magnitude, n23, n24 =
		vector.Magnitude,
		math.clamp(
			math.max(arg4 or 0.016666666666666666, 0.011111111111111112),
			0.011111111111111112,
			0.06666666666666667
		),
		math.clamp(math.max(arg.Size.X, arg.Size.Z) * 0.5, 0.9, 1)
	arg3, arg4 = S._vxSpeedWalkableStep(arg, arg2, vector, vector.Magnitude * n23, n24)
	if arg3 then
		S._vxSpeedRequestStep(arg, arg4)
	end
	arg3, arg4 = false
	local flag15 = false
	for i = 1, 2, 1 do
		if vector.Magnitude < 0.02 then
			break
		end
		local n25, hit = vector.Magnitude * n23
		if
			not pcall(function()
				hit =
					workspace:Spherecast(arg.Position, n24, vector.Unit * (n25 + 0.03), vxSpeedCollisionParams)
			end)
		then
			hit = workspace:Raycast(arg.Position, vector.Unit * (n25 + n24 + 0.03), vxSpeedCollisionParams)
		end
		if not hit then
			break
		end
		i = math.cos(math.rad(math.clamp(arg2 and arg2.MaxSlopeAngle or 45, 0, 89)))
		if hit.Normal.Y >= i then
			break
		end
		local v45, vector2 = S._vxSpeedWalkableStep(arg, arg2, vector, n25, n24)
		if v45 then
			S._vxSpeedRequestStep(arg, vector2)
			break
		end
		vector2 = Vector3.new(hit.Normal.X, 0, hit.Normal.Z)
		if vector2.Magnitude < 0.05 then
			break
		end
		vector2 = vector2.Unit
		i = vector:Dot(vector2)
		if i >= 0 then
			break
		end
		arg3 = true
		v45 = vector
		if arg4 and arg4:Dot(vector2) < 0.55 then
			vector, flag15 = Vector3.zero, true
			break
		end
		arg4 = arg4 or vector2
		local n26, n27 = v45 - vector2 * i, math.max((hit.Distance or 0) - 0.03, 0)
		vector = n26 - vector2 * math.min(-i, n27 / n23)
	end
	if vector.Magnitude < 0.04 then
		vector = Vector3.zero
	end
	if vector.Magnitude > magnitude then
		vector = vector.Unit * magnitude
	end
	return vector, arg3, flag15
end

		_G.fakeVelocity = Vector3.zero
		_G.spoofedVelocity = _G.fakeVelocity
		fakeVelocity = _G.fakeVelocity
		spoofedVelocity = _G.fakeVelocity
		S._vx7SpoofedVelocity = _G.fakeVelocity
		local humanoidRootPart2, humanoid2
		local function fn86(character2)
			if not character2 then
				humanoidRootPart2, humanoid2 = nil, nil
				S._vxCachedRoot = nil
				S._vxCachedHum = nil
				return
			end
			local ok, result = pcall(character2.WaitForChild, character2, "HumanoidRootPart", 5)
			humanoidRootPart2 = ok and result or (character2:FindFirstChild("HumanoidRootPart"))
			ok, result = pcall(character2.WaitForChild, character2, "Humanoid", 5)
			humanoid2 = ok and result or (character2:FindFirstChildOfClass("Humanoid"))
			S._vxCachedRoot = humanoidRootPart2
			S._vxCachedHum = humanoid2
		end
		if LP.Character then
			task.spawn(fn86, LP.Character)
		end
		LP.CharacterAdded:Connect(fn86)
		LP.CharacterRemoving:Connect(function()
			humanoidRootPart2, humanoid2 = nil, nil
			S._vxCachedRoot = nil
			S._vxCachedHum = nil
		end)
		S._vx7Hooked = false
		function S._vx7SetupHooks()
			if S._vx7Hooked then
				return
			end
			local v45 = getrawmetatable and (getrawmetatable(game))
			if not v45 or type(v45) ~= "table" or not newcclosure then
				return
			end
			local v46, v47 = setreadonly or make_writeable, isreadonly or iswriteable
			S._vx7Hooked = pcall(function()
				if v47 and (v47(v45)) and v46 then
					v46(v45, false)
				elseif v46 then
					v46(v45, false)
				end
				local index, newindex = v45.__index, v45.__newindex
				v45.__index = newcclosure(function(arg, arg2)
					if
						(arg2 == "AssemblyLinearVelocity" or arg2 == "Velocity")
						and not checkcaller()
						and (rawequal(arg, humanoidRootPart2))
					then
						return _G.fakeVelocity
					end
					return index(arg, arg2)
				end)
				v45.__newindex = newcclosure(function(arg, arg2, fakeVelocity_)
					if
						(arg2 == "AssemblyLinearVelocity" or arg2 == "Velocity")
						and not checkcaller()
						and (rawequal(arg, humanoidRootPart2))
					then
						_G.fakeVelocity = fakeVelocity_
						fakeVelocity = fakeVelocity_
						_G.spoofedVelocity = fakeVelocity_
						spoofedVelocity = fakeVelocity_
						S._vx7SpoofedVelocity = fakeVelocity_
						return
					end
					return newindex(arg, arg2, fakeVelocity_)
				end)
				if v46 then
					v46(v45, true)
				end
			end)
		end
		function S._vxSyncSpoof(fakeVelocity_)
			_G.fakeVelocity = fakeVelocity_
			fakeVelocity = fakeVelocity_
			_G.spoofedVelocity = fakeVelocity_
			spoofedVelocity = fakeVelocity_
			S._vx7SpoofedVelocity = fakeVelocity_
		end
		task.spawn(function()
			pcall(S._vx7SetupHooks)
			task.wait(1)
			pcall(S._vx7SetupHooks)
		end)
		local function ensureLV(root)
			pcall(S._vx7SetupHooks)
			S._vxSpeedMotion.root = root
			if S._vxSyncSpoof then
				S._vxSyncSpoof(
					Vector3.new(
						root.AssemblyLinearVelocity.X,
						root.AssemblyLinearVelocity.Y,
						root.AssemblyLinearVelocity.Z
					)
				)
			end
		end
		local function setLV(arg, arg2, arg3, arg4)
			if not arg or not arg.Parent then
				return
			end
			ensureLV(arg)
			local y, vector = arg.AssemblyLinearVelocity.Y, Vector3.new(arg2 or 0, 0, arg3 or 0)
			arg4 = if S._unifiedLastJumpTime and os.clock() - S._unifiedLastJumpTime < 0.15
				then 0
				else if math.abs(y) > 20 then (math.clamp(y, -20, 20)) else y
			if vector.Magnitude > 0.05 then
				arg3, arg2 = math.min(vector.Magnitude, 16), vector.Unit
				if S._vxSyncSpoof then
					S._vxSyncSpoof(Vector3.new(arg2.X * arg3, arg4, arg2.Z * arg3))
				end
				arg.AssemblyLinearVelocity = Vector3.new(vector.X, y, vector.Z)
			elseif S._vxSyncSpoof then
				S._vxSyncSpoof(Vector3.new(0, arg4, 0))
			end
		end
		local function clearLV()
			local root = S._vxSpeedMotion.root
			if S._vxSpeedClearStep then
				S._vxSpeedClearStep(root)
			end
			if S._vxSyncSpoof then
				S._vxSyncSpoof(Vector3.zero)
			end
			S._vxSpeedMotion.smoothed = Vector2.zero
			S._vxSpeedMotion.lastMagnitude = 0
			S._vxSpeedMotion.root = nil
		end
LP.CharacterRemoving:Connect(clearLV)
S._vxClearSpeedVelocity = clearLV
S._vxSetSpeedVelocity = setLV

S._unifiedResolveSpeed = function()
    local ok, speed = pcall(S.getActiveSpeed)
    if ok and type(speed) == "number" then return speed end
    return tonumber(S.NS) or 16
end

saveConfig = nil
updateFloatingButtons = nil

-- Función central para actualizar el botón flotante de Lagger
local function updateLaggerButtonVisual()
    local fb = S._floatingButtons
    if not fb.lagger then return end
    local active = S.laggerMode ~= 0 and not S.speedMode
    fb.l2Lagger.Text = ""
    S._setPButtonActive(fb.lagger, fb.strokeLagger, fb.l1Lagger, fb.l2Lagger, active)
end

S.refreshSpeedModeLabel = function()
    if S.speedClk then S.speedClk(S.speedMode and S.laggerMode == 0) end
    if S.setLaggerVisual then S.setLaggerVisual(S.laggerMode ~= 0) end
    updateLaggerButtonVisual()
    if updateFloatingButtons then updateFloatingButtons() end
end

S.applySpeedVelocityNow = function(deltaTime)
    if S._youtResetInProgress or S.batBypassEnabled then return end
    local char = LP.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not char or not hum or not root or hum.Health <= 0 then return end
    if S._vxSpeedCheckRoof and S._vxSpeedCheckRoof(root, deltaTime or 1 / 60) then
        setLV(root, 0, 0, deltaTime)
        return
    end
    local direction = hum.MoveDirection
    if direction.Magnitude > 0.05 then
        direction = Vector3.new(direction.X, 0, direction.Z)
        local magnitude = direction.Magnitude
        if magnitude > 0.001 then
            direction = direction.Unit
            S.lastMoveDir = direction
            pcall(function() if root.SetNetworkOwner then root:SetNetworkOwner(LP) end end)
            local horizontal = Vector3.new(direction.X * S._unifiedResolveSpeed(), 0, direction.Z * S._unifiedResolveSpeed())
            if S._vxSpeedResolveHorizontal then
                local ok, result = pcall(S._vxSpeedResolveHorizontal, root, hum, horizontal, deltaTime or 1 / 60)
                if ok and typeof(result) == "Vector3" then horizontal = result end
            end
            setLV(root, horizontal.X, horizontal.Z, deltaTime)
        else
            setLV(root, 0, 0, deltaTime)
        end
    else
        setLV(root, 0, 0, deltaTime)
    end
end

S.setNormalSpeedMode = function()
    S.laggerMode = 0
    S.speedMode = false
    S.refreshSpeedModeLabel()
    S.applySpeedVelocityNow()
end

S.setCarrySpeedMode = function()
    S.laggerMode = 0
    S.speedMode = true
    S.refreshSpeedModeLabel()
    S.applySpeedVelocityNow()
end

S.setLaggerNormalMode = function()
    S.speedMode = false
    S.laggerMode = 1
    S.refreshSpeedModeLabel()
    S.applySpeedVelocityNow()
end
S.setLaggerCarryMode = function()
    S.speedMode = false
    S.laggerMode = 2
    S.refreshSpeedModeLabel()
    S.applySpeedVelocityNow()
end

S.setLaggerOffMode = function()
    S.laggerMode = 0
    S.refreshSpeedModeLabel()
end

S.toggleCarryMode = function()
    if S.laggerMode ~= 0 then
        S.laggerMode = 0
        S.speedMode = true
    else
        S.speedMode = not S.speedMode
    end
    S.refreshSpeedModeLabel()
    S.applySpeedVelocityNow()
end

S.toggleLaggerMode = function()
    if S.laggerMode == 2 then
        S.setLaggerNormalMode()
    else
        S.setLaggerCarryMode()
    end
end

S.setupSpeedBillboard = function(char)
    local head = char and (char:FindFirstChild("Head") or char:WaitForChild("Head", 5))
    if not head then return end
    local oldBB = head:FindFirstChild("DaHubSpeedBB")
    if oldBB then oldBB:Destroy() end

    -- Colores tomados del indicador sobre la cabeza de Ace Duels (tema 2):
    -- pale 210,218,228 -> accent 104,116,132 -> accent2 156,169,186.
    local bb = Instance.new("BillboardGui", head)
    bb.Name = "DaHubSpeedBB"
    bb.Size = UDim2.fromOffset(118, 36)
    bb.StudsOffset = Vector3.new(0, 1.75, 0)
    bb.AlwaysOnTop = true
    bb.ResetOnSpawn = false
    bb.LightInfluence = 0
    bb.MaxDistance = 150

    local function addAceGradient(label)
        local gradient = Instance.new("UIGradient", label)
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(235, 235, 235)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 170, 170)),
        })
        return gradient
    end

    local discordLbl = Instance.new("TextLabel", bb)
    discordLbl.Name = "DiscordBillLbl"
    discordLbl.Size = UDim2.new(1, 0, 0.46, 0)
    discordLbl.BackgroundTransparency = 1
    discordLbl.Text = "DONA.VS"
    discordLbl.Font = Enum.Font.GothamBlack
    discordLbl.TextScaled = true
    discordLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    discordLbl.TextStrokeTransparency = 0
    discordLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    local discordSize = Instance.new("UITextSizeConstraint", discordLbl)
    discordSize.MinTextSize = 4
    discordSize.MaxTextSize = 12
    DaHubBrandStyle.apply(discordLbl)

    local speedLbl = Instance.new("TextLabel", bb)
    speedLbl.Name = "SpeedBillLbl"
    speedLbl.Size = UDim2.new(1, 0, 0.46, 0)
    speedLbl.Position = UDim2.new(0, 0, 0.54, 0)
    speedLbl.BackgroundTransparency = 1
    speedLbl.Text = "Speed: 0"
    speedLbl.Font = Enum.Font.GothamBlack
    speedLbl.TextScaled = true
    speedLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedLbl.TextStrokeTransparency = 0
    speedLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    local speedSize = Instance.new("UITextSizeConstraint", speedLbl)
    speedSize.MinTextSize = 4
    speedSize.MaxTextSize = 12
    addAceGradient(speedLbl)

    S.speedDiscordLabel = discordLbl
    S.speedCounterLabel = speedLbl
end

local function updateSpeedBillboard(hrp)
    if not S.speedCounterLabel then return end
    local now = os.clock()
    if now - S.speedLabelLastUpdate >= 0.12 then
        S.speedLabelLastUpdate = now
        local v = hrp.Velocity
        local flatSpeed = math.sqrt((v.X * v.X) + (v.Z * v.Z))
        S.speedCounterLabel.Text = string.format("Speed: %.1f", flatSpeed)
    end
end


-- Ragdoll Timer tomado únicamente de Ace Duels.
-- Es independiente del indicador de Discord/Speed de DaHub.
daHubRagdollTimer = {
    billboard = nil,
    label = nil,
    character = nil,
    active = false,
    startTime = 0,
    endTime = 0,
    goUntil = 0,
    wasRagdolled = false,
    duration = 2.6,
    connection = nil,
}

local function setupDaHubRagdollTimer(char)
    local head = char and (char:FindFirstChild("Head") or char:WaitForChild("Head", 5))
    if not head then return end
    local old = head:FindFirstChild("DaHubRagdollTimerBB")
    if old then old:Destroy() end
    if daHubRagdollTimer.connection then
        pcall(function() daHubRagdollTimer.connection:Disconnect() end)
        daHubRagdollTimer.connection = nil
    end
    local bb = Instance.new("BillboardGui", head)
    bb.Name = "DaHubRagdollTimerBB"
    bb.Size = UDim2.fromOffset(112, 28)
    bb.StudsOffset = Vector3.new(0, 4.45, 0)
    bb.AlwaysOnTop = true
    bb.ResetOnSpawn = false
    bb.LightInfluence = 0
    bb.MaxDistance = 150
    local label = Instance.new("TextLabel", bb)
    label.Name = "RagdollTimerLabel"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = ""
    label.Font = Enum.Font.GothamBlack
    label.TextScaled = true
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    local sizeConstraint = Instance.new("UITextSizeConstraint", label)
    sizeConstraint.MinTextSize = 4
    sizeConstraint.MaxTextSize = 17
    local gradient = Instance.new("UIGradient", label)
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(235, 235, 235)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 170, 170)),
    })
    daHubRagdollTimer.billboard = bb
    daHubRagdollTimer.label = label
    daHubRagdollTimer.character = char
    daHubRagdollTimer.active = false
    daHubRagdollTimer.startTime = 0
    daHubRagdollTimer.endTime = 0
    daHubRagdollTimer.goUntil = 0
    daHubRagdollTimer.wasRagdolled = false

    local function isRagdolled(humanoid)
        if not humanoid then return false end
        local state = humanoid:GetState()
        return humanoid.PlatformStand
            or state == Enum.HumanoidStateType.Physics
            or state == Enum.HumanoidStateType.Ragdoll
            or state == Enum.HumanoidStateType.FallingDown
    end

    daHubRagdollTimer.connection = RunService.Heartbeat:Connect(function()
        if daHubRagdollTimer.character ~= char or not bb.Parent or not label.Parent then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then
            label.Text = ""
            daHubRagdollTimer.active = false
            return
        end
        local now = os.clock()
        local ragdolled = isRagdolled(humanoid)
        if ragdolled and not daHubRagdollTimer.wasRagdolled and not daHubRagdollTimer.active and daHubRagdollTimer.goUntil <= now then
            daHubRagdollTimer.active = true
            daHubRagdollTimer.startTime = now
            daHubRagdollTimer.endTime = now + daHubRagdollTimer.duration
            label.Text = string.format("%.1f", daHubRagdollTimer.duration)
        end
        if daHubRagdollTimer.active then
            local remaining = daHubRagdollTimer.endTime - now
            if remaining <= 0 then
                daHubRagdollTimer.active = false
                daHubRagdollTimer.goUntil = now + 0.65
                label.Text = "GO"
            else
                label.Text = string.format("%.1f", remaining)
            end
        elseif daHubRagdollTimer.goUntil > now then
            label.Text = "GO"
        else
            label.Text = ""
        end
        daHubRagdollTimer.wasRagdolled = ragdolled
    end)
end

-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Forward declarations used by features defined later in the script.
startAntiRagdoll, stopAntiRagdoll = nil, nil
startBatCounter, stopBatCounter = nil, nil
setBatAimbot = nil
triggerBatCounter = nil
stopDropBrainrot = nil
startAutoLeft, stopAutoLeft, startAutoRight, stopAutoRight = nil, nil, nil, nil

-- Instant Reset adapted from Ace Duels.
-- Uses Ace's pulse/queue/camera flow and DaHub's local guard APIs.
aceInstaResetState = _G._AceInstaResetState or {}
_G._AceInstaResetState = aceInstaResetState

for _, connection in ipairs(aceInstaResetState.connections or {}) do
    pcall(function() connection:Disconnect() end)
end
if aceInstaResetState.cameraConnection then
    pcall(function() aceInstaResetState.cameraConnection:Disconnect() end)
end
aceInstaResetState.connections = {}
aceInstaResetState.cameraConnection = nil
aceInstaResetState.busy = false
aceInstaResetState.busyAt = 0
aceInstaResetState.queued = false
aceInstaResetState.queuedUntil = 0
aceInstaResetState.token = 0
aceInstaResetState.cameraHeld = false
aceInstaResetState.cameraHeldAt = 0
aceInstaResetState.suspended = nil
aceInstaResetState.speed = tonumber(aceInstaResetState.speed) or 1000000

resetHeartbeat = RunService.PreSimulation or RunService.Heartbeat
local function registerResetConnection(connection)
    table.insert(aceInstaResetState.connections, connection)
    return connection
end

local function suspendDaHubGuards()
    local state = {antiRagdoll = false, batCounter = false, batAimbot = false, autoLeft = false, autoRight = false, movement = false}
    if S.antiRagdollEnabled then
        state.antiRagdoll = true
        S.antiRagdollEnabled = false
        if stopAntiRagdoll then pcall(stopAntiRagdoll) end
        if S.setAntiRagVisual then pcall(S.setAntiRagVisual, false) end
    end
    if S.batCounterEnabled then
        state.batCounter = true
        S.batCounterEnabled = false
        if stopBatCounter then pcall(stopBatCounter) end
        if S.setBatCounterVisual then pcall(S.setBatCounterVisual, false) end
    end
    if S.batBypassEnabled and S.setBatBypass then
        state.batBypass = true
        S.setBatBypass(false)
    end
    if S.batAimbotEnabled then
        state.batAimbot = true
        if setBatAimbot then pcall(setBatAimbot, false) end
    end
    if S.autoLeftEnabled then state.autoLeft = true end
    if S.autoRightEnabled then state.autoRight = true end
    if S.moveConn then state.movement = true end
    if state.autoLeft then
        S.autoLeftEnabled = false
        if stopAutoLeft then pcall(stopAutoLeft) end
        if S.autoLeftSetVisual then pcall(S.autoLeftSetVisual, false) end
    end
    if state.autoRight then
        S.autoRightEnabled = false
        if stopAutoRight then pcall(stopAutoRight) end
        if S.autoRightSetVisual then pcall(S.autoRightSetVisual, false) end
    end
    if S.dropBrainrotActive and stopDropBrainrot then pcall(stopDropBrainrot) end
    if S.stopMovement then pcall(S.stopMovement) end
    S._unifiedGamepadHeld = false
    S._unifiedTouchHeld = false
    S.holdJumpPressed = false
    S.holdJumpActive = false
    aceInstaResetState.suspended = state
    return state
end

local function restoreDaHubGuards(state)
    state = state or aceInstaResetState.suspended or {}
    aceInstaResetState.suspended = nil
    if state.antiRagdoll then
        S.antiRagdollEnabled = true
        if startAntiRagdoll then pcall(startAntiRagdoll) end
        if S.setAntiRagVisual then pcall(S.setAntiRagVisual, true) end
    end
    if state.batCounter then
        S.batCounterEnabled = true
        if startBatCounter then pcall(startBatCounter) end
        if S.setBatCounterVisual then pcall(S.setBatCounterVisual, true) end
    end
    if state.batBypass and S.setBatBypass then pcall(S.setBatBypass, true) end
    if state.batAimbot and setBatAimbot then pcall(setBatAimbot, true) end
    if state.autoLeft then
        S.autoLeftEnabled = true
        if startAutoLeft then pcall(startAutoLeft) end
        if S.autoLeftSetVisual then pcall(S.autoLeftSetVisual, true) end
    end
    if state.autoRight then
        S.autoRightEnabled = true
        if startAutoRight then pcall(startAutoRight) end
        if S.autoRightSetVisual then pcall(S.autoRightSetVisual, true) end
    end
    if state.movement and S.startMovement then pcall(S.startMovement) end
    if updateFloatingButtons then pcall(updateFloatingButtons) end
    if saveConfig then pcall(saveConfig) end
end

local function holdResetCamera(oldCharacter)
    local currentCamera = workspace.CurrentCamera
    if not currentCamera then return end
    if aceInstaResetState.cameraHeld and (os.clock() - (aceInstaResetState.cameraHeldAt or 0)) < 5 then return end
    aceInstaResetState.cameraHeld = true
    aceInstaResetState.cameraHeldAt = os.clock()
    local heldCFrame, heldFocus = currentCamera.CFrame, currentCamera.Focus
    pcall(function()
        currentCamera.CameraType = Enum.CameraType.Scriptable
        currentCamera.CFrame = heldCFrame
        currentCamera.Focus = heldFocus
    end)
    aceInstaResetState.cameraConnection = RunService.RenderStepped:Connect(function()
        if workspace.CurrentCamera ~= currentCamera then return end
        pcall(function()
            currentCamera.CameraType = Enum.CameraType.Scriptable
            currentCamera.CFrame = heldCFrame
            currentCamera.Focus = heldFocus
        end)
    end)
    task.spawn(function()
        local elapsed = 0
        while LP.Character == oldCharacter and elapsed < 3 do elapsed += task.wait() end
        if aceInstaResetState.cameraConnection then
            pcall(function() aceInstaResetState.cameraConnection:Disconnect() end)
            aceInstaResetState.cameraConnection = nil
        end
        local newCharacter = LP.Character
        aceInstaResetState.cameraHeld = false
        local newCamera = workspace.CurrentCamera or currentCamera
        if newCamera then
            pcall(function()
                newCamera.CameraType = Enum.CameraType.Custom
                local humanoid = newCharacter and newCharacter:FindFirstChildOfClass("Humanoid")
                if humanoid then newCamera.CameraSubject = humanoid end
            end)
        end
    end)
end

local function releaseResetCamera()
    if aceInstaResetState.cameraConnection then
        pcall(function() aceInstaResetState.cameraConnection:Disconnect() end)
        aceInstaResetState.cameraConnection = nil
    end
    aceInstaResetState.cameraHeld = false
end

local function aceFlingUp(character)
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not (root and root:IsA("BasePart")) then return false end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        pcall(function()
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
            humanoid.BreakJointsOnDeath = true
            humanoid.PlatformStand = true
            humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end)
    end
    local velocity = Vector3.new(0, math.clamp(aceInstaResetState.speed, 1000, 10000000), 0)
    local function pulse()
        if not root.Parent then return false end
        return pcall(function()
            root.AssemblyAngularVelocity = Vector3.zero
            root.AssemblyLinearVelocity = velocity
        end)
    end
    if not pulse() then return false end
    task.spawn(function()
        local elapsed = 0
        while elapsed < 1.2 do
            elapsed += resetHeartbeat:Wait()
            if not root.Parent or LP.Character ~= character then return end
            pulse()
        end
    end)
    return true
end

local function aceHardKill(character)
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    pcall(function()
        humanoid.PlatformStand = false
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid.BreakJointsOnDeath = true
        if humanoid.MaxHealth == math.huge or humanoid.MaxHealth <= 0 then humanoid.MaxHealth = 100 end
        humanoid.Health = 0
    end)
    pcall(function() character:BreakJoints() end)
end

local function aceInstantReset()
    local character = LP.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not (character and humanoid and root and root:IsA("BasePart")) then
        aceInstaResetState.queued = true
        aceInstaResetState.queuedUntil = os.clock() + 12
        return
    end
    if aceInstaResetState.busy and (os.clock() - (aceInstaResetState.busyAt or 0)) < 5 then return end
    aceInstaResetState.busy = true
    aceInstaResetState.busyAt = os.clock()
    aceInstaResetState.token += 1
    local token = aceInstaResetState.token
    S._youtResetInProgress = true
    local suspended = suspendDaHubGuards()
    task.spawn(function()
        pcall(function()
            holdResetCamera(character)
            if not aceFlingUp(character) then aceHardKill(character) end
            local elapsed = 0
            while LP.Character == character and elapsed < 1.2 do elapsed += task.wait() end
            if LP.Character == character then
                local currentHumanoid = character:FindFirstChildOfClass("Humanoid")
                if currentHumanoid and currentHumanoid.Health > 0 then aceHardKill(character) end
            end
            local waited = 0
            while LP.Character == character and waited < 8 do waited += task.wait() end
        end)
        if aceInstaResetState.token ~= token then return end
        releaseResetCamera()
        aceInstaResetState.busy = false
        S._youtResetInProgress = false
        restoreDaHubGuards(suspended)
    end)
end

registerResetConnection(resetHeartbeat:Connect(function()
    if not aceInstaResetState.busy then return end
    if (os.clock() - (aceInstaResetState.busyAt or 0)) >= 10 then
        aceInstaResetState.busy = false
        releaseResetCamera()
        S._youtResetInProgress = false
        restoreDaHubGuards()
    end
end))

registerResetConnection(LP.CharacterAdded:Connect(function(character)
    if not aceInstaResetState.queued then return end
    if (aceInstaResetState.queuedUntil or 0) < os.clock() then
        aceInstaResetState.queued = false
        return
    end
    aceInstaResetState.queued = false
    task.spawn(function()
        local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 5)
        local root = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 5)
        task.wait(0.15)
        if humanoid and root and humanoid.Health > 0 and LP.Character == character then aceInstantReset() end
    end)
end))

_G._AceInstaReset = aceInstantReset
_G._CandyInstaReset = aceInstantReset
_G._AceInstaResetTune = function(value)
    local number = tonumber(value)
    if number then aceInstaResetState.speed = math.clamp(math.abs(number), 1000, 10000000) end
    return aceInstaResetState.speed
end
_G._CandyInstaResetTune = _G._AceInstaResetTune

_lastRequest = 0
local function sourceInstaResetTrigger()
    local now = os.clock()
    if now - _lastRequest < 0.15 then return end
    _lastRequest = now
    aceInstantReset()
end
_G.InstaReset = {Trigger = sourceInstaResetTrigger}
_G.VynxDoInstaReset = _G.InstaReset.Trigger
_G.daHubInstantReset = _G.InstaReset.Trigger
-- Rebind the camera to the Humanoid whenever the character respawns.
LP.CharacterAdded:Connect(function(character)
    task.defer(function()
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if not humanoid and character then humanoid = character:WaitForChild("Humanoid", 5) end
        local camera = workspace.CurrentCamera
        if camera and humanoid then
            pcall(function()
                camera.CameraType = Enum.CameraType.Custom
                camera.CameraSubject = humanoid
            end)
        end
    end)
end)

-- Drop Brainrot adaptado do Drakon: Fling (0.30s) e Jump Drop (0.22s).
-- Todos os botões e atalhos existentes continuam usando runDropBrainrot.
DROP_FLING_COOLDOWN_FAST = 0.6
DROP_FLING_COOLDOWN_SLOW = 0.25
local function setDropActive(on)
    S.dropBrainrotActive = on
    if S.dropBrainrotSetVisual then pcall(S.dropBrainrotSetVisual, on) end
    if S.dropBrainrotFloatVisual and S.dropBrainrotFloatVisual ~= S.dropBrainrotSetVisual then
        pcall(S.dropBrainrotFloatVisual, on)
    end
end

stopDropBrainrot = function()
    local finish = S._dropFinish
    if finish then finish(true); return end
    setDropActive(false)
end

LP.CharacterRemoving:Connect(function()
    local finish = S._dropFinish
    if finish then finish(false) end
end)

local function runDropBrainrot()
    if S.dropBrainrotActive or _G.IsDropping or S._youtResetInProgress then return end
    local character = LP.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid or humanoid.Health <= 0 or root.Anchored then return end
    local mode = S.dropMode == 2 and 2 or 1
    local now = tick()
    if mode == 1 then
        local velocity = root.AssemblyLinearVelocity
        local speedH = Vector3.new(velocity.X, 0, velocity.Z).Magnitude
        local cooldown = speedH > 5 and DROP_FLING_COOLDOWN_FAST or DROP_FLING_COOLDOWN_SLOW
        if now - (S.lastDropTime or 0) < cooldown then return end
        S.lastDropTime = now
    end

    local savedSpeed = S.speedMode
    local savedLagger = S.laggerMode
    local savedBat = S.batAimbotEnabled == true
    if savedBat then setBatAimbot(false) end
    setDropActive(true)
    local finished = false
    local worker, timeout, connection
    local finishDrop
    finishDrop = function(restoreCharacter)
        if finished then return end
        finished = true
        if connection then connection:Disconnect(); connection = nil end
        if worker and worker ~= coroutine.running() then pcall(task.cancel, worker) end
        if timeout and timeout ~= coroutine.running() then pcall(task.cancel, timeout) end
        S._dropThread = nil
        S._dropConn = nil
        S._dropFinish = nil
        if restoreCharacter and LP.Character == character and root.Parent then
            pcall(function()
                root.AssemblyLinearVelocity = Vector3.zero
                root.AssemblyAngularVelocity = Vector3.zero
                if root.Position.Y < -100 then root.CFrame = CFrame.new(root.Position.X, 5, root.Position.Z) end
                local params = RaycastParams.new()
                params.FilterDescendantsInstances = {character}
                params.FilterType = Enum.RaycastFilterType.Exclude
                local hit = workspace:Raycast(root.Position, Vector3.new(0, -2000, 0), params)
                if hit then
                    root.CFrame = CFrame.new(root.Position.X,
                        hit.Position.Y + humanoid.HipHeight + root.Size.Y / 2, root.Position.Z)
                end
                if humanoid.Health > 0 then humanoid:ChangeState(Enum.HumanoidStateType.Running) end
            end)
        end
        S.speedMode = savedSpeed
        S.laggerMode = savedLagger
        setDropActive(false)
        if savedBat then pcall(setBatAimbot, true) end
        if S.refreshSpeedModeLabel then pcall(S.refreshSpeedModeLabel) end
        if restoreCharacter and S.applySpeedVelocityNow then pcall(S.applySpeedVelocityNow) end
        if S.restartMovement then pcall(S.restartMovement) end
        if updateFloatingButtons then pcall(updateFloatingButtons) end
    end
    S._dropFinish = finishDrop

    if mode == 2 then
        connection = RunService.Heartbeat:Connect(function()
            local ok, err = pcall(function()
                if finished then return end
                if LP.Character ~= character or not root.Parent then finishDrop(false); return end
                if tick() - now >= 0.22 then finishDrop(true); return end
                local velocity = root.AssemblyLinearVelocity
                root.AssemblyLinearVelocity = Vector3.new(velocity.X, 160, velocity.Z)
            end)
            if not ok then finishDrop(true); warn("[Drakon hub] Jump Drop: " .. tostring(err)) end
        end)
        S._dropConn = connection
        timeout = task.delay(0.35, function() finishDrop(true) end)
        return
    end

    worker = task.defer(function()
        local ok, err = pcall(function()
            local startedAt = tick()
            while not finished and S.dropBrainrotActive and tick() - startedAt < 0.30 do
                RunService.Heartbeat:Wait()
                if finished or LP.Character ~= character or not root.Parent then break end
                local velocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
                root.AssemblyLinearVelocity = velocity * 10000 + Vector3.new(0, 10000, 0)
                RunService.RenderStepped:Wait()
                if finished or not root.Parent then break end
                root.AssemblyLinearVelocity = velocity
                RunService.Stepped:Wait()
                if finished or not root.Parent then break end
                root.AssemblyLinearVelocity = velocity + Vector3.new(0, 0.1, 0)
            end
        end)
        finishDrop(LP.Character == character)
        if not ok then warn("[Drakon hub] Fling Drop: " .. tostring(err)) end
    end)
    S._dropThread = worker
    timeout = task.delay(0.35, function() finishDrop(true) end)
end

S.startMovement = function()
    if S.moveConn then S.moveConn:Disconnect(); S.moveConn = nil end
    local movementSignal = RunService.PreSimulation or RunService.Stepped
    S.moveConn = movementSignal:Connect(function(firstDelta, secondDelta)
        local deltaTime = secondDelta or firstDelta or 1 / 60
        if not S.speedEnabled or not S._unifiedMovementEnabled or S._youtResetInProgress then return end
        local char = LP.Character
        local hum = char and (S._vxCachedHum and S._vxCachedHum.Parent and S._vxCachedHum or char:FindFirstChildOfClass("Humanoid"))
        local root = char and (S._vxCachedRoot and S._vxCachedRoot.Parent and S._vxCachedRoot or char:FindFirstChild("HumanoidRootPart"))
        if not char or not hum or not root or hum.Health <= 0 then return end
        S.h, S.hrp = hum, root
        if S.dropBrainrotActive or S.batBypassEnabled then return end
        if S.batAimbotEnabled or S.autoLeftEnabled or S.autoRightEnabled then
            setLV(root, 0, 0, deltaTime)
            return
        end
        local state = hum:GetState()
        if hum.PlatformStand or state == Enum.HumanoidStateType.Physics
            or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown then
            S.lastMoveDir = Vector3.zero
            setLV(root, 0, 0, deltaTime)
            return
        end
        if S._vxSpeedCheckRoof and S._vxSpeedCheckRoof(root, deltaTime) then
            setLV(root, 0, 0, deltaTime)
            return
        end
        local direction = hum.MoveDirection
        if direction.Magnitude <= 0.05 and S.antiRagdollEnabled and S.lastMoveDir.Magnitude > 0 then
            for key in pairs(S.MOVE_KEYS) do
                if UIS:IsKeyDown(key) then direction = S.lastMoveDir; break end
            end
        end
        if direction.Magnitude > 0.05 then
            direction = Vector3.new(direction.X, 0, direction.Z)
            local magnitude = direction.Magnitude
            if magnitude > 0.001 then
                direction = direction.Unit
                S.lastMoveDir = direction
                pcall(function() if root.SetNetworkOwner then root:SetNetworkOwner(LP) end end)
                local speed = S._unifiedResolveSpeed()
                local horizontal = Vector3.new(direction.X * speed, 0, direction.Z * speed)
                if S._vxSpeedResolveHorizontal then
                    local ok, result = pcall(S._vxSpeedResolveHorizontal, root, hum, horizontal, deltaTime)
                    if ok and typeof(result) == "Vector3" then horizontal = result end
                end
                setLV(root, horizontal.X, horizontal.Z, deltaTime)
            else
                setLV(root, 0, 0, deltaTime)
            end
        else
            setLV(root, 0, 0, deltaTime)
        end
        updateSpeedBillboard(root)
    end)
end

S.stopMovement = function()
    if S.moveConn then S.moveConn:Disconnect(); S.moveConn = nil end
    if clearLV then clearLV() end
end
S.restartMovement = function() S.stopMovement(); S.startMovement() end
S.speedEnabled = true
S.startMovement()

-- ── Hold Jump (ported from the attached DaHub; standalone Infinite Jump removed) ──
S.holdJumpPower = 55
S.holdJumpMinVelocity = 35
S.holdJumpFallClamp = -120
S._unifiedCanJump = true
S._unifiedLastJumpTime = S._unifiedLastJumpTime or 0
S._unifiedGamepadHeld = false
S._unifiedTouchHeld = false
S._mobileJumpButtonConns = S._mobileJumpButtonConns or {}
S._mobileJumpWatchConn = nil
S._mobileJumpButton = nil

local function clearHoldJump()
    S.holdJumpPressed = false
    S.holdJumpActive = false
    S._unifiedGamepadHeld = false
    S._unifiedTouchHeld = false
end

local function isJumpInputFocused()
    local ok, focused = pcall(function() return UIS:GetFocusedTextBox() end)
    return ok and focused ~= nil
end

local function getHoldJumpParts()
    local character = LP.Character
    if not character then return nil, nil, nil end
    return character, character:FindFirstChildOfClass("Humanoid"), character:FindFirstChild("HumanoidRootPart")
end

S._unifiedApplyJumpVelocity = function()
    if not S.holdJumpEnabled or not S._unifiedCanJump or S._youtResetInProgress or isJumpInputFocused() then return end
    if S.dropBrainrotActive then return end
    local character, humanoid, root = getHoldJumpParts()
    if not character or not humanoid or not root or humanoid.Health <= 0 then return end

    S._unifiedCanJump = false
    S._unifiedLastJumpTime = os.clock()
    humanoid.Jump = true
    pcall(function() if root.SetNetworkOwner then root:SetNetworkOwner(LP) end end)
    local velocity = root.AssemblyLinearVelocity
    if S._vxSyncSpoof then S._vxSyncSpoof(Vector3.new(velocity.X, 0, velocity.Z)) end
    root.AssemblyLinearVelocity = Vector3.new(velocity.X, S.holdJumpPower, velocity.Z)
    task.delay(0.08, function() S._unifiedCanJump = true end)
end

local function isGamepadInput(input)
    return input.UserInputType.Name:match("^Gamepad%d+$") ~= nil
end

local function bindMobileJumpButton(button)
    for _, connection in ipairs(S._mobileJumpButtonConns) do pcall(function() connection:Disconnect() end) end
    table.clear(S._mobileJumpButtonConns)
    S._unifiedTouchHeld = false
    S._mobileJumpButton = nil
    if not button or not button:IsA("GuiButton") then return end
    S._mobileJumpButton = button
    table.insert(S._mobileJumpButtonConns, button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            S._unifiedTouchHeld = true
            S.holdJumpPressed = true
        end
    end))
    table.insert(S._mobileJumpButtonConns, button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then clearHoldJump() end
    end))
    table.insert(S._mobileJumpButtonConns, button.AncestryChanged:Connect(function(_, parent)
        if not parent then clearHoldJump(); S._mobileJumpButton = nil end
    end))
end

local function findMobileJumpButton()
    local playerGui = LP:FindFirstChildOfClass("PlayerGui")
    local button = playerGui and playerGui:FindFirstChild("JumpButton", true)
    if button and button ~= S._mobileJumpButton then bindMobileJumpButton(button) end
end

local function stopHoldJumpConnections()
    clearHoldJump()
    if S.IJ_JumpConn then S.IJ_JumpConn:Disconnect(); S.IJ_JumpConn = nil end
    if S.IJ_InputBeganConn then S.IJ_InputBeganConn:Disconnect(); S.IJ_InputBeganConn = nil end
    if S.IJ_InputEndedConn then S.IJ_InputEndedConn:Disconnect(); S.IJ_InputEndedConn = nil end
    if S.IJ_HoldConn then S.IJ_HoldConn:Disconnect(); S.IJ_HoldConn = nil end
    if S._mobileJumpWatchConn then S._mobileJumpWatchConn:Disconnect(); S._mobileJumpWatchConn = nil end
    for _, connection in ipairs(S._mobileJumpButtonConns) do pcall(function() connection:Disconnect() end) end
    table.clear(S._mobileJumpButtonConns)
    S._mobileJumpButton = nil
    S._unifiedCanJump = true
end

local function ensureHoldJumpConnections()
    if not S.IJ_JumpConn then
        S.IJ_JumpConn = UIS.JumpRequest:Connect(function()
            if S.holdJumpEnabled and not isJumpInputFocused() then S._unifiedApplyJumpVelocity() end
        end)
    end
    if not S.IJ_InputBeganConn then
        S.IJ_InputBeganConn = UIS.InputBegan:Connect(function(input)
            if isJumpInputFocused() then return end
            if input.KeyCode == Enum.KeyCode.Space and input.UserInputType == Enum.UserInputType.Keyboard then
                S.holdJumpPressed = true
            elseif input.KeyCode == Enum.KeyCode.ButtonA and isGamepadInput(input) then
                S._unifiedGamepadHeld = true
                S.holdJumpPressed = true
            end
        end)
    end
    if not S.IJ_InputEndedConn then
        S.IJ_InputEndedConn = UIS.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Space and input.UserInputType == Enum.UserInputType.Keyboard then
                clearHoldJump()
            elseif input.KeyCode == Enum.KeyCode.ButtonA and isGamepadInput(input) then
                S._unifiedGamepadHeld = false
                if not S._unifiedTouchHeld and not UIS:IsKeyDown(Enum.KeyCode.Space) then clearHoldJump() end
            end
        end)
    end
    if not S.IJ_HoldConn then
        S.IJ_HoldConn = RunService.Heartbeat:Connect(function()
            if not S.holdJumpEnabled or S.dropBrainrotActive or S._youtResetInProgress or isJumpInputFocused() then return end
            local character, humanoid, root = getHoldJumpParts()
            if not character or not humanoid or not root or humanoid.Health <= 0 then return end
            local keyboardHeld = false
            pcall(function() keyboardHeld = UIS:IsKeyDown(Enum.KeyCode.Space) end)
            local jumpHeld = keyboardHeld or humanoid.Jump == true or S._unifiedGamepadHeld == true or S._unifiedTouchHeld == true
            local velocity = root.AssemblyLinearVelocity
            if jumpHeld and velocity.Y < S.holdJumpMinVelocity then S._unifiedApplyJumpVelocity() end
            if velocity.Y < S.holdJumpFallClamp then
                local clamped = Vector3.new(velocity.X, S.holdJumpFallClamp, velocity.Z)
                if S._vxSyncSpoof then S._vxSyncSpoof(clamped) end
                root.AssemblyLinearVelocity = clamped
            end
        end)
    end
    if UIS.TouchEnabled then
        local playerGui = LP:FindFirstChildOfClass("PlayerGui") or LP:WaitForChild("PlayerGui")
        if not S._mobileJumpWatchConn then
            S._mobileJumpWatchConn = playerGui.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "JumpButton" and descendant:IsA("GuiButton") then bindMobileJumpButton(descendant) end
            end)
        end
        task.defer(findMobileJumpButton)
    end
end

local function startHoldJump()
    S.holdJumpEnabled = true
    S.holdJumpMode = true
    ensureHoldJumpConnections()
end

local function stopHoldJump()
    S.holdJumpEnabled = false
    S.holdJumpMode = false
    stopHoldJumpConnections()
end

TP_DOWN_MODE = "full"
S.tpDownHeightTrigger = tonumber(S.tpDownHeightTrigger) or 20

local function tpIsCarryingBrainrot(character)
    if not character then return false end
    if LP:GetAttribute("Stealing") == true or character:GetAttribute("Stealing") == true then return true end
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Tool") then
            local name = child.Name:lower()
            if not (name:find("bat") or name:find("slap")) then return true end
        end
    end
    return false
end

local function runTPDownFull()
    pcall(function()
        local character = LP.Character
        if not character then return end
        local root = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not root or not humanoid then return end

        local worldPosition = root.Position
        if worldPosition.Y <= -7 then
            root.CFrame = CFrame.new(worldPosition.X, -7, worldPosition.Z)
            root.AssemblyLinearVelocity = Vector3.zero
            return
        end

        local rootOffset = (humanoid.HipHeight or 2) + root.Size.Y * 0.5 + 0.2
        local ignoredNames = {"invis", "wall", "trigger", "barrier", "clip", "ghost"}

        local function hasIgnoredName(instance)
            while instance and instance ~= workspace do
                local name = string.lower(instance.Name or "")
                for _, ignored in ipairs(ignoredNames) do
                    if name:find(ignored, 1, true) then return true end
                end
                instance = instance.Parent
            end
            return false
        end

        local function shouldSkip(instance)
            if instance == workspace.Terrain then return false end
            if not instance or not instance:IsA("BasePart") then return true end
            if not instance.CanCollide then return true end
            if (instance.Transparency or 0) >= 0.75 then return true end
            if (instance.LocalTransparencyModifier or 0) >= 0.75 then return true end
            return hasIgnoredName(instance)
        end

        local function findFloorY(origin)
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.IgnoreWater = true
            local filter = {character}
            for _ = 1, 80 do
                params.FilterDescendantsInstances = filter
                local hit = workspace:Raycast(origin, Vector3.new(0, -7 - origin.Y, 0), params)
                if not hit then return nil end
                if not shouldSkip(hit.Instance) then return hit.Position.Y end
                table.insert(filter, hasIgnoredName(hit.Instance) and hit.Instance.Parent or hit.Instance)
            end
            return nil
        end

        local radius = math.max(0.75, math.min(2, math.max(root.Size.X, root.Size.Z) * 0.55))
        local offsets = {
            Vector3.zero,
            Vector3.new(radius, 0, 0), Vector3.new(-radius, 0, 0),
            Vector3.new(0, 0, radius), Vector3.new(0, 0, -radius),
            Vector3.new(radius * 0.7, 0, radius * 0.7),
            Vector3.new(-radius * 0.7, 0, radius * 0.7),
            Vector3.new(radius * 0.7, 0, -radius * 0.7),
            Vector3.new(-radius * 0.7, 0, -radius * 0.7),
        }

        local floorY = findFloorY(worldPosition + Vector3.new(0, 0.25, 0))
        if not floorY then
            for i = 2, #offsets do
                local candidate = findFloorY(worldPosition + offsets[i] + Vector3.new(0, 0.25, 0))
                if candidate and (not floorY or candidate > floorY) then floorY = candidate end
            end
        end

        local targetY = -7
        if floorY then
            local candidateY = floorY + rootOffset
            if worldPosition.Y - 0.35 <= candidateY then return end
            targetY = math.max(candidateY, -7)
        end

        local _, yaw = root.CFrame:ToEulerAnglesYXZ()
        root.CFrame = CFrame.new(worldPosition.X, targetY, worldPosition.Z) * CFrame.Angles(0, yaw, 0)
        root.AssemblyLinearVelocity = Vector3.zero
    end)
end

local function executeTPDown()
    if S.dropBrainrotActive or _G.IsDropping then return end
    local character = LP.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not character or not root or not humanoid or humanoid.Health <= 0 or root.Anchored or humanoid.Sit or humanoid.SeatPart then return end
    if TP_DOWN_MODE == "full" then runTPDownFull() end
end

_G._VynxRunTPDown = executeTPDown

-- Yout visual features: Vivid Graphics, Stretch Rez, and Sky Theme.
local function applyStretchFOV(val)
    local cam = workspace.CurrentCamera
    if cam then pcall(function() cam.FieldOfView = val end) end
end

local function enableStretch()
    if S.stretchConn then return end
    S.stretchEnabled = true
    local cam = workspace.CurrentCamera
    if not cam then return end
    S.origFOV = cam.FieldOfView or 70
    applyStretchFOV(S.stretchFOV)
    S.stretchConn = RunService.RenderStepped:Connect(function()
        if not S.stretchEnabled then
            S.stretchConn:Disconnect()
            S.stretchConn = nil
            return
        end
        local c = workspace.CurrentCamera
        if c then c.CFrame = c.CFrame * _CFnew(0,0,0,1,0,0,0,0.7,0,0,0,1) end
    end)
    if S.stretchFovConn then S.stretchFovConn:Disconnect() end
    S.stretchFovConn = RunService.RenderStepped:Connect(function()
        if S.stretchEnabled then applyStretchFOV(S.stretchFOV)
        else S.stretchFovConn:Disconnect(); S.stretchFovConn = nil end
    end)
end

local function disableStretch()
    S.stretchEnabled = false
    if S.stretchConn then S.stretchConn:Disconnect(); S.stretchConn = nil end
    if S.stretchFovConn then S.stretchFovConn:Disconnect(); S.stretchFovConn = nil end
    local cam = workspace.CurrentCamera
    if cam then pcall(function() cam.FieldOfView = S.origFOV or 70 end) end
end

SKY_PRESETS_LIST = {"Off","Night","Aurora","Sunset","Galaxy","Cyber","Sakura","Pink Night","Blood Moon","Emerald Dawn","Volcanic","Arctic","Midnight Ocean","Vaporwave","Toxic","Solar Eclipse","Hellscape","Heaven","Storm","Sunrise","Deep Space","Lavender Dream","Inferno","Mint Sky"}

SKY_PRESETS = {
    ["Off"]={kind="off"},
    ["Night"]={clock=22,brightness=2,ambient={110,100,130},outAmb={120,110,140},sky={stars=4000,moon=18,sun=0,moonTex=true},atm={dens=0.45,color={120,60,180},decay={60,20,100},glare=0.5,haze=1.2}},
    ["Aurora"]={clock=14,brightness=3,ambient={150,120,150},outAmb={160,130,150},atm={dens=0.55,color={255,80,200},decay={255,20,150},glare=2.5,haze=3},clouds={cover=0.7,dens=0.7,color={255,240,250}}},
    ["Sunset"]={clock=17.2,brightness=2.5,ambient={170,120,100},outAmb={180,130,110},sky={stars=0,sun=25,moon=0},atm={dens=0.5,color={255,130,60},decay={255,80,30},glare=2,haze=2.5},clouds={cover=0.55,dens=0.55,color={255,200,140}}},
    ["Galaxy"]={clock=0,brightness=1.5,ambient={70,60,100},outAmb={80,70,110},sky={stars=10000,moon=30,sun=0},atm={dens=0.15,color={40,20,80},decay={20,10,50},glare=0.3,haze=0.5}},
    ["Cyber"]={clock=21,brightness=2.2,ambient={90,130,170},outAmb={100,140,180},sky={stars=2000,moon=12},atm={dens=0.4,color={0,200,255},decay={150,0,255},glare=2,haze=2},clouds={cover=0.4,dens=0.6,color={100,200,255}}},
    ["Sakura"]={clock=11,brightness=3.5,ambient={170,150,160},outAmb={180,160,170},sky={sun=8},atm={dens=0.3,color={255,200,220},decay={255,170,200},glare=1,haze=1.5},clouds={cover=0.6,dens=0.4,color={255,250,252}}},
    ["Pink Night"]={clock=23,brightness=2.2,ambient={120,60,110},outAmb={140,70,120},sky={stars=5000,moon=22,sun=0,moonTex=true},atm={dens=0.5,color={255,80,180},decay={140,30,100},glare=0.7,haze=1.4},clouds={cover=0.3,dens=0.5,color={180,90,150}}},
    ["Blood Moon"]={clock=22.5,brightness=1.6,ambient={130,40,40},outAmb={150,50,50},sky={stars=1500,moon=28,sun=0,moonTex=true},atm={dens=0.6,color={220,30,30},decay={120,10,10},glare=1.4,haze=2},clouds={cover=0.5,dens=0.7,color={120,30,30}}},
    ["Emerald Dawn"]={clock=6.5,brightness=2.8,ambient={130,170,140},outAmb={140,180,150},sky={sun=18,moon=0,stars=0},atm={dens=0.4,color={80,200,140},decay={40,150,90},glare=1.8,haze=2.2},clouds={cover=0.5,dens=0.5,color={200,255,220}}},
    ["Volcanic"]={clock=19,brightness=2,ambient={180,80,40},outAmb={200,90,50},sky={stars=200,sun=12,moon=0},atm={dens=0.75,color={255,60,0},decay={180,20,0},glare=3,haze=3.5},clouds={cover=0.8,dens=0.9,color={120,40,20}}},
    ["Arctic"]={clock=9,brightness=3.2,ambient={200,220,235},outAmb={210,230,245},sky={sun=10,stars=0,moon=0},atm={dens=0.3,color={180,220,255},decay={140,200,240},glare=1.5,haze=1.8},clouds={cover=0.7,dens=0.6,color={250,253,255}}},
    ["Midnight Ocean"]={clock=1.5,brightness=1.7,ambient={60,90,130},outAmb={70,100,140},sky={stars=6000,moon=24,sun=0,moonTex=true},atm={dens=0.5,color={20,60,140},decay={10,30,90},glare=0.6,haze=1.5}},
    ["Vaporwave"]={clock=19.5,brightness=2.4,ambient={180,120,200},outAmb={190,130,210},sky={stars=1000,moon=14},atm={dens=0.45,color={255,100,220},decay={120,60,255},glare=2.2,haze=2.4},clouds={cover=0.55,dens=0.55,color={200,150,255}}},
    ["Toxic"]={clock=13,brightness=2.5,ambient={140,180,80},outAmb={150,190,90},atm={dens=0.55,color={100,220,40},decay={60,150,20},glare=1.8,haze=2.6},clouds={cover=0.65,dens=0.7,color={180,255,120}}},
    ["Solar Eclipse"]={clock=12,brightness=0.9,ambient={50,40,60},outAmb={60,50,70},sky={stars=3500,sun=22,moon=0},atm={dens=0.5,color={255,140,40},decay={30,20,40},glare=2.8,haze=1.8}},
    ["Hellscape"]={clock=18,brightness=1.8,ambient={200,60,30},outAmb={220,70,40},sky={stars=100,sun=30,moon=0},atm={dens=0.85,color={255,30,0},decay={120,0,0},glare=3.5,haze=4},clouds={cover=0.95,dens=0.95,color={80,20,10}}},
    ["Heaven"]={clock=12,brightness=4,ambient={240,235,210},outAmb={250,245,220},sky={sun=16,moon=0,stars=0},atm={dens=0.25,color={255,250,220},decay={255,240,200},glare=3,haze=1.5},clouds={cover=0.85,dens=0.5,color={255,255,255}}},
    ["Storm"]={clock=15,brightness=1.4,ambient={90,90,110},outAmb={100,100,120},sky={stars=0,sun=6,moon=0},atm={dens=0.65,color={80,90,120},decay={40,50,80},glare=0.5,haze=3},clouds={cover=0.95,dens=0.95,color={60,65,80}}},
    ["Sunrise"]={clock=6.2,brightness=2.8,ambient={220,180,130},outAmb={230,190,140},sky={sun=22,stars=0,moon=0},atm={dens=0.45,color={255,180,100},decay={255,140,80},glare=2.4,haze=2.2},clouds={cover=0.4,dens=0.4,color={255,220,180}}},
    ["Deep Space"]={clock=0,brightness=1,ambient={30,25,50},outAmb={40,35,60},sky={stars=15000,moon=0,sun=0},atm={dens=0.08,color={15,5,40},decay={5,0,20},glare=0.2,haze=0.3}},
    ["Lavender Dream"]={clock=18.5,brightness=2.6,ambient={180,160,220},outAmb={190,170,230},sky={stars=800,moon=16,sun=0},atm={dens=0.4,color={200,160,255},decay={160,120,220},glare=1.4,haze=1.8},clouds={cover=0.55,dens=0.5,color={220,200,255}}},
    ["Inferno"]={clock=17.5,brightness=2.2,ambient={220,100,40},outAmb={235,110,50},sky={sun=26,moon=0,stars=0},atm={dens=0.6,color={255,90,20},decay={200,40,0},glare=3,haze=3.2},clouds={cover=0.7,dens=0.7,color={200,80,40}}},
    ["Mint Sky"]={clock=10,brightness=3.2,ambient={180,230,210},outAmb={190,240,220},sky={sun=10},atm={dens=0.32,color={150,255,210},decay={100,220,180},glare=1.6,haze=1.6},clouds={cover=0.55,dens=0.45,color={240,255,250}}},
}

local function _vC3(t) return Color3.fromRGB(t[1], t[2], t[3]) end

local function _v4mpClearSky()
    for _, child in ipairs(Lighting:GetChildren()) do
        if child:GetAttribute("_AdaptDuelsSky") then
            pcall(function() child:Destroy() end)
        end
    end
    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        for _, child in ipairs(terrain:GetChildren()) do
            if child:GetAttribute("_AdaptDuelsSky") then
                pcall(function() child:Destroy() end)
            end
        end
    end
end

local function applyCustomSky(mode)
    _v4mpClearSky()
    local preset = SKY_PRESETS[mode]
    if not preset or preset.kind == "off" then
        Lighting.ClockTime = 14
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(127,127,127)
        Lighting.Ambient = Color3.fromRGB(127,127,127)
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = true
        S.skyTheme = "Off"
        return
    end
    Lighting.FogStart = 0
    Lighting.FogEnd = 100000
    Lighting.FogColor = Color3.fromRGB(200,200,200)
    Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
    Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
    Lighting.GlobalShadows = true
    Lighting.ClockTime = preset.clock or 14
    Lighting.Brightness = preset.brightness or 2
    if preset.outAmb then Lighting.OutdoorAmbient = _vC3(preset.outAmb) end
    if preset.ambient then Lighting.Ambient = _vC3(preset.ambient) end
    if preset.sky then
        local skyInst = Instance.new("Sky")
        skyInst:SetAttribute("_AdaptDuelsSky", true)
        if preset.sky.stars then skyInst.StarCount = preset.sky.stars end
        if preset.sky.moon then skyInst.MoonAngularSize = preset.sky.moon end
        if preset.sky.sun then skyInst.SunAngularSize = preset.sky.sun end
        if preset.sky.moonTex then skyInst.MoonTextureId = "rbxasset://sky/moon.jpg" end
        skyInst.Parent = Lighting
    end
    if preset.atm then
        local atm = Instance.new("Atmosphere")
        atm:SetAttribute("_AdaptDuelsSky", true)
        atm.Density = preset.atm.dens or 0.3
        atm.Color = _vC3(preset.atm.color)
        atm.Decay = _vC3(preset.atm.decay)
        atm.Glare = preset.atm.glare or 1
        atm.Haze = preset.atm.haze or 1
        atm.Parent = Lighting
    end
    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if preset.clouds and terrain then
        local clouds = Instance.new("Clouds")
        clouds:SetAttribute("_AdaptDuelsSky", true)
        clouds.Cover = preset.clouds.cover or 0.5
        clouds.Density = preset.clouds.dens or 0.5
        clouds.Color = _vC3(preset.clouds.color)
        clouds.Parent = terrain
    end
    S.skyTheme = mode
end

local function enableVividGraphics()
    if S.vividGraphicsEnabled and #S.vividEffects > 0 then return end
    S.vividGraphicsEnabled = true
    for _, eff in ipairs(S.vividEffects) do
        pcall(function() eff:Destroy() end)
    end
    S.vividEffects = {}
    local color = Instance.new("ColorCorrectionEffect")
    color.Parent = Lighting
    color.Saturation = 0.6; color.Contrast = 0.4; color.Brightness = 0.05
    color.TintColor = Color3.fromRGB(255, 240, 220)
    table.insert(S.vividEffects, color)
    local bloom = Instance.new("BloomEffect")
    bloom.Parent = Lighting
    bloom.Intensity = 0.8; bloom.Size = 24; bloom.Threshold = 1
    table.insert(S.vividEffects, bloom)
    local atmosphere = Instance.new("Atmosphere")
    atmosphere.Parent = Lighting
    atmosphere.Density = 0.3; atmosphere.Offset = 0.25
    atmosphere.Color = Color3.fromRGB(220, 220, 225)
    atmosphere.Decay = Color3.fromRGB(106, 112, 125)
    atmosphere.Glare = 0.2; atmosphere.Haze = 1
    table.insert(S.vividEffects, atmosphere)
    local sun = Instance.new("SunRaysEffect")
    sun.Parent = Lighting
    sun.Intensity = 0.2; sun.Spread = 0.8
    table.insert(S.vividEffects, sun)
    local dof = Instance.new("DepthOfFieldEffect")
    dof.Parent = Lighting
    dof.FocusDistance = 25; dof.InFocusRadius = 10
    dof.NearIntensity = 0.2; dof.FarIntensity = 0.4
    table.insert(S.vividEffects, dof)
    task.spawn(function()
        while S.vividGraphicsEnabled and color and color.Parent do
            color.Contrast = 0.35 + math.sin(tick() * 2) * 0.05
            task.wait(0.03)
        end
    end)
end

local function disableVividGraphics()
    S.vividGraphicsEnabled = false
    for _, eff in ipairs(S.vividEffects) do
        pcall(function() eff:Destroy() end)
    end
    S.vividEffects = {}
end

local function toggleVividGraphics(on)
    if on then enableVividGraphics() else disableVividGraphics() end
    saveConfig()
end


YF = {}
-- Yout-to-DaHub ports: Anti Fling, Lock Enemy, Anim Pack, and Anti Lag.
-- Anti Fling and Lock Enemy, adapted to DaHub's state and movement system.
YF.antiFlingState = {connection = nil, threshold = 80, spinThreshold = 40}
function YF.startAntiFling()
    S.antiFlingEnabled = true
    if YF.antiFlingState.connection then return end
    YF.antiFlingState.connection = RunService.Heartbeat:Connect(function()
        if not S.antiFlingEnabled then return end
        local character = LP.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and (humanoid.Health <= 0 or humanoid.SeatPart) then return end
        if S._youtResetInProgress or S.dropBrainrotActive or _G.IsDropping then return end
        if S.autoLeftEnabled or S.autoRightEnabled or S.batAimbotEnabled or S.batBypassEnabled or S.bodyLockEnabled then return end
        local velocity = root.AssemblyLinearVelocity
        if Vector3.new(velocity.X, 0, velocity.Z).Magnitude > YF.antiFlingState.threshold then
            pcall(function()
                root.AssemblyLinearVelocity = Vector3.new(0, velocity.Y, 0)
                root.AssemblyAngularVelocity = Vector3.zero
            end)
            return
        end
        if root.AssemblyAngularVelocity.Magnitude > YF.antiFlingState.spinThreshold then
            pcall(function() root.AssemblyAngularVelocity = Vector3.zero end)
        end
    end)
end
function YF.stopAntiFling()
    S.antiFlingEnabled = false
    if YF.antiFlingState.connection then YF.antiFlingState.connection:Disconnect(); YF.antiFlingState.connection = nil end
end

function YF.getClosestTargetBody()
    local character = LP.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local closest, minDistance = nil, math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP then
            local otherCharacter = player.Character
            local targetRoot = otherCharacter and otherCharacter:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = otherCharacter and otherCharacter:FindFirstChildOfClass("Humanoid")
            if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                local distance = (targetRoot.Position - root.Position).Magnitude
                if distance < minDistance then closest, minDistance = targetRoot, distance end
            end
        end
    end
    return closest
end

function YF.bodyLockTick()
    local character = LP.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid or humanoid.Health <= 0 then return end
    if S.batBypassEnabled then return end
    if S._youtResetInProgress or S.dropBrainrotActive or S.autoLeftEnabled or S.autoRightEnabled or S.batAimbotEnabled then
        if not humanoid.AutoRotate then humanoid.AutoRotate = true end
        return
    end
    local target = YF.getClosestTargetBody()
    if not target or (target.Position - root.Position).Magnitude > S.bodyLockRange then
        if not humanoid.AutoRotate then humanoid.AutoRotate = true end
        return
    end
    if humanoid.AutoRotate then humanoid.AutoRotate = false end
    local targetVelocity = target.AssemblyLinearVelocity
    local predictTime = math.clamp(targetVelocity.Magnitude / 80, 0.08, 0.35)
    local predictedPosition = target.Position + targetVelocity * predictTime
    local targetHead = target.Parent and target.Parent:FindFirstChild("Head")
    local targetHeight = targetHead and targetHead.Position.Y or target.Position.Y
    local myHeight = root.Position.Y + (humanoid.HipHeight or 0)
    local verticalCorrection = math.clamp((targetHeight - myHeight) * 0.15, -1.5, 1.5)
    local lookPosition = Vector3.new(predictedPosition.X, root.Position.Y + verticalCorrection, predictedPosition.Z)
    if (lookPosition - root.Position).Magnitude > 0.1 then
        local goal = CFrame.lookAt(root.Position, lookPosition)
        local relative = root.CFrame:Inverse() * goal
        local _, yaw = relative:ToEulerAnglesXYZ()
        yaw = math.clamp(yaw, -2.5, 2.5)
        root.AssemblyAngularVelocity = root.CFrame:VectorToWorldSpace(Vector3.new(0, yaw * 42, 0))
    end
end
function YF.startBodyLock()
    S.bodyLockEnabled = true
    if S.bodyLockConnection then return end
    local accumulator = 0
    S.bodyLockConnection = RunService.Heartbeat:Connect(function(dt)
        if not S.bodyLockEnabled then return end
        accumulator = accumulator + dt
        if accumulator < 0.033 then return end
        accumulator = 0
        YF.bodyLockTick()
    end)
end
function YF.stopBodyLock()
    S.bodyLockEnabled = false
    if S.bodyLockConnection then S.bodyLockConnection:Disconnect(); S.bodyLockConnection = nil end
    local character = LP.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if root then pcall(function() root.AssemblyAngularVelocity = Vector3.zero end) end
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.AutoRotate = true end
end

YF.ANIM_PACKS = {
    ["Zombie"] = { idle1="rbxassetid://616158929", idle2="rbxassetid://616160636", walk="rbxassetid://616168032", run="rbxassetid://616163682", jump="rbxassetid://616161997", fall="rbxassetid://616157476", climb="rbxassetid://616156119", swim="rbxassetid://616165109", swimidle="rbxassetid://616166655" },
    ["Ninja"] = { idle1="rbxassetid://656117400", idle2="rbxassetid://656117400", walk="rbxassetid://656121766", run="rbxassetid://656118852", jump="rbxassetid://656117878", fall="rbxassetid://656115606", climb="rbxassetid://656114359", swim="rbxassetid://656117400", swimidle="rbxassetid://656117400" },
    ["Knight"] = { idle1="rbxassetid://657595757", idle2="rbxassetid://657595757", walk="rbxassetid://657552124", run="rbxassetid://657564596", jump="rbxassetid://658409194", fall="rbxassetid://657600338", climb="rbxassetid://658360781", swim="rbxassetid://657595757", swimidle="rbxassetid://657595757" },
    ["Elder"] = { idle1="rbxassetid://845397899", idle2="rbxassetid://845397899", walk="rbxassetid://845403856", run="rbxassetid://845386501", jump="rbxassetid://845398858", fall="rbxassetid://845397673", climb="rbxassetid://845392038", swim="rbxassetid://845397899", swimidle="rbxassetid://845397899" },
    ["Levitate"] = { idle1="rbxassetid://616006778", idle2="rbxassetid://616006778", walk="rbxassetid://616013216", run="rbxassetid://616013216", jump="rbxassetid://616008936", fall="rbxassetid://616005863", climb="rbxassetid://616003713", swim="rbxassetid://616006778", swimidle="rbxassetid://616006778" },
    ["Astronaut"] = { idle1="rbxassetid://891621366", idle2="rbxassetid://891621366", walk="rbxassetid://891636393", run="rbxassetid://891636393", jump="rbxassetid://891627522", fall="rbxassetid://891617961", climb="rbxassetid://891609353", swim="rbxassetid://891621366", swimidle="rbxassetid://891621366" },
    ["Pirate"] = { idle1="rbxassetid://750781874", idle2="rbxassetid://750781874", walk="rbxassetid://750785693", run="rbxassetid://750783738", jump="rbxassetid://750782230", fall="rbxassetid://750780242", climb="rbxassetid://750779899", swim="rbxassetid://750781874", swimidle="rbxassetid://750781874" },
    ["Toy"] = { idle1="rbxassetid://782841498", idle2="rbxassetid://782841498", walk="rbxassetid://782843345", run="rbxassetid://782842708", jump="rbxassetid://782847020", fall="rbxassetid://782846423", climb="rbxassetid://782843869", swim="rbxassetid://782841498", swimidle="rbxassetid://782841498" },
    ["Vampire"] = { idle1="rbxassetid://1083445855", idle2="rbxassetid://1083445855", walk="rbxassetid://1083473930", run="rbxassetid://1083462077", jump="rbxassetid://1083455352", fall="rbxassetid://1083443587", climb="rbxassetid://1083439238", swim="rbxassetid://1083445855", swimidle="rbxassetid://1083445855" },
    ["Werewolf"] = { idle1="rbxassetid://1083195517", idle2="rbxassetid://1083195517", walk="rbxassetid://1083178339", run="rbxassetid://1083216690", jump="rbxassetid://1083218792", fall="rbxassetid://1083189019", climb="rbxassetid://1083182000", swim="rbxassetid://1083195517", swimidle="rbxassetid://1083195517" },
    ["Rthro"] = { idle1="rbxassetid://2510196951", idle2="rbxassetid://2510196951", walk="rbxassetid://2510202577", run="rbxassetid://2510198475", jump="rbxassetid://2510197830", fall="rbxassetid://2510195892", climb="rbxassetid://2510192778", swim="rbxassetid://2510196951", swimidle="rbxassetid://2510196951" },
    ["Stylish"] = { idle1="rbxassetid://616136790", idle2="rbxassetid://616136790", walk="rbxassetid://616146177", run="rbxassetid://616140816", jump="rbxassetid://616139451", fall="rbxassetid://616134815", climb="rbxassetid://616133594", swim="rbxassetid://616136790", swimidle="rbxassetid://616136790" },
}

YF.ANIM_PACK_ORDER = {{"Off", "Off"}, {"Zombie", "Zombie"}, {"Ninja", "Ninja"}, {"Knight", "Knight"}, {"Elder", "Elder"}, {"Levitate", "Levitate"}, {"Astronaut", "Astronaut"}, {"Pirate", "Pirate"}, {"Toy", "Toy"}, {"Vampire", "Vampire"}, {"Werewolf", "Werewolf"}, {"Rthro", "Rthro"}, {"Stylish", "Stylish"}}

function YF.isPackAnim(id)
    for _, pack in pairs(YF.ANIM_PACKS) do
        for _, v in pairs(pack) do
            if v == id then return true end
        end
    end
    return false
end

function YF.saveOriginalAnims(char)
    local animate = char:FindFirstChild("Animate")
    if not animate then return end
    local function g(obj) return obj and obj.AnimationId or nil end
    local ids = {
        idle1 = g(animate.idle and animate.idle.Animation1),
        idle2 = g(animate.idle and animate.idle.Animation2),
        walk  = g(animate.walk and animate.walk.WalkAnim),
        run   = g(animate.run  and animate.run.RunAnim),
        jump  = g(animate.jump and animate.jump.JumpAnim),
        fall  = g(animate.fall and animate.fall.FallAnim),
        climb = g(animate.climb and animate.climb.ClimbAnim),
        swim  = g(animate.swim and animate.swim.Swim),
        swimidle = g(animate.swimidle and animate.swimidle.SwimIdle),
    }
    if not YF.isPackAnim(ids.walk) then S.originalAnimPack = ids end
end

function YF.applyAnimPack(packName)
    S.currentAnimPack = packName
    if S.animSelectorLabel then S.animSelectorLabel.Text = packName end
    if packName == "Off" then
        if S.originalAnimPack and LP.Character then
            local animate = LP.Character:FindFirstChild("Animate")
            if animate then
                local function s(obj,id) if obj and id then obj.AnimationId = id end end
                s(animate.idle and animate.idle.Animation1, S.originalAnimPack.idle1)
                s(animate.idle and animate.idle.Animation2, S.originalAnimPack.idle2)
                s(animate.walk and animate.walk.WalkAnim, S.originalAnimPack.walk)
                s(animate.run  and animate.run.RunAnim,   S.originalAnimPack.run)
                s(animate.jump and animate.jump.JumpAnim, S.originalAnimPack.jump)
                s(animate.fall and animate.fall.FallAnim, S.originalAnimPack.fall)
                s(animate.climb and animate.climb.ClimbAnim, S.originalAnimPack.climb)
                s(animate.swim and animate.swim.Swim, S.originalAnimPack.swim)
                s(animate.swimidle and animate.swimidle.SwimIdle, S.originalAnimPack.swimidle)
            end
        end
        if S.animPackConnection then S.animPackConnection:Disconnect(); S.animPackConnection = nil end
        return
    end
    local pack = YF.ANIM_PACKS[packName]
    if not pack then return end
    if S.animPackConnection then S.animPackConnection:Disconnect() end
    local observedCharacter, capturedCharacter = nil, nil
    S.animPackConnection = RunService.Heartbeat:Connect(function()
        local c = LP.Character
        if not c then return end
        if c ~= observedCharacter then observedCharacter, capturedCharacter = c, nil end
        local animate = c:FindFirstChild("Animate")
        if not animate then return end
        if capturedCharacter ~= c then
            YF.saveOriginalAnims(c)
            capturedCharacter = c
        end
        if not animate then return end
        local function s(obj,id) if obj and id then obj.AnimationId = id end end
        s(animate.idle and animate.idle.Animation1, pack.idle1)
        s(animate.idle and animate.idle.Animation2, pack.idle2)
        s(animate.walk and animate.walk.WalkAnim, pack.walk)
        s(animate.run  and animate.run.RunAnim,   pack.run)
        s(animate.jump and animate.jump.JumpAnim, pack.jump)
        s(animate.fall and animate.fall.FallAnim, pack.fall)
        s(animate.climb and animate.climb.ClimbAnim, pack.climb)
        s(animate.swim and animate.swim.Swim, pack.swim)
        s(animate.swimidle and animate.swimidle.SwimIdle, pack.swimidle)
    end)
end

function YF.startAnimPack(packName)
    local char = LP.Character
    if char then
        YF.saveOriginalAnims(char)
        YF.applyAnimPack(packName)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            for _, track in ipairs(hum:GetPlayingAnimationTracks()) do track:Stop(0) end
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end
    else
        YF.applyAnimPack(packName)
    end
    S.currentAnimPack = packName
end

function YF.stopAnimPack()
    S.currentAnimPack = "Off"
    if S.animSelectorLabel then S.animSelectorLabel.Text = "Off" end
    YF.applyAnimPack("Off")
end

YF._alSaved = setmetatable({}, { __mode = "k" })
YF._alDetached = {}
YF._alAnimators = setmetatable({}, { __mode = "k" })
YF._alStoppedTracks = setmetatable({}, { __mode = "k" })
YF._alGeneration = 0
YF._alScanCancel = nil
YF._alConns = {}
YF._alLightOrig = nil
YF._alWorldOrig = {}
YF._alFlagOriginals = {}
YF._alRunning = false

-- TRIPA adaptado: somente ajustes gráficos reversíveis, sem FPS 9999,
-- alterações de rede/physics, Destroy de objetos ou varreduras repetidas.
YF.TRIPA_FLAGS = {
    {"FFlagDisablePostFx", "True"},
    {"FFlagDisablePostProcess", "True"},
    {"FIntRenderGrassDetailStrands", "0"},
    {"DFIntDebugFRMQualityLevelOverride", "1"},
    {"FIntRenderShadowIntensity", "0"},
    {"FFlagFastGPULightCulling3", "True"},
    {"DFFlagTextureQualityOverrideEnabled", "True"},
    {"DFIntTextureQualityOverride", "0"},
    {"FIntTextureQualityLevel", "0"},
    {"FFlagRemoveGlobalShadows", "True"},
    {"FFlagRenderShadowSkip", "True"},
    {"DFIntShadowMapSize", "1"},
    {"FFlagDebugDisableParticles", "True"},
    {"FIntParticleCount", "0"},
    {"DFIntMaxParticleCount", "0"},
    {"FIntMaxParticlesPerEmitter", "0"},
    {"DFIntGrassMaxDistance", "0"},
    {"FIntGrassDetail", "0"},
    {"FFlagGrassRendering", "False"},
    {"FFlagWaterReflection", "False"},
    {"FFlagWaterRefraction", "False"},
}
YF.AL_LOW_FLAGS = {
    {"DFIntClusterSenderMaxJoinBandwidthBps", "2100000000"},
    {"DFIntClusterSenderMaxUpdateBandwidthBps", "2100000000"},
    {"DFIntServerFramesBetweenJoins", "1"},
    {"DFIntRaknetBandwidthInfluxHundredthsPercentageV2", "10000"},
    {"DFIntConnectionMTUSize", "1400"},
    {"FIntRakNetResendBufferArrayLength", "1024"},
    {"DFIntRakNetNakResendDelayMsMax", "1"},
    {"DFIntWaitOnUpdateNetworkLoopEndedMS", "100"},
    {"DFIntWaitOnRecvFromLoopEndedMS", "100"},
    {"DFIntLargePacketQueueSizeCutoffMB", "1000"},
    {"DFIntSendRakNetStatsInterval", "2147483647"},
    {"DFIntRakNetLoopMs", "1"},
    {"DFIntRakNetSelectTimeoutMs", "1"},
    {"DFIntNetworkClusterPacketCacheNumParallelTasks", "8"},
    {"DFIntReplicationDataCacheNumParallelTasks", "8"},
    {"DFIntMegaReplicatorNumParallelTasks", "16"},
    {"DFIntMaxProcessPacketsStepsPerCyclic", "512"},
    {"DFIntMaxProcessPacketsStepsAccumulated", "0"},
    {"DFIntMaxProcessPacketsJobScaling", "1000"},
    {"DFIntClientPacketMaxFrameMicroseconds", "200000"},
    {"DFIntClientPacketExcessMicroseconds", "10000"},
    {"DFIntClientPacketMinMicroseconds", "1"},
    {"DFIntClientPacketMaxDelayMs", "1"},
    {"DFIntMaxWaitTimeBeforeForcePacketProcessMS", "1"},
    {"DFIntMaxFrameBufferSize", "4"},
    {"DFIntBufferCompressionThreshold", "100"},
    {"DFIntOverrideISRReplicatorStepBandwidthBytes", "131072"},
    {"DFIntTaskSchedulerJobInitThreads", "8"},
    {"DFIntTaskSchedulerJobInGameThreads", "8"},
    {"FIntTaskSchedulerAutoThreadLimit", "16"},
    {"FIntTaskSchedulerAsyncTasksMinimumThreadCount", "4"},
    {"DFIntRuntimeConcurrency", "16"},
    {"FIntSimWorldTaskQueueParallelTasks", "20"},
    {"DFIntHttpBatchLimit", "256"},
    {"FIntHttpBatchLimit", "256"},
    {"DFIntHttpCurlConnectionCacheSize", "512"},
    {"FIntDefaultMeshCacheSizeMB", "512"},
    {"DFIntMemCacheMaxCapacityMB", "256"},
    {"DFIntNumAssetsMaxToPreload", "1"},
    {"DFFlagEnableSoundPreloading", "false"},
    {"FFl
