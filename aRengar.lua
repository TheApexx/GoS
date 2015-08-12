require('Inspired')
-- Created by TheApex, check the forums for more scripts by me
Config = scriptConfig("Rengar", "Apex Rengar")
Config.addParam("Q", "Use Q At 5 Stacks", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W at 5 stacks", SCRIPT_PARAM_ONOFF, false)
Config.addParam("E", "Use E at 5 stacks", SCRIPT_PARAM_ONOFF, false)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
	local maxmana = GetMaxMana(myHero)
	local currmana = GetCurrentMana(myHero)
	local unit = GetTarget(1250, DAMAGE_PHYSICAL)
	--          numbers=spelltravelspeed, spelldelay, spellrange, spellwidth, collision(t/f), addhitbox(t/f) 
	local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),900,150,1000,200,true,true)
	if Config.Combo then
		if unit then
		if currmana == 5 then
			if CanUseSpell(myHero, _Q) == READY and Config.Q and IsInDistance(unit, 250) then
			CastSpell(_Q)
			end
			if CanUseSpell(myHero, _W) == READY and Config.W and IsInDistance(unit, 500) then
			CastSpell(_W)
			end
			if CanUseSpell(myhero, _E) == READY and Config.E and IsInDistance(unit, 1000) then
			CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
			end
		end
		if currmana < 5 then
			if CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, 650) then
			CastSpell(_Q)
			end
			if CanUseSpell(myHero, _W) == READY and IsInDistance(unit, 500) then
			CastSpell(_W)
			end
			if CanUseSpell(myHero, _E) == READY and IsInDistance(unit, 750) then
			CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
			end
		end
		end
	end
end)
