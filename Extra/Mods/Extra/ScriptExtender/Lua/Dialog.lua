---- DIALOGS
Ext.Osiris.RegisterListener("CharacterMoveToAndTalkRequestDialog", 4, "after", function(character, target, dialog, move_id)
    _D("--- CharacterMoveToAndTalkRequestDialog: character: "..character)
    _D("--- CharacterMoveToAndTalkRequestDialog: target: "..target)
    _D("--- CharacterMoveToAndTalkRequestDialog: dialog: "..dialog)
    _D("--- CharacterMoveToAndTalkRequestDialog: move_id: "..move_id)
end)

Ext.Osiris.RegisterListener("DialogueCapabilityChanged", 2, "after", function(character, is_enabled)
    _D("--- DialogueCapabilityChanged: character: "..character)
    _D("--- DialogueCapabilityChanged: is_enabled: "..is_enabled)
end)

Ext.Osiris.RegisterListener("DialogStartRequested", 2, "after", function(target, player)
    _D("--- DialogStartRequested: character: "..target)
    _D("--- DialogStartRequested: player: "..player)
end)

Ext.Osiris.RegisterListener("DialogStarted", 2, "after", function(dialog, instance_id)
    _D("--- DialogStarted: dialog: "..dialog)
    _D("--- DialogStarted: instance_id: "..instance_id)
end)

Ext.Osiris.RegisterListener("DialogRequestFailed", 2, "after", function(dialog, instance_id)
    _D("--- DialogRequestFailed: dialog: "..dialog)
    _D("--- DialogRequestFailed: instance_id: "..instance_id)
end)

Ext.Osiris.RegisterListener("DialogForceStopping", 2, "after", function(dialog, instance_id)
    _D("--- DialogForceStopping: dialog: "..dialog)
    _D("--- DialogForceStopping: instance_id: "..instance_id)
end)

Ext.Osiris.RegisterListener("DialogEnded", 2, "after", function(dialog, instance_id)
    _D("--- DialogEnded: dialog: "..dialog)
    _D("--- DialogEnded: instance_id: "..instance_id)
end)

Ext.Osiris.RegisterListener("DialogActorJoined", 4, "after", function(dialog, instance_id, actor, speaker_index)
    _D("--- DialogActorJoined: dialog: "..dialog)
    _D("--- DialogActorJoined: instance_id: "..instance_id)
    _D("--- DialogActorJoined: actor: "..actor)
    _D("--- DialogActorJoined: speaker_index: "..speaker_index)
end)

Ext.Osiris.RegisterListener("DialogActorJoinFailed", 3, "after", function(dialog, instance_id, actor)
    _D("--- DialogActorJoinFailed: dialog: "..dialog)
    _D("--- DialogActorJoinFailed: instance_id: "..instance_id)
    _D("--- DialogActorJoinFailed: actor: "..actor)
end)

Ext.Osiris.RegisterListener("DialogActorLeft", 4, "after", function(dialog, instance_id, actor, instance_ended)
    _D("--- DialogActorLeft: dialog: "..dialog)
    _D("--- DialogActorLeft: instance_id: "..instance_id)
    _D("--- DialogActorLeft: actor: "..actor)
    _D("--- DialogActorLeft: instance_ended: "..instance_ended)
end)

