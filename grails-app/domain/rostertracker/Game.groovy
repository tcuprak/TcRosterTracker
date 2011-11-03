package rostertracker

class Game {

	Date date
	Opponent opponent1
	String startTime
	String location = "TBD"
	String field
	Boolean weAreHomeTeam
	String result = "scheduled"
	String notes

	// load the opponent when we get this
	// not a big performance hit and
	// if we don't, toString will break
	static mapping = { opponent1 lazy:false }

	// The Game object "owns" the playerGameStatus objects,
	//these will be deleted by cascade if we delete this game

	static hasMany = [gameStatus:PlayerGameStatus]

	String toString(){
		def dateStr = date.format('MM/dd/yy')
		def startTimeStr = startTime!=null?startTime:"TBD"
		"$dateStr at $startTimeStr vs. $opponent1"
	}

	// inject service into this domain class
	def playerGameStatusService


	def beforeInsert = {
		if (startTime == null)
			startTime = "TBD"
	}


	static constraints = {
		date(nullable:false)
		opponent1(nullable:true)
		startTime(nullable:true)
		location(nullable:true)
		field(nullable:true)
		weAreHomeTeam(nullable:true)
		result(nullable:true,inList:[
			"scheduled",
			"win",
			"loss",
			"tie",
			"forfeit"
		], default:"scheduled")

		notes(nullable:true)
	}

	/**  After inserting a new game, make sure we create the PlayerGameStatus that we need for all existing players */

	def afterInsert() {
		PlayerGameStatus.withNewSession() {session ->
			def allPlayers = Player.list()
			println "in afterinsert   domain is Game ${this}"

			allPlayers.each {

				def status = new PlayerGameStatus()
				status.setGame(this)
				status.setPlayer(it)
				// broken code .... status.setStatus(playerGameStatusService.defaultStatus())
				status.setStatus("Unknown")
				println(  " ${it} updating === ${status} ")
				status.save()
				println(  " ${it} update done === ${status} ")
			}
		}
	}
}

//	/** TBD -- use cascading deletes correctly
//	 * Before deleting a game, make sure we delete the PlayerGameStatus that we need for all existing players */
//
//		def beforeDelete() {
//			println "in beforeDelete   domain is Game ${this}"
//			PlayerGameStatus.withNewSession() {session ->
//				def statusToRemove = PlayerGameStatus.findByGame(this)
//
//				println(  " need to remove ${statusToRemove.count()}  ")
//
//				statusToRemove.each {
//
//					println(  " ${it} will be deleted ")
//					it.delete(flush:true)
//
//					println(  " ${it} remove done  ")
//				}
//			}
//		}
//}
