//
//  PactUITableCell.swift
//  Packr
//
//  Created by Mini8 on 28/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase
import UIKit

class PactUITableCell: UITableViewCell {
    
    var pactName:String = ""
    var pactDescr:String = ""
    var pactState:String = ""
    var pactPeople:String = ""
    var pactTime:String = ""
    var pactSender:String = ""

    @IBOutlet weak var pactPartner: UILabel!
    @IBOutlet weak var pactNameLabel: UILabel!
    @IBOutlet weak var pactStateView: UIImageView!
    
    func partner(sender: String, reciever: String){
        if sender == Auth.auth().currentUser?.email{
            pactPartner.text! = reciever
        }else if reciever == Auth.auth().currentUser?.email{
            pactPartner.text! = sender
        }
    }

    func backgroundColour(state: String) {
        if state == "signed"{
            pactStateView.image = #imageLiteral(resourceName: "signed")
        }
        if state == "pending"{
            pactStateView.image = #imageLiteral(resourceName: "pending")
        }
        if state == "declined"{
            pactStateView.image = #imageLiteral(resourceName: "declined")
        }
    }

    

    
}
