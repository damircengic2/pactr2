//
//  Step2ViewController.swift
//  Packr
//
//  Created by Mini8 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit

class Step2ViewController: UIViewController  {

var newPactName = ""
var newPactDescr = ""
    
    @IBOutlet weak var pactPeopleInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addPact(_ sender: Any) {
        func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?) {
            
            let secondViewController = segue.destination as! Step3ViewController
            
            secondViewController.newPactName = newPactName
            secondViewController.newPactDescr = newPactDescr
            secondViewController.newPactPeople = pactPeopleInput.text!
            
        }
    }

}
