local GiveUniform = require(script.Parent.GiveUniform)
--local GiveTools = require(script.Parent.GiveTools)
return function(locker:Instance,type:string)
	if locker:FindFirstChild("Attachment") then
		if locker:FindFirstChild("Attachment"):FindFirstChild("ProximityPrompt") then
			local function normalgear(plr)
				GiveUniform(plr,"ZENX","ZENX",nil)
				--GiveTools("Kit","Zenx",nil,plr)
			end
			if type == "SL" then
				locker:FindFirstChild("Attachment"):FindFirstChild("ProximityPrompt").Triggered:Connect(function(plr)
					normalgear(plr)
					GiveUniform(plr,nil,nil,"ZENXSL")
					plr.Character.Humanoid.MaxHealth += 2000
					plr.Character.Humanoid.Health += 2000
				end)
			elseif type == "R" then
				locker:FindFirstChild("Attachment"):FindFirstChild("ProximityPrompt").Triggered:Connect(function(plr)
					normalgear(plr)
					GiveUniform(plr,nil,nil,"ZENXR")
					plr.Character.Humanoid.MaxHealth += 150
					plr.Character.Humanoid.Health += 150
				end)
			elseif type == "JUG" then
				locker:FindFirstChild("Attachment"):FindFirstChild("ProximityPrompt").Triggered:Connect(function(plr)
					GiveUniform(plr,"Whiteout","Whiteout","Juggernaut")
					--GiveTools("Kit","Juggernaut",nil,plr)
				end)
			end
		end
	end
end
