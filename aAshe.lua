require('Inspired')
--Created by TheApex
Config = scriptConfig("Ashe", "Apex Ashe")
Config.addParam("Q", "Use Q in combo", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W in combo", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Cast Ultimate", SCRIPT_PARAM_KEYDOWN, string.byte("T"))
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
	--          numbers=spelltravelspeed, spelldelay, spellrange, spellwidth, collision(t/f), addhitbox(t/f) 
	local unit = GetTarget(2100, DAMAGE_PHYSICAL)
	local stun = GotBuff(unit, "Stun")
	
	if unit then
		local RPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1600,200,2000,250,false,true)
		if CanUseSpell(myHero, _R) and Config.R and RPred.HitChance == 1 and IsInDistance(unit, 2000) then
		CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
		end
	end
    if Config.Combo then
		if unit then
			if CanUseSpell(myHero, _Q) == READY and Config.Q and GotBuff(myHero, "asheqcastready") > 0 and IsInDistance(unit, 750) then 
			CastSpell(_Q)
			end
			if stun == 0 then 
				local WPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),2000,200,1200,20,true,true)
				if CanUseSpell(myHero, _W) == READY and Config.W and WPred.HitChance == 1 then
				CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
				end
			else if stun == 1 then return end
			end
		end
	end
end)
