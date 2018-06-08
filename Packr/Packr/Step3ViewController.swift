//
//  Step3ViewController.swift
//  Packr
//
//  Created by Mini8 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//
import UIKit
import FirebaseDatabase

class Step3ViewController: UIViewController  {
    
    var newPactName = ""
    var newPactDescr = ""
    var newPactPeople = ""
    var newPactState = "new"
    var newPactTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var ref:DatabaseReference?
    

    
    @IBAction func addPact(_ sender: Any) {
        
        ref = Database.database().reference()
        
        let newPact = Pact(pactName: newPactName, pactDescr: newPactDescr, pactPeople: newPactPeople, pactState: newPactState, pactTime: newPactTime)
        

        ref?.child("Pact").childByAutoId().setValue(newPact.asDictionary())
        
        //Storage.shared.objects.append(newPact)
        performSegue(withIdentifier: "Confirmation", sender: self)
    }
}
