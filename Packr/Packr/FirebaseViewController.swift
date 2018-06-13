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
import FacebookCore
import FacebookLogin

class FirebaseViewController: UIViewController{
    
    
    @IBOutlet var registerEmailInput: UITextField!
    @IBOutlet var registerPassInput: UITextField!
    @IBOutlet var passConfirmInput: UITextField!
    
    
    @IBOutlet var registerButton: UIButton!
    
    
    
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var passInput: UITextField!
    @IBOutlet var labelError: UILabel!
    @IBOutlet var registerLabelError: UILabel!
    
    
    @IBOutlet var loginButton: UIButton!
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        if registerEmailInput.text! != "" && registerPassInput.text! != "" && passConfirmInput.text! != ""
        {
            if registerPassInput.text! != passConfirmInput.text! {
                self.registerLabelError.text! = "Password does not match!"
            } else {
            Auth.auth().createUser(withEmail: registerEmailInput.text!, password: registerPassInput.text!, completion: { (user, error ) in if user != nil{
                let currUser = Auth.auth().currentUser
                    currUser?.sendEmailVerification(completion: nil)
                    self.performSegue(withIdentifier: "segueIfRegisterSuceeded", sender: self)
                            }else{
                if let myError = error?.localizedDescription{
                    self.registerLabelError.text! = myError
                }
                else{
                    print("ERROR")
                }
                }
            })
            }
            
        }else {
            self.registerLabelError.text! = "Please enter creditentials!"
        }
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        if emailInput.text != "" && passInput.text != ""{
            
            Auth.auth().signIn(withEmail: emailInput.text!, password: passInput.text!, completion: { (user, error)  in
                if user != nil{
                    if (user?.isEmailVerified)!{
                        self.performSegue(withIdentifier: "Login", sender: self)
                        self.labelError.text! = ""
                    }else{
                        self.labelError.text! = "Please verify your e-mail!"
                    }
                }else{
                    if let myError = error?.localizedDescription{
                        self.labelError.text = myError
                    }else{
                        print("ERROR")
                    }
                }
            })
//            performSegue(withIdentifier: "segueLogin", sender: self)
        }else{
            self.labelError.text = "Please enter your creditentials!"
        }
    }
    
    @IBAction func FBLoginButton(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn([.publicProfile, .email], viewController: self){ (result) in
            switch result {
                
            case .success(grantedPermissions: _, declinedPermissions: _, token: _): print("Success")
                self.signIntoFirebase()
            case .failed(let err): print(err)
            case .cancelled: print("Cancelled")
            }
        }

                           
    }
    
    fileprivate func signIntoFirebase(){
        guard let authToken = AccessToken.current?.authenticationToken else {return}
        let creditentials = FacebookAuthProvider.credential(withAccessToken: authToken)
        Auth.auth().signIn(with: creditentials) { (user, err) in
            
            if let err = err{
                print (err)
                return
            }
            self.performSegue(withIdentifier: "segueFacebookLogin", sender: self)
            print ("Sucessfully authenticated with Firebase")
            print (Auth.auth().currentUser?.uid as Any)
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    
}
