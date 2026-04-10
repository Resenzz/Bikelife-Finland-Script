task.spawn(function()

local a=game:GetService("Players")
local b=game:GetService("UserInputService")
local c=game:GetService("TweenService")
local d=a.LocalPlayer

local e={}

local function f(t)
return string.char(table.unpack(t))
end

local T={
t={68,101,98,117,103,32,77,101,110,117},
b={66,111,111,115,116},
m={45},
x={88},
s={83,112,97,119,110},
o={77,111,116,97,114,105},
u={83,109,97,114,107,101,116}
}

local function g()
for _,v in pairs(workspace:GetChildren()) do
if v.ClassName=="Model" and v:FindFirstChild("Tuner") then
if string.find(string.lower(v.Name),string.lower(d.Name)) then
return v end end end end

local function h(i,j)
local k=j or 1
if not e.p then
e.p=i.PeakRPM
e.r=i.Redline
e.h=i.Horsepower
e.l=i.SpeedLimit
end
i.PeakRPM=16000*k
i.Redline=17000*k
i.Horsepower=110*k
i.SpeedLimit=3000*k
end

local l=Instance.new("ScreenGui",game.CoreGui)
local m=Instance.new("Frame",l)
m.Size=UDim2.new(0,280,0,360)
m.Position=UDim2.new(0.5,-140,0.5,-180)
m.BackgroundColor3=Color3.fromRGB(25,25,25)

local n=Instance.new("Frame",m)
n.Size=UDim2.new(1,0,0,32)
n.BackgroundColor3=Color3.fromRGB(20,20,20)

local o=Instance.new("TextLabel",n)
o.Size=UDim2.new(1,0,1,0)
o.BackgroundTransparency=1
o.Text=(RSZ)
o.TextColor3=Color3.new(1,1,1)
o.Font=Enum.Font.Gotham
o.TextSize=14

local p=Instance.new("TextButton",n)
p.Size=UDim2.new(0,28,0,24)
p.Position=UDim2.new(1,-65,0.5,-12)
p.BackgroundColor3=Color3.fromRGB(50,50,50)
p.Text=f(T.m)
p.TextColor3=Color3.new(1,1,1)

local q=Instance.new("TextButton",n)
q.Size=UDim2.new(0,28,0,24)
q.Position=UDim2.new(1,-32,0.5,-12)
q.BackgroundColor3=Color3.fromRGB(50,50,50)
q.Text=f(T.x)
q.TextColor3=Color3.new(1,1,1)

local r=false local s,t

n.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
r=true s=i.Position t=m.Position
i.Changed:Connect(function()
if i.UserInputState==Enum.UserInputState.End then r=false end end)
end end)

b.InputChanged:Connect(function(i)
if r and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
local u=i.Position-s
m.Position=UDim2.new(t.X.Scale,t.X.Offset+u.X,t.Y.Scale,t.Y.Offset+u.Y)
end end)

local v=Instance.new("Frame",m)
v.Position=UDim2.new(0,0,0,32)
v.Size=UDim2.new(1,0,0,32)
v.BackgroundColor3=Color3.fromRGB(30,30,30)

local function w(x,y)
local z=Instance.new("TextButton",v)
z.Size=UDim2.new(0.33,0,1,0)
z.Position=UDim2.new(y,0,0,0)
z.Text=x
z.TextColor3=Color3.new(1,1,1)
z.BackgroundColor3=Color3.fromRGB(50,50,50)
return z
end

local A=w("Main",0)
local B=w("Teleports",0.33)
local C=w("Extra",0.66)

local D=Instance.new("Frame",m)
D.Position=UDim2.new(0,0,0,64)
D.Size=UDim2.new(1,0,1,-64)
D.BackgroundTransparency=1

local E=Instance.new("Frame",D)
local F=Instance.new("Frame",D)
local G=Instance.new("Frame",D)
F.Visible=false G.Visible=false
E.BackgroundTransparency=1 F.BackgroundTransparency=1 G.BackgroundTransparency=1

A.MouseButton1Click:Connect(function() E.Visible=true F.Visible=false G.Visible=false end)
B.MouseButton1Click:Connect(function() E.Visible=false F.Visible=true G.Visible=false end)
C.MouseButton1Click:Connect(function() E.Visible=false F.Visible=false G.Visible=false end)

local H=false

local I=Instance.new("Frame",E)
I.Size=UDim2.new(0,220,0,32)
I.Position=UDim2.new(0,10,0,10)
I.BackgroundColor3=Color3.fromRGB(50,50,50)

local J=Instance.new("Frame",I)
J.Size=UDim2.new(0,26,0,26)
J.Position=UDim2.new(0,3,0.5,-13)
J.BackgroundColor3=Color3.fromRGB(200,0,0)

local K=Instance.new("TextLabel",I)
K.Size=UDim2.new(1,0,1,0)
K.BackgroundTransparency=1
K.Text=f(T.b)
K.TextColor3=Color3.new(1,1,1)

I.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
H=not H
if H then
J:TweenPosition(UDim2.new(1,-29,0.5,-13),"Out","Quad",0.2,true)
J.BackgroundColor3=Color3.fromRGB(0,170,0)
else
J:TweenPosition(UDim2.new(0,3,0.5,-13),"Out","Quad",0.2,true)
J.BackgroundColor3=Color3.fromRGB(200,0,0)
end
end end)

task.spawn(function()
while task.wait() do
local L=g()
if L then
local M=L:FindFirstChild("Tuner")
if M then
local ok,N=pcall(require,M)
if ok and N then
if H then
h(N,1)
else
if e.p then
N.PeakRPM=e.p
N.Redline=e.r
N.Horsepower=e.h
N.SpeedLimit=e.l
end
end
end
end
end
end
end)

local function O(P)
local Q=d.Character
if Q and Q:FindFirstChild("HumanoidRootPart") then
Q.HumanoidRootPart.CFrame=CFrame.new(P+Vector3.new(0,3,0))
end
end

local R={
{f(T.s),Vector3.new(-482,5,14)},
{f(T.o),Vector3.new(368,5,2559)},
{f(T.u),Vector3.new(-835,5,-410)}
}

for i,v in ipairs(R) do
local S=Instance.new("TextButton",F)
S.Size=UDim2.new(1,-20,0,32)
S.Position=UDim2.new(0,10,0,(i-1)*38)
S.Text=v[1]
S.BackgroundColor3=Color3.fromRGB(50,50,50)
S.TextColor3=Color3.new(1,1,1)
S.MouseButton1Click:Connect(function() O(v[2]) end)
end

local U=false

p.MouseButton1Click:Connect(function()
U=not U
if U then
c:Create(m,TweenInfo.new(0.25),{Size=UDim2.new(0,280,0,32)}):Play()
v.Visible=false
D.Visible=false
else
c:Create(m,TweenInfo.new(0.25),{Size=UDim2.new(0,280,0,360)}):Play()
v.Visible=true
D.Visible=true
end
end)

q.MouseButton1Click:Connect(function()
l:Destroy()
end)

end)
