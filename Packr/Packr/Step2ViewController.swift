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
    @IBAction func addPact(_ sender: Any) {
        self.performSegue(withIdentifier:"Step3", sender: prepare)
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
        
    }
}
