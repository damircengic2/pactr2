//
//  ProfileViewController.swift
//  Packr
//
//  Created by mini3 on 17/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController{
    
    
    
    @IBOutlet var userEmail: UILabel!
    
    
    
    
    @IBAction func signOutButton(_ sender: Any) {
        
        if Auth.auth().currentUser != nil {
        try! Auth.auth().signOut()
            print("Signed out")
        self.performSegue(withIdentifier: "segueIfLogoutSuceeded", sender: self)
        userEmail.text! = ""
            
        }
        
    }
    override func viewDidLoad() {
       
        if let text = userEmail{
            text.text! = (Auth.auth().currentUser?.email)!
        }
 
    super.viewDidLoad()
    

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
