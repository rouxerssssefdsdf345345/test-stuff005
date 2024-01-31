local Players = game:GetService("Players")
local StatusText = ""
local RequiredPlayers = 2
local Teams = game:GetService("Teams")
local StartTps = game.Workspace.StartRoundTPS
local EndTps = game.Workspace.EndRoundTPS

local IntermissionTime = 30
local RoundTime = 120

StatusText = "N/A"

game.Players.PlayerAdded:Connect(function(player)
    if player.Team == nil then
        player.Team = Teams.Lobby
    end
end)

local function WaitForPlayers()
    repeat
        StatusText = "Waiting for "..RequiredPlayers.." players to join."
    until #Players  > RequiredPlayers
end

local function StartRound()
    for i = 1, 10, -1 do
        StatusText = "Game running "..RoundTime.." seconds left."
    end

    for i, Player in pairs(Players) do

        if Player.Team == Teams.Lobby then
            Player.Team = Teams.Playing
        end

        local char = Player.Character
        local humRoot = char:WaitForChild("HumanoidRootPart")
        local getrando = StartTps:GetChildren()
        local rando = getrando[math.random(1, #getrando)]

        humRoot.CFrame = rando.CFrame
    end
end

local function EndRound()
    StatusText = "Intermission "..IntermissionTime.." seconds left."
    for i, Player in pairs(Players) do
        
        if Player.Team == Teams.Playing then
            Player.Team = Teams.Lobby
        end

        local char = Player.Character
        local humRoot = char:WaitForChild("HumanoidRootPart")
        local getrando = EndTps:GetChildren()
        local rando = getrando[math.random(1, #getrando)]

        humRoot.CFrame = rando.CFrame
    end
end

while true do
    WaitForPlayers()
    wait(IntermissionTime)
    StartRound()
    wait(RoundTime)
    EndRound()
end