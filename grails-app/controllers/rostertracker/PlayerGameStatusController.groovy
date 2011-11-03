package rostertracker

class PlayerGameStatusController {
	
	// inject the playerGameService singleton class into the controller
	def playerGameStatusService
	def gameService
	

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def gameList= {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus gameList action called "
		def myList = gameInstanceList()
		println "here is the list ${myList}"
		myList
		
	}

    def index = {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus index action called "
        redirect(action: "list", params: params)
    }

    def list = {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus list action called "
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [playerGameStatusInstanceList: PlayerGameStatus.list(params), playerGameStatusInstanceTotal: PlayerGameStatus.count(),
			gameInstanceList: Game.list(params), playerInstanceList: Player.list(params)]
    }

    def create = {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus creat action called "
        def playerGameStatusInstance = new PlayerGameStatus()
        playerGameStatusInstance.properties = params
        return [playerGameStatusInstance: playerGameStatusInstance]
    }

    def save = {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus save action called "
        def playerGameStatusInstance = new PlayerGameStatus(params)
        if (playerGameStatusInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus'), playerGameStatusInstance.id])}"
            redirect(action: "show", id: playerGameStatusInstance.id)
        }
        else {
            render(view: "create", model: [playerGameStatusInstance: playerGameStatusInstance])
        }
    }

    def show = {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus show action called  ${params.id}"
        def playerGameStatusInstance = PlayerGameStatus.get(params.id)
        if (!playerGameStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            [playerGameStatusInstance: playerGameStatusInstance]
        }
    }
	
	def showplayer = {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus showplayer action called "
		redirect(controller:"player",action:"show", params: params)
	}

    def edit = {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus  edit action called "
        def playerGameStatusInstance = PlayerGameStatus.get(params.id)
        if (!playerGameStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [playerGameStatusInstance: playerGameStatusInstance]
        }
    }

    def update = {
		println "!!!!!!!!!!!!!!!!!!!!  PlayerGameStatus   update action called "
		println "params${params}"
		def playerGameStatusInstance = PlayerGameStatus.get(params.id)
        if (playerGameStatusInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (playerGameStatusInstance.version > version) {
                    
                    playerGameStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus')] as Object[], "Another user has updated this PlayerGameStatus while you were editing")
                    render(view: "edit", model: [playerGameStatusInstance: playerGameStatusInstance])
                    return
                }
            }
            playerGameStatusInstance.properties = params
            if (!playerGameStatusInstance.hasErrors() && playerGameStatusInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus'), playerGameStatusInstance.id])}"
                redirect(action: "show", id: playerGameStatusInstance.id)
            }
            else {
                render(view: "edit", model: [playerGameStatusInstance: playerGameStatusInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus'), params.id])}"
            redirect(action: "list")
        }
    }
	
	

    def delete = {
		println "!!!!!!!!!!!!!!!!!!!!    PlayerGameStatus delete action called "
        def playerGameStatusInstance = PlayerGameStatus.get(params.id)
        if (playerGameStatusInstance) {
            try {
                playerGameStatusInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playerGameStatus.label', default: 'PlayerGameStatus'), params.id])}"
            redirect(action: "list")
        }
    }
}
