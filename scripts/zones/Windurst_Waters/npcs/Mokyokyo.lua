-----------------------------------
-- Area: Windurst Waters
--  NPC: Mokyoko
-- Starts Windurst Missions
-- !pos -55 -8 227 238
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)

    if player:getNation() ~= xi.nation.WINDURST then
        player:startEvent(103) -- for other nation
    else
        local currentMission = player:getCurrentMission(WINDURST)
        local missionStatus = player:getMissionStatus(player:getNation())
        local cs, p, offset = getMissionOffset(player, 2, currentMission, missionStatus)

        -- TODO: This will keep getting uglier as I move forward in the rewrite until I'm done with Mokyokyo
        if currentMission <= xi.mission.id.windurst.THE_SHADOW_AWAITS and (cs ~= 0 or offset ~= 0 or currentMission ~= xi.mission.id.windurst.THE_HORUTOTO_RUINS_EXPERIMENT) then
            if (cs == 0) then
                player:showText(npc, ORIGINAL_MISSION_OFFSET + offset) -- dialog after accepting mission
            else
                player:startEvent(cs, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
            end
        elseif (currentMission ~= xi.mission.id.windurst.NONE) then
            player:startEvent(109)
        elseif (player:hasCompletedMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.THE_HEART_OF_THE_MATTER) == false) then
            player:startEvent(130)
        elseif (player:hasCompletedMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.THE_PRICE_OF_PEACE) == false) then
            player:startEvent(135)
        elseif (player:hasKeyItem(xi.ki.MESSAGE_TO_JEUNO_WINDURST)) then
            player:startEvent(232)
        elseif (player:hasCompletedMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.MOON_READING) == true) then
            player:startEvent(837)
        else
            local param3
            local flagMission, repeatMission = getMissionMask(player)
            -- NPC dialog changes when starting 3-2 according to whether it's the first time or being repeated
            if (player:hasCompletedMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.WRITTEN_IN_THE_STARS)) then
                param3 = 1
            else
                param3 = 0
            end
            player:startEvent(111, flagMission, 0, param3, 0, xi.ki.STAR_CRESTED_SUMMONS_1, repeatMission)
        end
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if csid ~= 118 then
        finishMissionTimeline(player, 2, csid, option)
    end
    if csid == 111 and (option == 12 or option == 15) then
        player:addKeyItem(xi.ki.STAR_CRESTED_SUMMONS_1)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.STAR_CRESTED_SUMMONS_1)
    end
    if csid == 837 then
        player:setCharVar("WWatersRTenText", 1)
    end

end

return entity