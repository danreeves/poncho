local PlayerController = tiny.processingSystem()

PlayerController.isUpdate = true
PlayerController.filter = tiny.requireAll('isPlayer')

function PlayerController:process(e, dt)




end

return PlayerController
