local SimpleTween = require(script.Parent.SimpleTween)
return function(plr)
	if plr:GetAttribute("Admin") == nil or plr:GetAttribute("Admin") == false then
		plr:SetAttribute("Admin",true)
		local tag = script.AdminRanktag.RankUI:Clone()
		tag.Parent = plr.Character:FindFirstChild("Head")
		local highlight = Instance.new("Highlight")
		highlight.Parent = plr.Character
		highlight.DepthMode = Enum.HighlightDepthMode.Occluded
		highlight.FillTransparency = 1
		tag.Username.Text = plr.Name
		tag.GroupRank.Text = plr:GetRoleInGroup(17169278)
		if plr:GetRoleInGroup(17169278):find("DEV") then
			tag.GroupRank.TextColor3 = Color3.fromHex("8b00ff")
		elseif plr:GetRoleInGroup(17169278):find("MOD") then
			tag.GroupRank.TextColor3 = Color3.fromHex("00bfff")
		elseif plr:GetRankInGroup(17169278)==7 then
			tag.GroupRank.TextColor3 = Color3.fromHex("ff8000")
		elseif plr:GetRankInGroup(17169278)==8 then
			tag.GroupRank.TextColor3 = Color3.fromHex("ffa33f")
		elseif plr:GetRankInGroup(17169278)==9 then
			tag.GroupRank.TextColor3 = Color3.fromHex("ffb266")
		elseif plr:GetRankInGroup(17169278)==10 then		
			tag.GroupRank.TextColor3 = Color3.fromHex("ffc199")
		elseif plr:GetRankInGroup(17169278)==253 then		
			tag.GroupRank.TextColor3 = Color3.fromHex("cfa529")
		elseif plr:GetRankInGroup(17169278)==254 then		
			tag.GroupRank.TextColor3 = Color3.fromHex("e6b82e")
		elseif plr:GetRankInGroup(17169278)==255 then		
			tag.GroupRank.TextColor3 = Color3.fromHex("ffcc33")
		end
		if plr.UserId == 21490931 then
			local f1 = coroutine.create(function()
				while plr:GetAttribute("Admin") == true do
					SimpleTween(highlight, 1, "Linear", "Out", { OutlineColor = Color3.new(0.333333, 1, 1) })
					SimpleTween(highlight, 1, "Linear", "Out", { OutlineColor = Color3.new(0.2, 0.4, 1) })
				end
			end)
			coroutine.resume(f1)
			local f2 = coroutine.create(function()
				while plr:GetAttribute("Admin") == true do
					SimpleTween(tag.Username, 1, "Linear", "Out", { TextColor3 = Color3.new(0.333333, 1, 1) })
					SimpleTween(tag.Username, 1, "Linear", "Out", { TextColor3 = Color3.new(0.2, 0.4, 1) })
				end
			end)
			coroutine.resume(f2)
		else
			local f1 = coroutine.create(function()
				while plr:GetAttribute("Admin") == true do
					SimpleTween(highlight, 1, "Linear", "Out", { OutlineColor = Color3.new(1, 1, 1) })
					SimpleTween(highlight, 1, "Linear", "Out", { OutlineColor = Color3.new(0.309804, 0.309804, 0.372549) })
				end
			end)
			coroutine.resume(f1)
			local f2 = coroutine.create(function()
				while plr:GetAttribute("Admin") == true do
					SimpleTween(tag.Username, 1, "Linear", "Out", { TextColor3 = Color3.new(1, 1, 1) })
					SimpleTween(tag.Username, 1, "Linear", "Out", { TextColor3 = Color3.new(0.568627, 0.568627, 0.568627) })
				end
			end)
			coroutine.resume(f2)
		end
	else
		plr:SetAttribute("Admin",false)
	end
end
