//
//  TableView.swift
//  Packr
//
//  Created by Mini8 on 11/06/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PactTable: UITableView {
    
    var detailViewController: PactViewController? = nil
    var objects:[Pact] = []
    var handle: DatabaseHandle?
    var ref: DatabaseReference?
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PactUITableCell
        
        let object = Storage.shared.objects[indexPath.row]
        cell.pactNameLabel.text! = object.pactName
        cell.pactStateLabel.text! = object.pactState
        
        cell.pactName = object.pactName
        cell.pactDescr = object.pactDescr
        cell.pactPeople = object.pactPeople
        cell.pactState = object.pactState
        cell.pactTime = object.pactTime
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
}

