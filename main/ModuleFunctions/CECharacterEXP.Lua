return function(plr,currentEXP)
	if plr:GetRankInGroup(15238529) == 255 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 254 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 253 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 252 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 251 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 30 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 24 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 23 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 22 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 21 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 20 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 19 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 13 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 12 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 11 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 10 or currentEXP > 94400 then
		return tostring(currentEXP.."/INF")
	elseif plr:GetRankInGroup(15238529) == 8 or (currentEXP <= 94400 and currentEXP > 68800) then
		return tostring(currentEXP.."/94401")
	elseif plr:GetRankInGroup(15238529) == 7 or (currentEXP <= 68800 and currentEXP > 49600) then
		return tostring(currentEXP.."/68801")
	elseif plr:GetRankInGroup(15238529) == 6 or (currentEXP <= 49600 and currentEXP > 30400) then
		return tostring(currentEXP.."/49601")
	elseif plr:GetRankInGroup(15238529) == 5 or (currentEXP <= 30400 and currentEXP > 21600) then
		return tostring(currentEXP.."/30401")
	elseif plr:GetRankInGroup(15238529) == 4 or (currentEXP <= 21600 and currentEXP > 12800) then
		return tostring(currentEXP.."/21601")
	elseif plr:GetRankInGroup(15238529) == 3 or (currentEXP <= 12800 and currentEXP > 4000) then
		return tostring(currentEXP.."/12801")
	elseif plr:GetRankInGroup(15238529) == 2 or (currentEXP <= 4000 and currentEXP > 1250) then
		return tostring(currentEXP.."/4001")
	elseif plr:GetRankInGroup(15238529) == 1 or currentEXP <= 1250 then
		return tostring(currentEXP.."/1251")
	end
end
