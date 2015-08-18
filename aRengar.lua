require('Inspired')
-- Created by TheApex, check the forums for more scripts by me
Config = scriptConfig("Rengar", "Apex Rengar")
Config.addParam("Q", "Use Q At 5 Stacks", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W at 5 stacks", SCRIPT_PARAM_ONOFF, false)
Config.addParam("E", "Use E at 5 stacks", SCRIPT_PARAM_ONOFF, false)
Config.addParam("WHeal", "Use W if hp<25%", SCRIPT_PARAM_ONOFF, false)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
	local maxmana = GetMaxMana(myHero)
	local currhp = GetCurrentHP(myHero)
	local maxhp = GetMaxHP(myHero)
	local currmana = GetCurrentMana(myHero)
	local unit = GetTarget(1250, DAMAGE_PHYSICAL)
	if currmana == 5 and Config.WHeal and currhp <= .25*maxhp then
	CastSpell(_W)
	end
	if Config.Combo then
		if unit then
			--          numbers=spelltravelspeed, spelldelay, spellrange, spellwidth, collision(t/f), addhitbox(t/f) 
			local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),900,150,1000,200,true,true)
			if CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, 550) then
			CastSpell(_Q)
			end
			if CanUseSpell(myHero, _W) == READY and IsInDistance(unit, 500) then
			CastSpell(_W)
			end
			if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and IsInDistance(unit, 750) then
			CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
			end
		end
		if unit and currmana == 5 then
			local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),900,150,1000,200,true,true)
			if IsInDistance(unit, 800) and Config.Q then
			CastSpell(_Q)
			end
			if IsInDistance(unit, 500) and Config.W then
			CastSpell(_W)
			end
			if IsInDistance(unit, 750) and EPred.HitChance == 1 and Config.E then
			CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
			end
		end
	end
end)
