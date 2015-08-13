require('Inspired')
-- Created by TheApex, check the forums for more scripts by me
Config = scriptConfig("Apex Caitlyn", "Apex Caitlyn")
Config.addParam("Q", "Use Q in combo", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use ult in combo", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E to escape", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
	if Config.Combo then
		local unit = GetTarget(3000, DAMAGE_PHYSICAL)
		local castlevel = GetCastLevel(myHero,_R)
		local currhp = GetCurrentHP(unit)
		local distance = GetDistance(myHero, unit)
		local ad = GetBonusDmg(myHero)
		local Ultdmg1 = CalcDamage(myHero, unit, 250 + (2*ad), 0)
		local Ultdmg2 = CalcDamage(myHero, unit, 475 + (2*ad), 0)
		local Ultdmg3 = CalcDamage(myHero, unit, 700 + (2*ad), 0)
		--          numbers=spelltravelspeed, spelldelay, spellrange, spellwidth, collision(t/f), addhitbox(t/f) 
		local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1250,350,1250,150,false,true)
		local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),950,300,950,150,true,true)
			if unit then
				if CanUseSpell(myHero, _Q) == READY and Config.Q and IsInDistance(unit, 1000) then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
				if CanUseSpell(myHero, _R) == READY and castlevel == 1 and Ultdmg1 > currhp and Config.R and IsInDistance(unit, 2000) then
				CastTargetSpell(unit, _R)
				else if CanUseSpell(myHero, _R) == READY and castlevel == 2 and Ultdmg2 > currhp and Config.R and IsInDistance(unit, 2500) then
				CastTargetSpell(unit, _R)
				else if CanUseSpell(myHero, _R) == READY and castlevel == 3 and Ultdmg3 > currhp and Config.R and IsInDistance(unit, 3000) then
				CastTargetSpell(unit, _R)
				end
				end
				if CanUseSpell(myHero, _E) == READY and Config.E and distance < 300 then
				CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
				end
			end
		end
	end
end)
