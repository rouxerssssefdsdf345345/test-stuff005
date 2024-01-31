--Services
local SG = game:GetService("StarterGui")
local Players = game:GetService("Players")
local Plr = game:GetService("Players"):GetPlayers()

--Main thing!
local Maingui = Instance.new("ScreenGui", SG)
Maingui.Name = "ProtoUI"
Maingui.IgnoreGuiInset = true
local MAINFRAME = Instance.new("Frame", Maingui)
MAINFRAME.ZIndex = Enum.ZIndexBehavior.Sibling
MAINFRAME:TweenSize(UDim2.new(500, 700))
MAINFRAME:TweenPosition(UDim2.new(500, 500))
MAINFRAME.BorderSizePixel = 1
MAINFRAME.BorderColor3 = Color3.fromRGB(58, 44, 255)
MAINFRAME.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
local MFN = Instance.new("TextLabel", MAINFRAME)
MFN:TweenSize(UDim2.new(40, 697))
MFN:TweenPosition(UDim2.new(0, 5))
MFN.BorderSizePixel = 1
MFN.BackgroundColor3 = Color3.fromRGB(35,35,35)
MFN.BorderColor3 = Color3.fromRGB(58, 44, 255)
for i, player in pairs(Plr) do
    if player.Name == "A_RandomProto0" then
            MFN.Text = "Welcome owner to your ProtoUI"
    else
        MFN.Text = "Welcome "..player.Name.." to ProtoUI"
    end
end
MFN.TextScaled = true
MFN.TextColor3 = Color3.fromRGB(255, 255 ,255)
local PagePickerFrame = Instance.new("Frame", MAINFRAME)
PagePickerFrame:TweenSize(UDim2.new(10, 640))
PagePickerFrame:TweenPosition(UDim2.new(0, 690))
PagePickerFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PagePickerFrame.BorderColor3 = Color3.fromRGB(58, 55, 255)
local PagePickerFrameUILIST = Instance.new("UIListLayout", PagePickerFrame)
PagePickerFrameUILIST.Padding = .5

--page buttons
local HomePagePickerButton = Instance.new("TextButton", PagePickerFrame)
HomePagePickerButton.Text = "Home"
HomePagePickerButton:TweenSize(UDim2.new(100, 100))
HomePagePickerButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
HomePagePickerButton.TextScaled = true

--Pages
local homePage = Instance.new("Frame",MAINFRAME)
homePage:TweenSize(UDim2.new(400, 400))
homePage.BackgroundColor3 = Color3.fromRGB(28, 28, 28)

--making buttons thingys work
HomePagePickerButton.MouseButton1Down:Connect(function()
    homePage.Visible = true
end)