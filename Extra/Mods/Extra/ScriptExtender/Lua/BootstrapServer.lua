
Ext.Require("Dialog.lua")

local daks = "UEX_Daks_526e3d7f-cc97-46bb-a81a-4cbec355a519"
local IS_DAKS_IN_COMBAT = "67ee541a-fbdd-45a5-afae-029831f01ece"

local ambush_dialog = "FOR_GoblinAmbush_ff0fbb34-72a7-4816-2a1c-bd13e5a246e7"
local trespass_dialog = "NGB_FOR_Village_Trespassing_0de4c26f-9744-2212-ec0b-979c176687f9"

Ext.Osiris.RegisterListener("DialogStarted", 2, "after", function(dialog, instance_id)
    if (
        dialog == ambush_dialog or
        dialog == trespass_dialog
    ) then
        Osi.SetHitpointsPercentage(daks, 75)
    end
end)

Ext.Osiris.RegisterListener("CastedSpell", 5, "after", function (caster, spell, spell_type, spell_element, story_action_id)
    if (spell == "Target_Fly_YoungDragon_UEX") then
        Osi.RemoveStatus(caster, "UEX_INVISIBLE_HIDDEN")
    end
end)

Ext.Osiris.RegisterListener("DialogEnded", 2, "after", function(dialog, instance_id)
    if (
        dialog == ambush_dialog or
        dialog == trespass_dialog
    ) then
        if(Osi.QuestUpdateIsUnlocked(Osi.GetHostCharacter(), "HIDDEN_WLD_Boosters", "FOR_GoblinAmbush_Persuaded") == 1) then
            local target = Osi.GetClosestAlivePlayer(daks)
            Osi.SetTag(daks, IS_DAKS_IN_COMBAT)
            Osi.UseSpell(daks, "Target_Fly_YoungDragon_UEX", target)
        end
    end
end)

Ext.Osiris.RegisterListener("EnteredCombat", 2, "after", function(object, combat_guid)
    local goblin_initiator = "S_FOR_Ambush_Goblins_Caster_01_826000b8-c6cd-4018-af55-31ee7e6a4668"

    local goblin_ranger_1 = "S_FOR_Ambush_Goblins_Ranger_01_8e553c24-5100-4939-9041-4dec8499d553"
    local goblin_ranger_2 = "S_FOR_Ambush_Goblins_Ranger_02_70a50383-e377-45c0-a793-b44d36d2df55"
    local goblin_ranger_3 = "S_FOR_Ambush_Goblins_Ranger_03_e3d96e92-39fa-4ec1-9503-bd00f40285aa"
    local goblin_caster = "S_FOR_Ambush_Goblins_Caster_02_1f3d846e-f26c-49d4-b917-d9f43fd137b4"

    if (
        Osi.QuestUpdateIsUnlocked(Osi.GetHostCharacter(), "HIDDEN_WLD_Boosters", "FOR_GoblinAmbush_Persuaded") == 0 and
        Osi.IsTagged(daks, IS_DAKS_IN_COMBAT) == 0 and
        (
            object == goblin_initiator or
            object == goblin_ranger_1 or
            object == goblin_ranger_2 or
            object == goblin_ranger_3 or
            object == goblin_caster
        )
    ) then
        Osi.SetHitpointsPercentage(daks, 75)
        Osi.SetTag(daks, IS_DAKS_IN_COMBAT)
        Osi.UseSpell(daks, "Target_Fly_YoungDragon_UEX", goblin_initiator, object)
    end
end)
