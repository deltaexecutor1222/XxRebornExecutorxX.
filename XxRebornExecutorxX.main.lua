 -- 🚀 REBORN EXECUTOR - Versión Móvil
-- Optimizada para Delta Executor (Android / iOS)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RebornExecutor"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.88, 0, 0.78, 0)   -- Tamaño cómodo para móvil
MainFrame.Position = UDim2.new(0.06, 0, 0.10, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Esquina redondeada
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainFrame

-- Barra superior con nombre "Reborn Executor"
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 55)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)  -- Rojo intenso para "Reborn"
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 16)
TitleCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -110, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "🔥 REBORN EXECUTOR"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBlack
Title.Parent = TitleBar

-- Botón Cerrar (grande para móvil)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 48, 0, 48)
CloseBtn.Position = UDim2.new(1, -55, 0, 3.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TitleBar

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Editor de scripts (texto grande y legible en móvil)
local ScriptBox = Instance.new("TextBox")
ScriptBox.Size = UDim2.new(1, -20, 0.67, -70)
ScriptBox.Position = UDim2.new(0, 10, 0, 65)
ScriptBox.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
ScriptBox.TextColor3 = Color3.new(1,1,1)
ScriptBox.PlaceholderText = "-- Bienvenido a Reborn Executor\n-- Pega tu script aquí y presiona EXECUTE"
ScriptBox.TextWrapped = true
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.ClearTextOnFocus = false
ScriptBox.MultiLine = true
ScriptBox.Font = Enum.Font.Code
ScriptBox.TextSize = 18
ScriptBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 12)
BoxCorner.Parent = ScriptBox

-- Frame de botones
local ButtonFrame = Instance.new("Frame")
ButtonFrame.Size = UDim2.new(1, -20, 0, 68)
ButtonFrame.Position = UDim2.new(0, 10, 1, -78)
ButtonFrame.BackgroundTransparency = 1
ButtonFrame.Parent = MainFrame

local function CreateButton(text, color, posX, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.32, 0, 1, 0)
    btn.Position = UDim2.new(posX, 0, 0, 0)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = ButtonFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Botones principales
CreateButton("EXECUTE", Color3.fromRGB(0, 200, 80), 0, function()
    local code = ScriptBox.Text
    local success, err = pcall(function()
        loadstring(code)()
    end)
    if success then
        print("✅ Reborn Executor: Script ejecutado correctamente")
    else
        warn("❌ Error en Reborn Executor: " .. tostring(err))
    end
end)

CreateButton("CLEAR", Color3.fromRGB(200, 50, 50), 0.34, function()
    ScriptBox.Text = ""
end)

CreateButton("QUICK HUB", Color3.fromRGB(100, 60, 255), 0.68, function()
    ScriptBox.Text = [[
-- 🔥 REBORN EXECUTOR - Quick Hub
print("🔥 Reborn Executor cargado en móvil!")

-- Ejemplos rápidos (descomenta el que necesites)
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
]]
end)

print("✅ REBORN EXECUTOR (Versión Móvil) cargado correctamente!")
print("Arrastra desde la barra roja para moverlo. ¡Listo para usar en Delta!")
