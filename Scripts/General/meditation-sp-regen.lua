-- Add a bit of sp regeneration by meditation skill

function calculateMeditationSPRegen(mastery, fullSP)
	output = math.ceil(fullSP^0.5 * mastery^1.5/50)
	return math.max(output, mastery)
end

function events.Regeneration(t)
	v = Party[t.PlayerIndex]
	
	r,m = SplitSkill(v.Skills[const.Skills.Meditation])
	cap = v:GetFullSP()
	cur = v.SpellPoints
	gain = t.SP + calculateMeditationSPRegen(m, cap)
	v.SpellPoints = math.min(cap,cur+gain)
end
