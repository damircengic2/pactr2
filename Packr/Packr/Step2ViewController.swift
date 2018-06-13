//
//  Step2ViewController.swift
//  Packr
//
//  Created by Mini8 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import Firebase
import FirebaseAuth
import UIKit

class Step2ViewController: UIViewController  {

var newPactName = ""
var newPactDescr = ""
    
    @IBOutlet weak var registerLabelError: UILabel!
    @IBOutlet weak var pactPeopleInput: UITextField!
    @IBAction func addPact(_ sender: Any) {
        if pactPeopleInput.text! != "" {
             self.performSegue(withIdentifier:"Step3", sender: prepare)
        }else{
            self.registerLabelError.text! = "Please enter people to sign your pact!"
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   

        let controller = segue.destination as? Step3ViewController
        controller?.newPactName = newPactName
        controller?.newPactDescr = newPactDescr
        controller?.newPactPeople = pactPeopleInput.text!
        controller?.newPactSender = (Auth.auth().currentUser?.email)!

    }
}
