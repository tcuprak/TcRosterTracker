package rostertracker

class PlayerGameStatus {


	String status

	// TODO need help with cascades ... didn't seem to work
	//	// if we delete either the player or the game, we will
	//	// want this object to be deleted by cascade
	static belo

	// load the player and game when we retrieve this
	// not a big performance hit

	static mapping = {
		player lazy:false
		game lazy:false
	}

		// TODO need help with cascades ... didn't seem to work
	//	// if we delete either the player or the game, we will
	//	// want this object to be deleted by cascade
	static belongsTo = [ player:Player, game:Game]
	
	static constraints = {

		game(nullable:false)
		player (unique: 'game', nullable:false)
		status(inList:PlayerGameStatusService.statusType.keySet().asType(List.class))
	}


	@Override
	public String toString() {
		return "PlayerGameStatus [  ${player}  :  ${game}  :  ${status} ]";
	}


	public PlayerGameStatus(Player player, Game game, String status) {
		super();
		this.player = player;
		this.game = game;
		this.status = status;
	}

	public PlayerGameStatus(){
		super();
	}




}
