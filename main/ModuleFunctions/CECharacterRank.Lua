return function(plr,currentEXP)
	if plr:GetRankInGroup(15238529) == 255 then
		return "Fleet Admiral"
	elseif plr:GetRankInGroup(15238529) == 254 then
		return "Admiral"
	elseif plr:GetRankInGroup(15238529) == 253 then
		return "Vice Admiral"
	elseif plr:GetRankInGroup(15238529) == 252 then
		return "Warrant Officer Advisor"
	elseif plr:GetRankInGroup(15238529) == 251 then
		return "Enlisted Advisor"
	elseif plr:GetRankInGroup(15238529) == 30 then
		return "Tech Engineer"
	elseif plr:GetRankInGroup(15238529) == 24 then
		return "General"
	elseif plr:GetRankInGroup(15238529) == 23 then
		return "Major"
	elseif plr:GetRankInGroup(15238529) == 22 then
		return "Captain"
	elseif plr:GetRankInGroup(15238529) == 21 then
		return "Lieutenant Commander"
	elseif plr:GetRankInGroup(15238529) == 20 then
		return "First Lieutenant"
	elseif plr:GetRankInGroup(15238529) == 19 then
		return "Second Lieutenant"
	elseif plr:GetRankInGroup(15238529) == 13 then
		return "Master Warrant Officer"
	elseif plr:GetRankInGroup(15238529) == 12 then
		return "Senior Warrant Officer"
	elseif plr:GetRankInGroup(15238529) == 11 then
		return "Warrant Officer"
	elseif plr:GetRankInGroup(15238529) == 10 or (currentEXP > 94400) then
		return "Junior Warrant Officer"
	elseif plr:GetRankInGroup(15238529) == 8 or (currentEXP <= 94400 and currentEXP > 68800) then
		return "Master Chief Petty Officer"
	elseif plr:GetRankInGroup(15238529) == 7 or (currentEXP <= 68800 and currentEXP > 49600) then
		return "Chief Petty Officer II"
	elseif plr:GetRankInGroup(15238529) == 6 or (currentEXP <= 49600 and currentEXP > 30400) then
		return "Chief Petty Officer I"
	elseif plr:GetRankInGroup(15238529) == 5 or (currentEXP <= 30400 and currentEXP > 21600) then
		return "Petty Officer III"
	elseif plr:GetRankInGroup(15238529) == 4 or (currentEXP <= 21600 and currentEXP > 12800) then
		return "Petty Officer II"
	elseif plr:GetRankInGroup(15238529) == 3 or (currentEXP <= 12800 and currentEXP > 4000) then
		return "Petty Officer I"
	elseif plr:GetRankInGroup(15238529) == 2 or (currentEXP <= 4000 and currentEXP > 1250) then
		return "Seaman"
	elseif plr:GetRankInGroup(15238529) == 1 or currentEXP <= 1250 then
		return "Seaman Recruit"
	end
end
