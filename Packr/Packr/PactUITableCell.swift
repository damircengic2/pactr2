//
//  PactUITableCell.swift
//  Packr
//
//  Created by Mini8 on 28/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit

class PactUITableCell: UITableViewCell {
    
    var pactName:String = ""
    var pactDescr:String = ""
    var pactState:String = ""
    var pactPeople:String = ""
    var pactTime:String = ""
    var pactSender:String = ""

    @IBOutlet weak var pactNameLabel: UILabel!
    @IBOutlet weak var pactStateLabel: UILabel!
    

    
}
