//
//  AddNewPact.swift
//  Packr
//
//  Created by Mini8 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit

class Step1ViewController: UIViewController  {

    //MARK: Properties
    
    @IBOutlet weak var pactNameInput: UITextField!
    @IBOutlet weak var pactDescrText: UITextView!
    

    
    
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
            
            let secondViewController = segue.destination as! Step2ViewController
            
            secondViewController.newPactName = pactNameInput.text!
            secondViewController.newPactDescr = pactDescrText.text!
        }
    }

}
