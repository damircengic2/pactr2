//
//  FirebaseViewController.swift
//  Packr
//
//  Created by mini3 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FirebaseViewController: UIViewController{
    
    
    @IBOutlet var registerEmailInput: UITextField!
    @IBOutlet var registerPassInput: UITextField!
    
    
    @IBOutlet var registerButton: UIButton!
    
    
    
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var passInput: UITextField!
    @IBOutlet var labelError: UILabel!
    @IBOutlet var registerLabelError: UILabel!
    
    
    @IBOutlet var loginButton: UIButton!
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        if registerEmailInput.text! != "" && registerPassInput.text! != "" {
            Auth.auth().createUser(withEmail: registerEmailInput.text!, password: registerPassInput.text!, completion: { (user, error ) in if user != nil{
                let currUser = Auth.auth().currentUser
                    currUser?.sendEmailVerification(completion: nil)
                    self.performSegue(withIdentifier: "segueIfRegisterSuceeded", sender: self)
                            }else{
                if let myError = error?.localizedDescription{
                    self.registerLabelError.text! = myError
                }else{
                    print("ERROR")
                }
                }
            })
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        if emailInput.text != "" && passInput.text != ""
        {
            Auth.auth().signIn(withEmail: emailInput.text!, password: passInput.text!, completion: { (user, error ) in
                
                if user != nil{
                    if (Auth.auth().currentUser?.isEmailVerified)!{
                        
                    
                    self.performSegue(withIdentifier: "segueIfLoginSuceeded", sender: self)
                    }else {
                        let myError = "E-mail is not verified. Check you inbox!"
                        self.labelError.text! = myError
                    }
                }else {
                    if let myError = error?.localizedDescription{
                        self.labelError.text! = myError
                        
                    }else{
                        print ("ERROR")
                    }
                }
            
            })
        }
    }
    
    @IBOutlet var fbLoginButton: UIButton!
    
    @IBAction func fbLoginButton(_ sender: UIButton) {
        
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
