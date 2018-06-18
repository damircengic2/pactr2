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
var pactPeopleValid = false
var handle: DatabaseHandle?
var ref: DatabaseReference?
var refHandle: UInt!

    
    @IBOutlet weak var registerLabelError: UILabel!
    @IBOutlet weak var pactPeopleInput: UITextField!
    @IBAction func addPact(_ sender: Any) {
       peopleValid()
        if pactPeopleInput.text! == ""{
            self.registerLabelError.text! = "Please enter people to sign your pact!"
        }else if pactPeopleValid == false{
            self.registerLabelError.text! = "There is no such Pactr user!"
        }else if pactPeopleInput.text! == Auth.auth().currentUser?.email{
            self.registerLabelError.text! = "You cannot send a Pact to yourself!"
        }else{
            self.performSegue(withIdentifier:"Step3", sender: prepare)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func peopleValid(){
        ref = Database.database().reference()
        //observing the data changes
        let childRef = ref?.child("User")
        
        refHandle = childRef?.observe(DataEventType.value, with: { (snapshot) in
            let dataDict = snapshot.value as! [String: AnyObject]
            for (_, item) in dataDict{
                print(item)
                if item as! String == self.pactPeopleInput.text!{
                    self.pactPeopleValid = true
                }
            }
        })
        print(pactPeopleValid)
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
