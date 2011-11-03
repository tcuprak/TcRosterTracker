package rostertracker

class Opponent {

    String name
    String notes


    String toString(){ "$name" }
    static constraints = {
    name(blank:false)
    notes(nullable:true, blank:true, maxSize:1000)
    }
}
