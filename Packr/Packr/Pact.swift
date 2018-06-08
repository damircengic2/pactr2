//
//  Pact.swift
//  Packr
//
//  Created by Mini8 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import Foundation

class Pact {
    var pactName:String
    var pactDescr:String
    var pactState:String
    var pactPeople:String
    var pactTime:Date
    //People:String needs to be replaced by Userlist
    
    
    init(pactName:String, pactDescr:String , pactPeople: String, pactState:String, pactTime:Date){
        self.pactName = pactName
        self.pactDescr = pactDescr
        self.pactPeople = pactPeople
        self.pactState = pactState
        self.pactTime = pactTime
        
        
    }
    
   // pactName:String, pactDescr:String, pactState:String, pactPeople:String, pactTime:Date
    
    func asDictionary ()-> NSDictionary {
        
        let pactDictionary: NSDictionary = [
        "pactName": pactName,
        "pactDescr": pactDescr,
        "pactPeople": pactPeople,
        "pactState": pactState,
        "pactTime": pactTime.toString(withFormat: "dd-MMM-yyyy")
        ]
        return pactDictionary
    }
    
}
