local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FloatingBallGUI"

local ball = Instance.new("TextButton", gui)
ball.Size = UDim2.new(0, 50, 0, 50)
ball.Position = UDim2.new(0, 20, 0.5, -25)
ball.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ball.Text = "Open"
ball.TextSize = 24
ball.TextColor3 = Color3.new(1, 1, 1)
ball.Active = true
ball.Draggable = true
Instance.new("UICorner", ball).CornerRadius = UDim.new(1, 0)

local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 180, 0, 210)
panel.Position = UDim2.new(0, 80, 0.5, -105)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.Visible = false
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 8)

local function newButton(text, posY)
	local btn = Instance.new("TextButton", panel)
	btn.Size = UDim2.new(1, -20, 0, 36)
	btn.Position = UDim2.new(0, 10, 0, posY)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 18
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	return btn
end

local openEditorBtn = newButton("Abrir Editor", 10)
local copyPosBtn = newButton("Copy Position", 56)
local assistBtn = newButton("Abrir Assistente", 102)
local tipsBtn = newButton("🔍 ❔dicas", 148)

ball.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

openEditorBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/isaac182482/SupremeSystemAssistantui/refs/heads/main/szipp.lua"))()
end)

copyPosBtn.MouseButton1Click:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") and setclipboard then
		local pos = char.HumanoidRootPart.Position
		setclipboard(tostring(pos))
	end
end)

assistBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/isaac182482/Ferramentas-UI/refs/heads/main/assistenteui.lua"))()
end)

-- DICAS
local tutorialFrame = Instance.new("Frame", gui)
tutorialFrame.Size = UDim2.new(0, 280, 0, 240)
tutorialFrame.Position = UDim2.new(0.5, -140, 0.5, -120)
tutorialFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
tutorialFrame.Visible = false
Instance.new("UICorner", tutorialFrame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", tutorialFrame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Text = "Dicas Rápidas"

local scroll = Instance.new("ScrollingFrame", tutorialFrame)
scroll.Size = UDim2.new(1, -10, 1, -60)
scroll.Position = UDim2.new(0, 5, 0, 55)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local list = Instance.new("UIListLayout", scroll)
list.Padding = UDim.new(0, 6)

local dicas = {
	{
		titulo = "game.Players.LocalPlayer",
		explicacao = "Retorna o jogador local (você). Pode ser usado para acessar a UI ou o personagem do player."
	},
	{
		titulo = "Instance.new",
		explicacao = "Cria uma nova instância como Frame, TextLabel, etc. Muito usado em UIs."
	},
	{
		titulo = "wait()",
		explicacao = "Pausa o script por alguns segundos. Útil para aguardar algo acontecer."
	}
}

for _, dica in ipairs(dicas) do
	local dBtn = Instance.new("TextButton", scroll)
	dBtn.Size = UDim2.new(1, -10, 0, 34)
	dBtn.Text = dica.titulo
	dBtn.TextSize = 16
	dBtn.Font = Enum.Font.SourceSansBold
	dBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	dBtn.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", dBtn).CornerRadius = UDim.new(0, 6)

	dBtn.MouseButton1Click:Connect(function()
		title.Text = dica.titulo .. "\n\n" .. dica.explicacao
	end)
end

tipsBtn.MouseButton1Click:Connect(function()
	tutorialFrame.Visible = not tutorialFrame.Visible
end)
