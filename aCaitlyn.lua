require('Inspired')
-- Created by TheApex, check the forums for more scripts by me.
--Updated 8/25/2015
Config = scriptConfig("Apex Caitlyn", "Apex Caitlyn")
Config.addParam("Q", "Use Q in combo", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use ult in combo", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E to escape", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
	if Config.Combo then
		local target = GetCurrentTarget()
		local unit = GetTarget(3000, DAMAGE_PHYSICAL)
		local castlevel = GetCastLevel(myHero,_R)
		local currhp = GetCurrentHP(target)
		local distance = GetDistance(myHero, unit)
		--          numbers=spelltravelspeed, spelldelay, spellrange, spellwidth, collision(t/f), addhitbox(t/f) 
		local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1250,350,1250,150,false,true)
		local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),950,300,950,150,true,true)
			if unit then
				if target then
					local target = GetCurrentTarget()
					local bonusad = GetBonusDmg(myHero)*2
					local ult1 = bonusad + 250
					local ult2 = bonusad + 475
					local ult3 = bonusad + 700
					local Ultdmg1 = CalcDamage(myHero, target, ult1, 0)
					local Ultdmg2 = CalcDamage(myHero, target, ult2, 0)
					local Ultdmg3 = CalcDamage(myHero, target, ult3, 0)
					local currhp = GetCurrentHP(target)
					if CanUseSpell(myHero, _R) == READY and castlevel == 1 and CalcDamage(myHero, target, ult1, 0) > currhp and Config.R and ValidTarget(target, 2000) then
					CastTargetSpell(target,_R)
					end
					if CanUseSpell(myHero, _R) == READY and castlevel == 2 and CalcDamage(myHero, target, ult2, 0) > currhp and Config.R and ValidTarget(target, 2500) then
					CastTargetSpell(target,_R)
					end
					if CanUseSpell(myHero, _R) == READY and castlevel == 3 and CalcDamage(myHero, target, ult3, 0) > currhp and Config.R and ValidTarget(target, 3000) then
					CastTargetSpell(target,_R)
					end
				end
				local currhp = GetCurrentHP(target)
				if CanUseSpell(myHero, _Q) == READY and Config.Q and QPred.HitChance == 1 and IsInDistance(unit, 1000) then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
				if CanUseSpell(myHero, _E) == READY and Config.E and distance < 300 then
				CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
				end
			end
	end
end)
