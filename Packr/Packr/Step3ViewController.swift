//
//  Step3ViewController.swift
//  Packr
//
//  Created by Mini8 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//
import UIKit

class Step3ViewController: UIViewController  {
    
    var newPactName = ""
    var newPactDescr = ""
    var newPactPeople = ""
    var newPactState = "new"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPact(_ sender: Any) {
        
       let newPact = Pact(pactName: newPactName, pactDescr: newPactDescr, pactPeople: newPactPeople, pactState: newPactState)
        Storage.shared.objects.append(newPact)
        performSegue(withIdentifier: "Confirmation", sender: self)
    }
}
