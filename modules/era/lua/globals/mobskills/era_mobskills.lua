-----------------------------------
--  Mobskills Era Module
-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("era_mobskills")

-- local f = {}

-- f.mobPhysicalMove = function(mob, target, skill, numberofhits, accmod, dmgmod, tpeffect, mtp000, mtp150, mtp300, critperc, attmod)
--     print("test~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
-- end

-- m:addOverride("xi.mobskills", f)


-- Abyss Blast
m:addOverride("xi.globals.mobskills.abyss_blast.onMobWeaponSkill", function(target, mob, skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BLINDNESS, 20, 0, 120)

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN), xi.magic.ele.DARK, 1, xi.mobskills.magicalTpBonus.MAB_BONUS, 0, 0, 2.5, 3.5, 4.5)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)

    return dmg
end)

-- Abyssal Strike
m:addOverride("xi.globals.mobskills.abyssal_strike.onMobWeaponSkill", function(target, mob, skill)
    local numhits = 1
    local accmod = 2
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1, 2, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.STUN, 1, 0, 4)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    return dmg
end)

-- Acid Breath
m:addOverride("xi.globals.mobskills.acid_breath.onMobWeaponSkill", function(target, mob, skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.STR_DOWN, 10, 15, 180)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.1, 1, xi.magic.ele.WATER, 200)
    local dmg    = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.WATER, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.WATER)

    return dmg
end)

-- Acid Mist
m:addOverride("xi.globals.mobskills.acid_mist.onMobWeaponSkill", function(target, mob, skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.ATTACK_DOWN, 50, 0, math.random(60, 120))

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN), xi.magic.ele.WATER, 1, xi.mobskills.magicalTpBonus.MAB_BONUS, 1, 0, 2, 2.5, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WATER, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WATER)

    return dmg
end)

-- Acid Spray
m:addOverride("xi.globals.mobskills.acid_spray.onMobWeaponSkill", function(target, mob, skill)
    local power = math.min(1, (mob:getMainLvl() / 10)) * 2

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.POISON, power, 3, 60)

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN), xi.magic.ele.WATER, 1, xi.mobskills.magicalTpBonus.MAB_BONUS, 0, 0, 1, 1.5, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WATER, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WATER)

    return dmg
end)

-- Aegis Schism
m:addOverride("xi.globals.mobskills.aegis_schism.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5, 2, 2.5)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.DEFENSE_DOWN, 75, 0, 120)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    return dmg
end)

-- Aeolian Edge
m:addOverride("xi.globals.mobskills.aeolian_edge.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 3
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.ACC_VARIES, 1, 2, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    return dmg
end)

-- Aerial Wheel
m:addOverride("xi.globals.mobskills.aerial_wheel.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local info = xi.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 2, 2.5, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.PIERCING, info.hitslanded)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.STUN, 1, 0, 4)
    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)

    return dmg
end)

-- Amatsu Hanaikusa
m:addOverride("xi.globals.mobskills.amatsu_hanaikusa.onMobWeaponSkill", function(target,mob,skill)
    local power    = 22.5
    local duration = 60
    local numhits = 1
    local accmod = 2
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5625, 1.875, 2.50)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    if info.hitslanded > 0 then
        target:addStatusEffect(xi.effect.PARALYSIS, power, 0, duration)
    end

    return dmg
end)

-- Amatsu Kazakiri
m:addOverride("xi.globals.mobskills.amatsu_kazakiri.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 2
    local accmod = 2
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1, 1.50, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    return dmg
end)

-- Amatsu Torimai
m:addOverride("xi.globals.mobskills.amatsu_torimai.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 2
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1, 1.50, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    return dmg
end)

-- Amatsu Tsukikage
m:addOverride("xi.globals.mobskills.amatsu_tsukikage.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 3
    local accmod = 2
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5625, 1.875, 2.50)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    return dmg
end)

-- Amatsu Tsukioboro
m:addOverride("xi.globals.mobskills.amatsu_tsukioboro.onMobWeaponSkill", function(target,mob,skill)
    local power    = 1
    local duration = 60
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5625, 1.875, 2.50)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    if info.hitslanded > 0 then
        target:addStatusEffect(xi.effect.SILENCE, power, 0, duration)
    end

    return dmg
end)

-- Amatsu Yukiarashi
m:addOverride("xi.globals.mobskills.amatsu_yukiarashi.onMobWeaponSkill", function(target,mob,skill)
    local power    = 1
    local duration = 60
    local numhits = 1
    local accmod = 2
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5625, 1.875, 2.50)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    if info.hitslanded > 0 then
        target:addStatusEffect(xi.effect.BIND, power, 0, duration)
    end

    return dmg
end)

-- Amorphic Spikes
m:addOverride("xi.globals.mobskills.amorphic_spikes.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 5
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, .6, .85, 1.1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.PIERCING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.PIERCING)

    return dmg
end)

-- Antigravity
m:addOverride("xi.globals.mobskills.antigravity.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    return dmg
end)

-- Antigravity_1
m:addOverride("xi.globals.mobskills.antigravity_1.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:delHP(dmg)

    return dmg
end)

-- Antigravity_2
m:addOverride("xi.globals.mobskills.antigravity_2.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:delHP(dmg)

    return dmg
end)

-- Antigravity_3
m:addOverride("xi.globals.mobskills.antigravity_3.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:delHP(dmg)

    return dmg
end)

-- Aqua Ball
m:addOverride("xi.globals.mobskills.aqua_ball.onMobWeaponSkill", function(target,mob,skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.STR_DOWN, 10, 10, 180)

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN), xi.magic.ele.WATER, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0, 0, 2, 2.5, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WATER, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WATER)

    return dmg
end)

-- Aqua Blast
m:addOverride("xi.globals.mobskills.aqua_blast.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN), xi.magic.ele.WATER, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT, 0, 0, 2, 2.5, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WATER, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WATER)

    return dmg
end)

-- Aqua Breath
m:addOverride("xi.globals.mobskills.aqua_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.1, 1, xi.magic.ele.WATER, 500)
    local dmg    = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.WATER, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.WATER)

    return dmg
end)

-- Arching Arrow
m:addOverride("xi.globals.mobskills.arching_arrow.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.PIERCING, xi.mobskills.shadowBehavior.NUMSHADOWS_1)

    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)

    return dmg
end)

-- Arm Block
m:addOverride("xi.globals.mobskills.arm_block.onMobWeaponSkill", function(target,mob,skill)
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.DEFENSE_BOOST, 25, 0, 600))

    return xi.effect.DEFENSE_BOOST
end)

-- Arrow Deluge
m:addOverride("xi.globals.mobskills.arrow_deluge.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.PIERCING, xi.mobskills.shadowBehavior.NUMSHADOWS_3)

    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)

    return dmg
end)

-- Artificial Gravity
m:addOverride("xi.globals.mobskills.artificial_gravity.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEIGHT, 15, 0, 60)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    return dmg
end)

-- Artificial_Gravity_1
m:addOverride("xi.globals.mobskills.artificial_gravity_1.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEIGHT, 15, 0, 60)
    target:delHP(dmg)

    return dmg
end)

-- Artificial_Gravity_2
m:addOverride("xi.globals.mobskills.artificial_gravity_2.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEIGHT, 30, 0, 60)
    target:delHP(dmg)

    return dmg
end)

-- Artificial_Gravity_3
m:addOverride("xi.globals.mobskills.artificial_gravity_3.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEIGHT, 60, 0, 60)
    target:delHP(dmg)

    return dmg
end)

-- Ascetics Fury
m:addOverride("xi.globals.mobskills.ascetics_fury.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.CRIT_VARIES, 1.1 , 1.3, 1.5)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.HTH, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.HTH)

    return dmg
end)

-- Astral Flow
local avatarOffsets =
{
    [17444883] = 3, -- Vermilion-eared Noberry
    [17444890] = 3, -- Vermilion-eared Noberry
    [17444897] = 3, -- Vermilion-eared Noberry
    [17453078] = 3, -- Duke Dantalian
    [17453085] = 3, -- Duke Dantalian
    [17453092] = 3, -- Duke Dantalian
    [17506670] = 5, -- Kirin
}
m:addOverride("xi.globals.mobskills.astral_flow.onMobWeaponSkill", function(target,mob,skill)
    skill:setMsg(xi.msg.basic.USES)
    local mobID = mob:getID()
    local pos = mob:getPos()
    local avatar = 0

    if mob:isInDynamis() then
        local mobInfo = xi.dynamis.mobList[mob:getZoneID()][mob:getZone():getLocalVar((string.format("MobIndex_%s", mob:getID())))]

        if mobInfo ~= nil and mobInfo.info[2] == "Apocalyptic Beast" then
            if mob:getLocalVar("ASTRAL_FLOW") == 1 then
                skill:setMsg(xi.msg.basic.NONE)
                return xi.effect.NONE
            end

            xi.dynamis.spawnDynamicPet(target, mob, xi.job.SMN)
        elseif mobInfo ~= nil and mobInfo.info[2] == "Dagourmarche" then
            xi.dynamis.spawnDynamicPet(target, mob, xi.job.SMN)
        end
    else
        if avatarOffsets[mobID] then
            avatar = mobID + avatarOffsets[mobID]
        else
            avatar = mobID + 2 -- default offset
        end

        if not GetMobByID(avatar):isSpawned() then
            GetMobByID(avatar):setSpawn(pos.x + 1, pos.y, pos.z + 1, pos.rot)
            SpawnMob(avatar):updateEnmity(mob:getTarget())
        end
    end

    return xi.effect.ASTRAL_FLOW
end)

-- Asuran Fists
m:addOverride("xi.globals.mobskills.asuran_fists.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 8
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, 1, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 8, 8, 8)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.HTH, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.HTH)

    return dmg
end)

-- Auroral Drape
m:addOverride("xi.globals.mobskills.auroral_drape.onMobWeaponSkill", function(target,mob,skill)
    local silenced   = false
    local blinded    = false
    local typeEffect = nil

    silenced = xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SILENCE, 1, 0, 60)
    blinded  = xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BLINDNESS, 50, 0, 90)
    skill:setMsg(xi.msg.basic.SKILL_ENFEEB_IS)

    -- display silenced first, else blind
    if silenced == xi.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = xi.effect.SILENCE
    elseif blinded == xi.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = xi.effect.BLINDNESS
    else
        skill:setMsg(xi.msg.basic.SKILL_MISS)
    end

    return typeEffect
end)

-- Auroral Wind
m:addOverride("xi.globals.mobskills.auroral_wind.onMobWeaponSkill", function(target,mob,skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SILENCE, 1, 0, 60)

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN), xi.magic.ele.WIND, 1, xi.mobskills.magicalTpBonus.MAB_BONUS, 0, 0, 1.5, 2, 2.5)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WIND, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WIND)

    return dmg
end)

-- Awful Eye
m:addOverride("xi.globals.mobskills.awful_eye.onMobWeaponSkill", function(target,mob,skill)
    skill:setMsg(xi.mobskills.mobGazeMove(mob, target, xi.effect.STR_DOWN, 10, 10, 180))

    return xi.effect.STR_DOWN
end)

-- Axe Kick
m:addOverride("xi.globals.mobskills.axe_kick.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT, 1, 2, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    return dmg
end)

-- Axe Throw
m:addOverride("xi.globals.mobskills.axe_throw.onMobWeaponSkill", function(target,mob,skill)
    mob:setAnimationSub(1)

    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.SLASHING)

    return dmg
end)

-- Bad Breath
m:addOverride("xi.globals.mobskills.bad_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.15, 3, xi.magic.ele.EARTH, 500)
    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.EARTH, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.EARTH)

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 1250, 0, 60)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.POISON, math.min(1, mob:getMainLvl() / 10), 3, 60)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SILENCE, 1, 0, 60)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.PARALYSIS, 15, 0, 60)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BIND, 1, 0, 30)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BLINDNESS, 15, 0, 60)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEIGHT, 50, 0, 60)

    return dmg
end)

-- Biotic Boomerang
m:addOverride("xi.globals.mobskills.biotic_boomerang.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 3
    local accmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5, 1.75, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.PLAGUE, 5, 3, 18)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end)

-- Blizzard IV
m:addOverride("xi.globals.mobskills.blizzard_iv.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN) * 4, xi.magic.ele.ICE, dmgmod, xi.mobskills.magicalTpBonus.MAB_BONUS, 1, 0, 1, 1.5, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.ICE, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.ICE)
    return dmg
end)

-- Brain Drain
m:addOverride("xi.globals.mobskills.brain_drain.onMobWeaponSkill", function(target,mob,skill)
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN), xi.magic.ele.DARK, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0, 0, 3, 3.25, 3.5)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.INT_DOWN, 10, 10, 120)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)

    return dmg
end)

-- Circle of Flames
m:addOverride("xi.globals.mobskills.circle_of_flames.onMobWeaponSkill", function(target,mob,skill)
    local bombNum = 0.5 -- Base damage

    if mob:getAnimationSub() == 4 then -- 3 bombs
        bombNum = bombNum + 25 * 3
    elseif mob:getAnimationSub() == 5 then -- 2 bombs
        bombNum = bombNum + 25 * 2
    end

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, bombNum, xi.magic.ele.FIRE, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0, 0, 1, 1.1, 1.2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.FIRE, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.FIRE)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.WEIGHT, 20, 0, 120)

    return dmg
end)

-- Crystal Weapon
m:addOverride("xi.globals.mobskills.crystal_weapon.onMobWeaponSkill", function(target,mob,skill)
    local day = math.random(0, 3)
    local damageType = xi.damageType.FIRE + xi.magic.dayElement[day] - 1
    local accmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getMobWeaponDmg(xi.slot.MAIN), accmod, 1, xi.mobskills.magicalTpBonus.MAB_BONUS, 1, 0, 2, 3, 4)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, damageType, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, damageType)
    return dmg
end)

-- Double Kick
m:addOverride("xi.globals.mobskills.double_kick.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 2
    local accmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 1, 1.5, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.STUN, 1, 0, 4)

    return dmg
end)

-- Foul Breath
m:addOverride("xi.globals.mobskills.foul_breath.onMobWeaponSkill", function(target,mob,skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.DISEASE, 1, 0, 180)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.083, 1, xi.magic.ele.FIRE, 500)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.FIRE)
    return dmg
end)

-- Great Wheel
m:addOverride("xi.globals.mobskills.great_wheel.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 2
    local accmod = 1
    local dmgmod = 1.1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.mobskills.shadowBehavior.NUMSHADOWS_2)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    mob:resetEnmity(target)
    return dmg
end)

-- Heat Breath
m:addOverride("xi.globals.mobskills.heat_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.125, 1, xi.magic.ele.FIRE, 500)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.FIRE)
    return dmg
end)

-- Infernal Pestilence
m:addOverride("xi.globals.mobskills.infernal_pestilence.onMobWeaponSkill", function(target,mob,skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.PLAGUE, 5, 3, 780)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.1, 1, xi.magic.ele.WATER, 200)
    local dmg    = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.WATER, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.WATER)
    return dmg
end)

-- Laternal Slash
m:addOverride("xi.globals.mobskills.lateral_slash.onMobWeaponSkill", function(target,mob,skill)
    if mob:getFamily() == 271 then -- Jailer of Love, uses only animation.
        skill:setMsg(xi.msg.NONE)
        return 0
    end

    local numhits = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, 1, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 1, 1.5, 2)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.DEFENSE_DOWN, 83, 0, 30)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end)

-- Malediction
m:addOverride("xi.globals.mobskills.malediction.onMobWeaponSkill", function(target,mob,skill)
    local baseDmg = mob:getMainLvl() * 4
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, baseDmg, xi.magic.ele.DARK, 1, xi.mobskills.magicalTpBonus.MAB_BONUS, 1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    skill:setMsg(xi.mobskills.mobPhysicalDrainMove(mob, target, skill, xi.mobskills.drainType.HP, dmg))

    return dmg
end)

-- Meteor
m:addOverride("xi.globals.mobskills.meteor.onMobWeaponSkill", function(target,mob,skill)
    local damage = 14 + mob:getMainLvl() * 30
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, damage, xi.magic.ele.NONE, 1, xi.mobskills.magicalTpBonus.PDIF_BONUS, 0, 0, 1, 1, 1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.NONE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.NONE)
    return dmg
end)

-- Methane Breath
m:addOverride("xi.globals.mobskills.methane_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.1, 1, xi.magic.ele.FIRE, 400)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.FIRE)
    return dmg
end)

-- Pet Flame Breath
m:addOverride("xi.globals.mobskills.pet_flame_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target,  0.15, 0.25, xi.magic.ele.FIRE, 125)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.FIRE)
    return dmg
end)

-- Pet Frost Breath
m:addOverride("xi.globals.mobskills.pet_frost_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.15, 0.25, xi.magic.ele.ICE, 125)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.ICE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.ICE)
    return dmg
end)

-- Pet Gust Breath
m:addOverride("xi.globals.mobskills.pet_gust_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.15, 0.25, xi.magic.ele.WIND, 125)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.WIND, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.WIND)
    return dmg
end)

-- Pet Hydro Breath
m:addOverride("xi.globals.mobskills.pet_hydro_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.15, 0.25, xi.magic.ele.WATER, 125)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.WATER, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.WATER)
    return dmg
end)

-- Pet Lightning Breath
m:addOverride("xi.globals.mobskills.pet_lightning_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.15, 0.25, xi.magic.ele.LIGHTNING, 125)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.LIGHTNING, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.LIGHTNING)
    return dmg
end)

-- Pet Sand Breath
m:addOverride("xi.globals.mobskills.pet_sand_breath.onMobWeaponSkill", function(target,mob,skill)
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.15, 0.25, xi.magic.ele.EARTH, 125)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.EARTH, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.EARTH)
    return dmg
end)

-- Rail Cannon
m:addOverride("xi.globals.mobskills.rail_cannon.onMobWeaponSkill", function(target,mob,skill)
    local typeEffect = xi.effect.BIND

    local dmgmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, xi.magic.ele.LIGHT, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, MOBSKILL_MAGICAL, xi.damageType.LIGHT, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:delHP(dmg)

    xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, 30)

    return dmg
end)

-- Ranged Attack
m:addOverride("xi.globals.mobskills.ranged_attack.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1

    local info = xi.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)

    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.PIERCING, info.hitslanded)

    if skill:getMsg() ~= xi.msg.basic.SHADOW_ABSORB then
        if dmg > 0 then
            skill:setMsg(xi.msg.basic.RANGED_ATTACK_HIT)
        else
            skill:setMsg(xi.msg.basic.RANGED_ATTACK_MISS)
        end

        target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.PIERCING)
    end

    return dmg
end)

-- Rhino Attack
m:addOverride("xi.globals.mobskills.rhino_attack.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local attmod = 2 -- 100% attack boost
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.physicalTpBonus.CRIT_VARIES, 1, 1.5, 2, 0, attmod)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    return dmg
end)

-- Shoulder Attack
m:addOverride("xi.globals.mobskills.shoulder_attack.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5, 2, 2.5)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.STUN, 1, 0, 4)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    return dmg
end)

-- Shoulder Slam
m:addOverride("xi.globals.mobskills.shoulder_slam.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.physicalTpBonus.DMG_VARIES, 2, 2.5, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end)

-- Tera Slash
m:addOverride("xi.globals.mobskills.tera_slash.onMobWeaponSkill", function(target,mob,skill)
    local dmg = 0
    if mob:getHPP() <= 25 and math.random() > 0.50 then
        dmg = target:getHP()
        target:setHP(0)
        return dmg
    end

    local numhits = 1
    local accmod = 2
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1, 1.5, 2)
    dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end)

-- Throat Stab
m:addOverride("xi.globals.mobskills.throat_stab.onMobWeaponSkill", function(target,mob,skill)
    -- Set player to 5% of max HP
    local damage = math.max(0, target:getMaxHP() * 0.95 - (target:getMaxHP() - target:getHP()))

    local dmg = xi.mobskills.mobFinalAdjustments(damage, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.PIERCING, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.PIERCING)
    mob:resetEnmity(target)
    return dmg
end)

-- Wild Rage
m:addOverride("xi.globals.mobskills.wild_rage.onMobWeaponSkill", function(target,mob,skill)
    local numhits = 1
    local accmod = 1

    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, xi.mobskills.physicalTpBonus.DMG_VARIES, 2, 2.5, 3)

    -- Platoon Scorpion
    if mob:getPool() == 3157 then
        local ragePower = mob:getLocalVar("wildRagePower")
        info.dmg = info.dmg * (1 + 0.3 * ragePower)
    end

    -- King Vinegrroon
    if mob:getPool() == 2262 then
        xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.POISON, 25, 3, 60)
    end

    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end)

-- Wind Breath
m:addOverride("xi.globals.mobskills.wind_breath.onMobWeaponSkill", function(target,mob,skill)
    mob:lookAt(target:getPos())
    local dmgmod = xi.mobskills.mobBreathMove(mob, target, 0.3, 0.75, xi.magic.ele.WIND, 460)

    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.WIND, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.WIND)
    return dmg
end)


m:addOverride("xi.globals.mobskills..onMobWeaponSkill", function(target,mob,skill)
end)



return m