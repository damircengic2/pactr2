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
    
    @IBOutlet weak var registerLabelError: UILabel!
    
    
    @IBAction func addPact(_ sender: Any) {
         if pactNameInput.text! != "" {
            self.performSegue(withIdentifier:"Step2", sender: prepare)
         }else{
            self.registerLabelError.text! = "Please enter Pact title!"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
