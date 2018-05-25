//
//  AfterRegisterViewController.swift
//  Packr
//
//  Created by mini3 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class AfterRegisterViewController: UIViewController{
    
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var passInput: UITextField!
    
    @IBOutlet var labelError: UILabel!
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var newEmailSent: UILabel!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if emailInput.text != "" && passInput.text != ""
        {
            Auth.auth().signIn(withEmail: emailInput.text!, password: passInput.text!, completion: { (user, error ) in
                
                if user != nil{
                    if (user?.isEmailVerified)!{
                        
                        self.performSegue(withIdentifier: "segueIfLoginAfterRegisterSuceeded", sender: self)
                        self.labelError!.text = ""
                    
                    }else {
                        self.labelError.text! = "E-mail is not verified. Check you inbox!"
                        
                    }
                }else {
                    if let myError = error?.localizedDescription{
                        self.labelError.text! = myError
                        
                    }else{
                        print ("ERROR")
                    }
                }
                
            })
        }else{
            labelError.text = "Please enter your creditentials!"
        }

        
    }
    
    @IBAction func sendAgainButton(_ sender: UIButton) {
        
        Auth.auth().currentUser?.sendEmailVerification(completion: nil)
        
            newEmailSent.text! = "New e-mail is sent to your address!"
        
    }
}
