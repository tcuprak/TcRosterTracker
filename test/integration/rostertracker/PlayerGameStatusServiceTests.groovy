
package rostertracker
import grails.test.*

class PlayerGameStatusServiceTests extends GrailsUnitTestCase {
	def playerGameStatusService
    protected void setUp() {
        super.setUp()
		playerGameStatusService = new PlayerGameStatusService()
		playerGameStatusService.gameService = new GameService()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
		
		List expected
		 assertEquals(expected,playerGameStatusService.allGames())
    }
		
		
}
