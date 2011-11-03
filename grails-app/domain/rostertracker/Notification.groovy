package rostertracker

class Notification {
  
     Player initiator
     String type
     String message
     
     String toString(){ "$type notification from $initiator " }
     

    static constraints = {
     initiator(nullable:false)
     type(nullable:true,  inList:["email", "text"])
     message(blank:true)
    }
    
    static belongsTo=Team
}
