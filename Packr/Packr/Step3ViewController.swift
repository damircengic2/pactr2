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
    var newPactState = "signed"
    var newPactTime = Date().toString(withFormat: "dd-MMM-yyyy")
    var newPactSender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var ref:DatabaseReference?
    

    

    @IBAction func SignAndSend(_ sender: Any) {
    
        ref = Database.database().reference()
        
        let newPact = Pact(pactName: newPactName, pactDescr: newPactDescr, pactPeople: newPactPeople, pactState: newPactState, pactTime: newPactTime, pactSender: newPactSender)
        
    
        ref?.child("Pact").childByAutoId().setValue(newPact.asDictionary())
        
        //Storage.shared.objects.append(newPact)
        performSegue(withIdentifier: "Confirmation", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
