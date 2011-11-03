package rostertracker

import grails.test.*

class PlayerGameStatusControllerTests extends ControllerUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
		controller = new PlayerGameStatusService()
		println "junk test"
		println  controller.gameList().length()

    }
}
