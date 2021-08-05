-----------------------------------
-- Area: Temple_of_Uggalepih
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.TEMPLE_OF_UGGALEPIH] =
{
    text =
    {
        NOTHING_HAPPENS            = 119,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED    = 6383,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED              = 6389,  -- Obtained: <item>.
        GIL_OBTAINED               = 6390,  -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6392,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY    = 6403,  -- There is nothing out of the ordinary here.
        FELLOW_MESSAGE_OFFSET      = 6418,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS        = 7000,  -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY    = 7001,  -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER               = 7002,  -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE              = 7053,  -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET     = 7212,  -- You can't fish here.
        CHEST_UNLOCKED             = 7320,  -- You unlock the chest!
        NO_REASON_TO_INVESTIGATE   = 7328,  -- There is no reason to investigate further.
        THE_BOX_IS_LOCKED          = 7329,  -- The box is locked.
        PAINTBRUSH_OFFSET          = 7332,  -- When the <keyitem> projects the deepest, darkest corner of your soul onto the blank canvas...only then will the doors to rancor open.
        FALLS_FROM_THE_BOOK        = 7342,  -- <item> falls from the book!
        THE_DOOR_IS_LOCKED         = 7356,  -- The door is locked. You might be able to open it with <item>.
        PROTECTED_BY_UNKNOWN_FORCE = 7357,  -- The door is protected by some unknown force.
        YOUR_KEY_BREAKS            = 7359,  -- Your <item> breaks!
        DOOR_LOCKED                = 7377,  -- The door is locked.
        HATE_RESET                 = 7430,  -- The built-up hate has been cleansed...!
        DOOR_SHUT                  = 7432,  -- The door is firmly shut.
        NO_HATE                    = 7433,  -- You have no built-up hate to cleanse.
        BEGINS_TO_QUIVER           = 7447,  -- The <keyitem> begins to quiver!
        SOME_SORT_OF_CEREMONY      = 7449,  -- Some sort of ceremony was performed here...
        NM_OFFSET                  = 7499,  -- It looks like some sort of device. A thin thread leads down to the floor...
        IT_IS_A_BEEHIVE            = 7503,  -- It is a beehive...
        BITS_OF_VEGETABLE          = 7504,  -- Bits of vegetable matter are strewn around. They appear to have been gnawed on by insects...
        SENSE_OMINOUS_PRESENCE     = 7506,  -- You sense an ominous presence...
        PLAYER_OBTAINS_ITEM        = 8441,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM      = 8442,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM   = 8443,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP       = 8444,  -- You already possess that temporary item.
        NO_COMBINATION             = 8449,  -- You were unable to enter a combination.
        REGIME_REGISTERED          = 10527, -- New training regime registered!
        COMMON_SENSE_SURVIVAL      = 11587, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        SOZU_SARBERRY_PH         =
        {
            [17428551] = 17428554, -- 89 0.499 -23
        },
        SOZU_TERBERRY_PH         =
        {
            [17428608] = 17428611, -- -122 0.028 -13
        },
        TONBERRY_KINQ_PH         =
        {
            [17428673] = 17428677, -- -221.717 0.996 12.819
            [17428675] = 17428677 -- -218 -0.792 24
        },
        FLAUROS_PH               =
        {
            [17428740] = 17428737, -- 259 0.03 80
        },
        TEMPLE_GUARDIAN          = 17428494,
        NIO_A                    = 17428495,
        NIO_HUM                  = 17428496,
        MIMIC                    = 17428497,
        SOZU_ROGBERRY            = 17428751,
        CLEUVARION_M_RESOAIX     = 17428807,
        ROMPAULION_S_CITALLE     = 17428808,
        BERYL_FOOTED_MOLBERRY    = 17428809,
        DEATH_FROM_ABOVE         = 17428810,
        HABETROT                 = 17428811,
        CRIMSON_TOOTHED_PAWBERRY = 17428813,
        SACRIFICIAL_GOBLET       = 17428816,
        YALLERY_BROWN            = 17428817,
    },
    npc =
    {
        CASKET_BASE          = 17428875,
        PLONGEUR_MONBERRY    = 17428933,
        BOOK_OFFSET          = 17428973,
        TEMPLE_GUARDIAN_DOOR = 17428978,
        DOOR_TO_RANCOR       = 17428989,
        TREASURE_COFFER      = 17429007,
    },
}

return zones[xi.zone.TEMPLE_OF_UGGALEPIH]