return function(instance)
	if instance:FindFirstChild("Box") then
		if instance:FindFirstChild("Box"):FindFirstChild("Attachment") then
			if instance:FindFirstChild("Box"):FindFirstChild("Attachment"):FindFirstChild("ProximityPrompt") then
				instance:FindFirstChild("Box"):FindFirstChild("Attachment"):FindFirstChild("ProximityPrompt").Triggered:Connect(function(plr)
					if not plr.Character:FindFirstChildOfClass("Tool") then
						local c = script.Parent.Carbon_SEngine.DataStorage:FindFirstChild(plr.Name)
						if c then
							local p = c:GetChildren()
							for i=1,#p do
								if script.AmmoStats.ExtraMags:GetAttribute(p[i].Name) then
									if script.AmmoStats.Magazine:GetAttribute(p[i].Name) then
										p[i].Ammo.Value = script.AmmoStats.Magazine:GetAttribute(p[i].Name)
										p[i].StoredAmmo.Value = script.AmmoStats.ExtraMags:GetAttribute(p[i].Name)
									end
								end
							end
						end
					end
				end)
			end
		end
	end
end
