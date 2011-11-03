package rostertracker

class Team {

    String name
  
    
    // TODO add recipients ( a set of players)
    
    static hasMany=[messages:Notification]
    
    static constraints = {
    name(nullable:false)
   
    }
}
