task.spawn(function()

local _0=game:GetService("Players")
local _1=game:GetService("UserInputService")
local _2=_0.LocalPlayer

local function _3(n)return string.char(n)end

local function _4()
	for _,v in pairs(workspace:GetChildren()) do
		if v.ClassName==("Mo".."del") and v:FindFirstChild(("Tu".."ner")) then
			if string.find(string.lower(v.Name),string.lower(_2.Name)) then
				return v
			end
		end
	end
end

local function _5(c)
	local k={
		_3(80).._3(101).._3(97).._3(107).._3(82).._3(80).._3(77),
		_3(82).._3(101).._3(100).._3(108).._3(105).._3(110).._3(101),
		_3(69).._3(113).._3(80).._3(111).._3(105).._3(110).._3(116),
		_3(72).._3(111).._3(114).._3(115).._3(101).._3(112).._3(111).._3(119).._3(101).._3(114)
	}
	
	local v={
		2^14,
		2^14+1000,
		15500,
		55*2
	}
	
	for i=1,#k do c[k[i]]=v[i] end
	
	c[("Ra".."tios")]={0,14,9,6,4.5,3.2,1.8}
	c[("Au".."toUpThresh")]=16500
	c[("Au".."toDownThresh")]=3000
	c[("Li".."miter")]=false
	c[("FT".."ireFriction")]=20
	c[("RT".."ireFriction")]=22
end

local function _6(s)
	return (s:gsub(".",function(c)return string.char(c:byte()-1)end))
end

-- UI
local g=Instance.new("ScreenGui",game.CoreGui)

local m=Instance.new("Frame",g)
m.Size=UDim2.new(0,260,0,300)
m.Position=UDim2.new(0.5,-130,0.5,-150)
m.BackgroundColor3=Color3.fromRGB(25,25,25)

local t=Instance.new("Frame",m)
t.Size=UDim2.new(1,0,0,30)
t.BackgroundColor3=Color3.fromRGB(35,35,35)

local tt=Instance.new("TextLabel",t)
tt.Size=UDim2.new(1,0,1,0)
tt.BackgroundTransparency=1
tt.Text=".gg/bWVuUMTPAE | By Resenzz"
tt.TextColor3=Color3.new(1,1,1)
tt.Font=Enum.Font.Gotham
tt.TextSize=14

-- drag (pc + phone)
local d=false
local ds,sp

t.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
		d=true
		ds=i.Position
		sp=m.Position
		i.Changed:Connect(function()
			if i.UserInputState==Enum.UserInputState.End then d=false end
		end)
	end
end)

_1.InputChanged:Connect(function(i)
	if d and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
		local dx=i.Position-ds
		m.Position=UDim2.new(sp.X.Scale,sp.X.Offset+dx.X,sp.Y.Scale,sp.Y.Offset+dx.Y)
	end
end)

-- tabs
local tb=Instance.new("Frame",m)
tb.Position=UDim2.new(0,0,0,30)
tb.Size=UDim2.new(1,0,0,30)
tb.BackgroundColor3=Color3.fromRGB(30,30,30)

local function B(p,s,x)
	local b=Instance.new("TextButton",p)
	b.Size=UDim2.new(s,0,1,0)
	b.Position=x
	b.BackgroundColor3=Color3.fromRGB(40,40,40)
	b.TextColor3=Color3.new(1,1,1)
	return b
end

local b1=B(tb,0.33,UDim2.new(0,0,0,0)) b1.Text="Main"
local b2=B(tb,0.33,UDim2.new(0.33,0,0,0)) b2.Text="Teleports"
local b3=B(tb,0.34,UDim2.new(0.66,0,0,0)) b3.Text="Extra"

local c=Instance.new("Frame",m)
c.Position=UDim2.new(0,0,0,60)
c.Size=UDim2.new(1,0,1,-60)
c.BackgroundTransparency=1

local p1=Instance.new("Frame",c) p1.Size=UDim2.new(1,0,1,0) p1.BackgroundTransparency=1
local p2=Instance.new("Frame",c) p2.Size=UDim2.new(1,0,1,0) p2.BackgroundTransparency=1 p2.Visible=false
local p3=Instance.new("Frame",c) p3.Size=UDim2.new(1,0,1,0) p3.BackgroundTransparency=1 p3.Visible=false

b1.MouseButton1Click:Connect(function() p1.Visible=true p2.Visible=false p3.Visible=false end)
b2.MouseButton1Click:Connect(function() p1.Visible=false p2.Visible=true p3.Visible=false end)
b3.MouseButton1Click:Connect(function() p1.Visible=false p2.Visible=false p3.Visible=true end)

local function mk(p,y,t,f)
	local b=Instance.new("TextButton",p)
	b.Size=UDim2.new(1,-10,0,30)
	b.Position=UDim2.new(0,5,0,y)
	b.BackgroundColor3=Color3.fromRGB(50,50,50)
	b.TextColor3=Color3.new(1,1,1)
	b.Text=t
	b.Font=Enum.Font.Gotham
	b.TextSize=14
	b.MouseButton1Click:Connect(f)
end

-- boost
mk(p1,10,"Boost",function()
	local bk=_4()
	if not bk then return end
	local tn=bk:FindFirstChild(("Tu".."ner"))
	if not tn then return end
	local ok,cfg=pcall(require,tn)
	if ok then _5(cfg) end
end)

-- tp
local function tp(v)
	local c=_2.Character
	if c and c:FindFirstChild("HumanoidRootPart") then
		c.HumanoidRootPart.CFrame=CFrame.new(v+Vector3.new(0,3,0))
	end
end

local L={
{"Spawn",Vector3.new(-482,5,14)},
{"Motari",Vector3.new(368,5,2559)},
{"Talli",Vector3.new(4570,0,-80)},
{"Smarket",Vector3.new(-835,5,-410)},
{"Vesitorni",Vector3.new(105,-155,0)},
{"Korkein Katto",Vector3.new(-1219,105,-155)}
}

for i,v in ipairs(L) do
	mk(p2,(i-1)*35,v[1],function() tp(v[2]) end)
end

-- discord
mk(p3,10,"Discord",function()
	setclipboard(_6("iuuqt;00ejtdpse/hh0cXWvVNURBF"))
end)

-- speed loop
task.spawn(function()
	while task.wait() do
		local c=_2.Character
		if c and c:FindFirstChild("HumanoidRootPart") then
			if _1:IsKeyDown(Enum.KeyCode.W) or _1:IsKeyDown(Enum.KeyCode.Up) then
				c.HumanoidRootPart.Velocity*=1.07
			end
		end
	end
end)

end)
