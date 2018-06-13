//
//  MyPactViewController2.swift
//  Packr
//
//  Created by Mini8 on 11/06/2018.
//  Copyright © 2018 mini1. All rights reserved.
//


import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth

class MyPactsViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var detailViewController: PactViewController? = nil
    var objects:[Pact] = []
    var handle: DatabaseHandle?
    var ref: DatabaseReference?
    var refHandle: UInt!
    var sender: String = ""
    var reciever: String = ""
    

    @IBOutlet weak var pactTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        navigationItem.leftBarButtonItem = editButtonItem
        
        ref = Database.database().reference()
        //observing the data changes
        let childRef = ref?.child("Pact")
        
        refHandle = childRef?.observe(DataEventType.value, with: { (snapshot) in
            let dataDict = snapshot.value as! [String: AnyObject]
            
            print(dataDict)
            for (_, item) in dataDict{
               //print(item["pactName"])

                let newPact = Pact(pactName: item["pactName"] as! String, pactDescr: item["pactDescr"] as! String, pactPeople: item["pactPeople"] as! String, pactState: item["pactState"] as! String, pactTime: item["pactTime"] as! String, pactSender: item["pactSender"] as! String)
                self.sender = newPact.pactSender
                self.reciever = newPact.pactPeople
                if(self.sender == Auth.auth().currentUser?.email || self.reciever == Auth.auth().currentUser?.email){
                    self.objects.append(newPact)
                }
            }
            self.pactTableView.reloadData()
            
        })
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewObject(_ sender: Any) {
        performSegue(withIdentifier: "AddPact", sender: self)
    }
    
    // MARK: - Segues
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = pactTableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = segue.destination as! PactViewController
                controller.detailItem = object
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PactUITableCell
        
        let object = objects[indexPath.row]
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

