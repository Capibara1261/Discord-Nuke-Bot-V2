-- ServerScriptService/AutoFarmDemo.server.lua
-- Exemplu pentru propriul tău joc Roblox

local Players = game:GetService("Players")

local function giveReward(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	local coins = leaderstats and leaderstats:FindFirstChild("Coins")

	if coins then
		coins.Value += 25
	end
end

local function createEnemy(position)
	local enemy = Instance.new("Part")
	enemy.Name = "FarmEnemy"
	enemy.Size = Vector3.new(4, 5, 4)
	enemy.Position = position
	enemy.Anchored = true
	enemy.Parent = workspace

	local click = Instance.new("ClickDetector")
	click.MaxActivationDistance = 20
	click.Parent = enemy

	click.MouseClick:Connect(function(player)
		giveReward(player)
		enemy:Destroy()
	end)
end

while task.wait(5) do
	createEnemy(Vector3.new(
		math.random(-100, 100),
		3,
		math.random(-100, 100)
	))
end
