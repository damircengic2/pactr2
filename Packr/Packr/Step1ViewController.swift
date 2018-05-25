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
    @IBAction func addPact(_ sender: Any) {
        self.performSegue(withIdentifier:"Step2", sender: prepare)
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
        let controller = segue.destination as? Step2ViewController
        controller?.newPactName = pactNameInput.text!
        controller?.newPactDescr = pactDescrText.text!
    }
}
