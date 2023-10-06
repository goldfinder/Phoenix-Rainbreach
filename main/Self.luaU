--[Variables]

local TService = game:GetService("TweenService")
local DStore = game:GetService("DataStoreService")
local CEData = DStore:GetDataStore("CE_Group")
local DLAData= DStore:GetDataStore("DLA_Group")
local SCPData= DStore:GetDataStore("SCP_Group")
local SData =  DStore:GetDataStore("SData")
local Revent = game.ReplicatedStorage.MainRE
local Bevent = game.ReplicatedStorage.MainBE


game.StarterGui.Loading.Enabled = true

--[Functions]

local Copy = require(script.ModuleFunctions.Copy)
local SimpleTween = require(script.ModuleFunctions.SimpleTween)
local GiveGear = require(script.ModuleFunctions.GiveGear)
local postwebhook = require(script.ModuleFunctions.PostWebHook)
local opendoor = require(script.ModuleFunctions.OpenDoor)
local doorkeycheck = require(script.ModuleFunctions.DoorKeyCheck)
--local DoorProxyCheck = require(script.ModuleFunctions.DoorProxyCheck)
local doorcheck = require(script.ModuleFunctions.DoorCheck)
local getRandomLetter = require(script.ModuleFunctions.GetRandomLetter)
local checkequipmentgiver = require(script.ModuleFunctions.CheckEquipmentGiver)
local Give = require(script.ModuleFunctions.GiveTools)
local GiveUniform = require(script.ModuleFunctions.GiveUniform)
local admintoggle = require(script.ModuleFunctions.AdminToggle)
local CECharacterRank = require(script.ModuleFunctions.CECharacterRank)
local CECharacterEXP = require(script.ModuleFunctions.CECharacterEXP)
local SECharacterRank = require(script.ModuleFunctions.SECharacterRank)
local SECharacterEXP = require(script.ModuleFunctions.SECharacterEXP)
local SCPCharacterRank = require(script.ModuleFunctions.SCPCharacterRank)
local SCPCharacterEXP = require(script.ModuleFunctions.SCPCharacterEXP)
local hazardset = require(script.ModuleFunctions.HazardSet)
local RDS = require(script.ModuleFunctions.RDS)
local ammoboxfunctionality = require(script.ModuleFunctions.AmmoboxFunctionality)

--[AEXPLOIT-Kicks]

function kick(datasent,type,number,flags,plr)
	local data = {}
	data['message2'] = {}
	data['message2']['text'] = "???"
	data['message2']['name'] = "Exploit"
	data["Real Game"] = false
	if number == 1 then
		plr:Kick("Exploit detected.  Unidentified CallID")
		data['message2']['text'] = "Unidentified CallID"
	elseif number == 2 then
		plr:Kick("Exploit detected.  Unidentified CallMSG")
		data['message2']['text'] = "Unidentified CallMSG"
	end
	data['message1'] = {}
	data['message1']['name'] = "Player Name"
	if plr == nil then
		data['message1']['text'] = "No player found."
	else
		data['message1']['text'] = plr.Name..", "..plr:GetRoleInGroup(17169278).." ("..plr:GetRankInGroup(17169278)..")"
	end
	if game:GetService("RunService"):IsStudio() then
		data["Real Game"] = true
	end
	if flags then
		if flags >= 0 then
			data["Flags"] = flags
		end
	end
	data["DATASENT"] = datasent
	postwebhook(data,"Exploit","GET")
end

--[Bindable Events]

--NOTES:  TRUSTED1 = Weapons/Tools, TRUSTED2 = Kits, TRUSTED3 = ???,
--  TRUSTED4 = Personal Rain Denial Device
--  TRUSTED5 = Accessory Remove

Bevent.Event:Connect(function(...)
	local data = {...}
	if data[1] == "TRUSTED1" then
		Give("SingleGive",data[2],data[3])
	end
end)


function removehats(plr)
	local d = plr.Character:GetChildren() 
	for i=1, #d do 
		if (d[i].className == "Accessory") then 
			d[i]:remove() 
		end 
	end
end

--[Hazard Loading]

local hazard = game.Workspace.ENV_HAZ.ELECTRICUTION:GetChildren()
for i=1,#hazard do
	hazardset(hazard[i],"Electrical")
end
game.Workspace.ENV_HAZ.ELECTRICUTION.ChildAdded:Connect(function(child)
	hazardset(child,"Electrical")
end)

--[RDS]

local RDSEVENTS = game.Workspace.FUNCTIONAL.RDS:GetChildren()
for i=1,#RDSEVENTS do
	RDS(RDSEVENTS[i])
end
game.Workspace.FUNCTIONAL.RDS.ChildAdded:Connect(function(child)
	RDS(child)
end)

--[Menus]

Revent.OnServerEvent:Connect(function(plr,CallID,CallMSG,ext1,ext2,ext3)
	print(plr.UserId,CallID,CallMSG)
	if CallID == 245 then
		if CallMSG == "FLoading-7gZbkkFZUwuhao1LeXiM" then
			plr.PlayerGui["Character Selection"].Enabled = true
			if plr:IsInGroup(9349302) or plr.UserId == 1383535741 then
				local i = script.TextButton:Clone()
				plr.PlayerGui["Character Selection"].Frame.DLA.DLA.Frame:Destroy()
				i.Parent=plr.PlayerGui["Character Selection"].Frame.DLA.DLA
			end
			local success, currentEXP = pcall(function()
				return CEData:GetAsync(plr.UserId.." PDATA")
			end)
			if not success or currentEXP == nil then
				local c = script.NC:Clone()
				c.Parent = plr.PlayerGui["Character Selection"].Frame.CE.DLA.TextButton
				plr.PlayerGui["Character Selection"].Frame.CE.DLA.TextButton.Text = "Create Character"
			elseif success and currentEXP then
				local c = script.Information:Clone()
				c.Frame["Group Rank"].Text = CECharacterRank(plr,currentEXP)
				c.Frame["EXP Bar"].Frame.TEXT.Text =CECharacterEXP(plr,currentEXP)
				c.Parent = plr.PlayerGui["Character Selection"].Frame.CE.DLA.TextButton
			end
			local success, currentEXP = pcall(function()
				return SCPData:GetAsync(plr.UserId.." PDATA")
			end)
			if not success or currentEXP == nil then
				local c = script.NC:Clone()
				c.Parent = plr.PlayerGui["Character Selection"].Frame.SCP.DLA.TextButton
				plr.PlayerGui["Character Selection"].Frame.SCP.DLA.TextButton.Text = "Create Character"
			elseif success and currentEXP then
				local c = script.Information:Clone()
				c.Frame["Group Rank"].Text = SCPCharacterRank(plr,currentEXP)
				c.Frame["EXP Bar"].Frame.TEXT.Text = SCPCharacterEXP(plr,currentEXP)
				c.Parent = plr.PlayerGui["Character Selection"].Frame.SCP.DLA.TextButton
			end
		else
			local text = "`CMSG: "
			text = text..CallMSG
			text = text.."\nCID: "..CallID
			if ext1 ~= nil then
				text = text.."\nDAT1 "..ext1
			end
			if ext2 ~= nil then
				text = text.."\nDAT2 "..ext2
			end
			if ext3 ~= nil then
				text = text.."\nDAT3 "..ext3
			end
			text = text.."`"
			kick(text,"Menu",2,plr)
		end
	elseif CallID == 2994 then
		if CallMSG == "DLA-4akekTWaPmVOV52drEye" then
			plr.PlayerGui["Character Selection"].Enabled = false
			plr:SetAttribute("Team","DLA")
			local chr = plr.Character
			local success, LocData = pcall(function()
				return DLAData:GetAsync(plr.UserId.." LDATA")
			end)
			if success and LocData then
				chr:SetAttribute("TeleportOveride",true)
				print(LocData)
				chr:PivotTo(LocData)
			else
				local spawns = game.ServerStorage.Spawns.DLA:GetChildren()
				local tploc = math.random(1,#spawns)
				chr:PivotTo(CFrame.new(spawns[tploc].Position))
			end
			local success, BarData = pcall(function()
				return DLAData:GetAsync(plr.UserId.." BDATA")
			end)
			if success and BarData then
				chr:SetAttribute("BarOveride",true)
				local tab = string.split(BarData,"|")
				chr:SetAttribute("Food",tonumber(tab[1]))
				chr:SetAttribute("Water",tonumber(tab[2]))
				chr:SetAttribute("Stamina",tonumber(tab[3]))
				chr:SetAttribute("Sanity",tonumber(tab[4]))
				chr:SetAttribute("Blink",tonumber(tab[5]))
			end
			--FINAL THING
			plr:SetAttribute("Spawned",true)
			Revent:FireClient(plr,"EChat")
		elseif CallMSG == "CE-6OVsvUy0DuB8PQgDnX7J" then
			plr.PlayerGui["Character Selection"].Enabled = false
			plr:SetAttribute("Team","CE")
			local chr = plr.Character
			local success, LocData = pcall(function()
				return CEData:GetAsync(plr.UserId.." LDATA")
			end)
			if success and LocData then
				chr:SetAttribute("TeleportOveride",true)
				print(LocData)
				chr:PivotTo(LocData)
			else
				local spawns = game.ServerStorage.Spawns.CE:GetChildren()
				local tploc = math.random(1,#spawns)
				chr:PivotTo(CFrame.new(spawns[tploc].Position))
			end
			local success, BarData = pcall(function()
				return CEData:GetAsync(plr.UserId.." BDATA")
			end)
			if success and BarData then
				chr:SetAttribute("BarOveride",true)
				local tab = string.split(BarData,"|")
				chr:SetAttribute("Food",tonumber(tab[1]))
				chr:SetAttribute("Water",tonumber(tab[2]))
				chr:SetAttribute("Stamina",tonumber(tab[3]))
				chr:SetAttribute("Sanity",tonumber(tab[4]))
				chr:SetAttribute("Blink",tonumber(tab[5]))
			end
			--FINAL THING
			plr:SetAttribute("Spawned",true)
			Revent:FireClient(plr,"EChat")
		elseif CallMSG == "SCP-mo9AI21zKmUYwHI3yoM0" then
			plr.PlayerGui["Character Selection"].Enabled = false
			plr:SetAttribute("Team","SCP")
			--FINAL THING
			plr:SetAttribute("Spawned",true)
			Revent:FireClient(plr,"EChat")
			--elseif CallMSG == "SPECIAL-dv6AJLwZ6xecRWgWizmv" then
			--DOES NOTHING YET.
		else
			local text = "`CMSG: "
			text = text..CallMSG
			text = text.."\nCID: "..CallID
			if ext1 ~= nil then
				text = text.."\nDAT1 "..ext1
			end
			if ext2 ~= nil then
				text = text.."\nDAT2 "..ext2
			end
			if ext3 ~= nil then
				text = text.."\nDAT3 "..ext3
			end
			text = text.."`"
			kick(text,"Menu",2,plr)
		end
	elseif CallID == 1002442 then
		local chr = plr.Character
		if CallMSG == "Keyboard" then
			if ext1 == Enum.KeyCode.One then --Primary
			elseif ext1 == Enum.KeyCode.Two then -- Secondary
			elseif ext1 == Enum.KeyCode.Three then -- Melee
			elseif ext1 == Enum.KeyCode.Four then -- Keycards
			elseif ext1 == Enum.KeyCode.Five then -- Admin Stuff
			elseif ext1 == Enum.KeyCode.LeftBracket then -- Radio
			elseif ext1 == Enum.KeyCode.H and plr:GetAttribute("Spawned") == true then
				chr:SetAttribute("ManBlink",true)
			elseif ext1 == Enum.KeyCode.Tab then
				if plr.Character:GetAttribute("IPTB") ~= true then
					if plr.Character:GetAttribute("InventoryPosition") then
						plr.Character:SetAttribute("InventoryPosition",false)
						plr.PlayerGui.Inventory.Inventory:TweenPosition(UDim2.new(.3,0,0,-20),Enum.EasingDirection.Out,Enum.EasingStyle.Back,1)
					else
						plr.Character:SetAttribute("InventoryPosition",true)
						plr.PlayerGui.Inventory.Inventory:TweenPosition(UDim2.new(.3,0,-.2,-20),Enum.EasingDirection.In,Enum.EasingStyle.Back,1)
					end
					local f = coroutine.create(function()
						plr.Character:SetAttribute("IPTB",true)
						wait(1)
						plr.Character:SetAttribute("IPTB",false)
					end)
					coroutine.resume(f)
				end
			elseif ext1 == Enum.KeyCode.Backquote then
				chr:SetAttribute("ToolActive",false)
				chr:SetAttribute("ActiveID",0)
				chr:SetAttribute("ActiveType",0)
				local lasttool = chr:FindFirstChildOfClass("Tool")
				if lasttool then
					lasttool.Parent = plr.Backpack
				end
			elseif ext1 == Enum.KeyCode.Equals then --Team Info/Character Info
			end
		elseif CallMSG == "Mouse" then
		else
			local text = "`CMSG: "
			text = text..CallMSG
			text = text.."\nCID: "..CallID
			if ext1 ~= nil then
				text = text.."\nDAT1 "..ext1
			end
			if ext2 ~= nil then
				text = text.."\nDAT2 "..ext2
			end
			if ext3 ~= nil then
				text = text.."\nDAT3 "..ext3
			end
			text = text.."`"
			kick(text,"Controls",1,plr)
		end
	else
		local text = "`CMSG: "
		text = text..CallMSG
		text = text.."\nCID: "..CallID
		if ext1 ~= nil then
			text = text.."\nDAT1 "..ext1
		end
		if ext2 ~= nil then
			text = text.."\nDAT2 "..ext2
		end
		if ext3 ~= nil then
			text = text.."\nDAT3 "..ext3
		end
		text = text.."`"
		kick(text,"Menu",1,plr)
	end
end)

--[MAP STUFF]

--Ammo
local j = game.Workspace.AMMOBOX:GetChildren()
for i=1,#j do
	ammoboxfunctionality(j[i])
end
game.Workspace.AMMOBOX.ChildAdded:Connect(function(instance)
	ammoboxfunctionality(instance)
end)

--Gear Kits

local j = game.Workspace.Equipment.Kit.ZENX.SquadLeader:GetChildren()
for i=1,#j do
	checkequipmentgiver(j[i],"SL")
end
local j = game.Workspace.Equipment.Kit.ZENX.Rifleman:GetChildren()
for i=1,#j do
	checkequipmentgiver(j[i],"R")
end
local j = game.Workspace.Equipment.Kit.Juggernaut:GetChildren()
for i=1,#j do
	checkequipmentgiver(j[i],"JUG")
end
game.Workspace.Equipment.Kit.ZENX.SquadLeader.ChildAdded:Connect(function(instance)
	checkequipmentgiver(instance,"SL")
end)
game.Workspace.Equipment.Kit.ZENX.Rifleman.ChildAdded:Connect(function(instance)
	checkequipmentgiver(instance,"R")
end)
game.Workspace.Equipment.Kit.Juggernaut.ChildAdded:Connect(function(instance)
	checkequipmentgiver(instance,"JUG")
end)

--Doors

--FORTAZERETH AUTH0
local j = game.Workspace.Doors.FORTAZERETH.Auth0:GetChildren()
for i=1,#j do
	doorcheck(j[i],"DLA",0,"AUTH")
end
game.Workspace.Doors.FORTAZERETH.Auth0.ChildAdded:Connect(function(instance)
	doorcheck(instance,"DLA",0,nil)
end)
--FORTAZERETH AUTH1
local j = game.Workspace.Doors.FORTAZERETH.Auth1:GetChildren()
for i=1,#j do
	doorcheck(j[i],"DLA",1,nil)
end
game.Workspace.Doors.FORTAZERETH.Auth1.ChildAdded:Connect(function(instance)
	doorcheck(instance,"DLA",1,nil)
end)
--FORTAZERETH AUTH2
local j = game.Workspace.Doors.FORTAZERETH.Auth2:GetChildren()
for i=1,#j do
	doorcheck(j[i],"DLA",2,nil)
end
game.Workspace.Doors.FORTAZERETH.Auth2.ChildAdded:Connect(function(instance)
	doorcheck(instance,"DLA",2,nil)
end)
--FORTAZERETH AUTH3
local j = game.Workspace.Doors.FORTAZERETH.Auth3:GetChildren()
for i=1,#j do
	doorcheck(j[i],"DLA",3,nil)
end
game.Workspace.Doors.FORTAZERETH.Auth3.ChildAdded:Connect(function(instance)
	doorcheck(instance,"DLA",3,nil)
end)
--FORTAZERETH AUTH4
local j = game.Workspace.Doors.FORTAZERETH.Auth4:GetChildren()
for i=1,#j do
	doorcheck(j[i],"DLA",4,nil)
end
game.Workspace.Doors.FORTAZERETH.Auth4.ChildAdded:Connect(function(instance)
	doorcheck(instance,"DLA",4,nil)
end)
--FORTAZERETH AUTH5
local j = game.Workspace.Doors.FORTAZERETH.Auth5:GetChildren()
for i=1,#j do
	doorcheck(j[i],"DLA",5,nil)
end
game.Workspace.Doors.FORTAZERETH.Auth5.ChildAdded:Connect(function(instance)
	doorcheck(instance,"DLA",5,nil)
end)
--FORTAZERETH AUTH6
local j = game.Workspace.Doors.FORTAZERETH.Auth6:GetChildren()
for i=1,#j do
	doorcheck(j[i],"DLA",6,nil)
end
game.Workspace.Doors.FORTAZERETH.Auth6.ChildAdded:Connect(function(instance)
	doorcheck(instance,"DLA",6,nil)
end)
--FORTAZERETH AUTHA
local j = game.Workspace.Doors.FORTAZERETH.AuthA:GetChildren()
for i=1,#j do
	doorcheck(j[i],"DLA",7,nil)
end
game.Workspace.Doors.FORTAZERETH.AuthA.ChildAdded:Connect(function(instance)
	doorcheck(instance,"DLA",7,nil)
end)


--[PLR STUFF]

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(chr)
		repeat wait() until plr:GetAttribute("Spawned") == true
		if chr:GetAttribute("BarOveride") then
		else
			chr:SetAttribute("FoodDeteriorate",0)
			chr:SetAttribute("WaterDeteriorate",0)
			chr:SetAttribute("Food",100)
			chr:SetAttribute("Water",100)
			chr:SetAttribute("Stamina",100)
			chr:SetAttribute("Sanity",100)
			chr:SetAttribute("Blink",100)
		end
		plr.Character:SetAttribute("InventoryPosition",true)
		plr.PlayerGui:WaitForChild("Inventory")
		wait()
		plr.PlayerGui.Inventory.Inventory.Position=UDim2.new(.3,0,-.2,-20)
		chr:SetAttribute("Radio",false)
		chr:SetAttribute("PGID",1)
		chr:SetAttribute("Nearby173",false)
		chr:SetAttribute("ManBlink",false)
		chr:SetAttribute("ToolActive",false)
		chr:SetAttribute("ActiveID",0)
		chr:SetAttribute("ActiveType",0)
		if plr:GetAttribute("Spawned") == true and chr:GetAttribute("TeleportOveride") then
			if plr:GetAttribute("Team") == "DLA" then
				local spawns = game.ServerStorage.Spawns.DLA:GetChildren()
				local tploc = math.random(1,#spawns)
				wait()
				chr:PivotTo(CFrame.new(spawns[tploc].Position))
			end
		end
	end)
	script.BindableEvents.SelfLoop.Event:Connect(function(EName,type)

	end)
	--Radio Stuff
	plr.Chatted:Connect(function(msg)
		if msg:lower() == string.lower("!admin") then
			if plr:GetRankInGroup(17169278) >= 3 then
				admintoggle(plr)
			end
		elseif plr.Character:GetAttribute("Radio") then
			--NOT CREATED
		end
	end)
end)

--Player While Loop

while true do
	wait(.1)
	local plrlist = game.Players:GetChildren()
	for i=1,#plrlist do
		coroutine.resume(coroutine.create(function()
			local plr = plrlist[i]
			if plr:GetAttribute("Spawned") == true then
				local chr = plrlist[i].Character
				if plr:GetAttribute("Admin") ~= true then
					chr:SetAttribute("Blink",chr:GetAttribute("Blink")-1)
					chr:SetAttribute("FoodDeteriorate",chr:GetAttribute("FoodDeteriorate")+1)
					chr:SetAttribute("WaterDeteriorate",chr:GetAttribute("WaterDeteriorate")+1)  
				end    
				--Disabled
				if chr:GetAttribute("Blink") == 0 and chr:GetAttribute("Nearby173") == true then
					chr:SetAttribute("ManBlink",true)
				elseif chr:GetAttribute("Blink") <= 50 and chr:GetAttribute("Nearby173") == false then
					chr:SetAttribute("ManBlink",true)
				end
				if chr:GetAttribute("ManBlink") == true then
					chr:SetAttribute("ManBlink",false)
					chr:setAttribute("Blink",100)
					local f = coroutine.create(function()
						plr.PlayerGui.PlayerUI.Blink.Visible = true
						wait(.125)
						plr.PlayerGui.PlayerUI.Blink.Visible = false
					end)
					coroutine.resume(f)
				end
				if chr:GetAttribute("FoodDeteriorate") >= 325 then
					chr:SetAttribute("FoodDeteriorate",0)
					local f = math.random(1,4)
					if f == 1 and chr:GetAttribute("Food") > 0 then
						chr:SetAttribute("Food",chr:GetAttribute("Food")-1)
					else
						plr.Character.Humanoid.Health -= 1 
					end
				end
				if chr:GetAttribute("WaterDeteriorate") >= 225 then
					chr:SetAttribute("WaterDeteriorate",0)
					local f = math.random(1,2)
					if f == 1 and chr:GetAttribute("Water") > 0 then
						chr:SetAttribute("Water",chr:GetAttribute("Water")-1)
					else
						plr.Character.Humanoid.Health -= 1 
					end
				end
			end
		end))
	end
end
