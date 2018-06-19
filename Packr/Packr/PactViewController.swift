//
//  PactViewController.swift
//  Packr
//
//  Created by Mini8 on 28/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit

class PactViewController: UIViewController {

    @IBOutlet weak var pactNameLabel: UILabel!
    @IBOutlet weak var pactDescrTextView: UITextView!
    @IBOutlet weak var pactStateLabel: UILabel!
    @IBOutlet weak var pactPeopleLabel: UILabel!
    @IBOutlet weak var pactTimeLabel: UILabel!
    @IBOutlet weak var pactSenderLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = pactNameLabel {
                label.text! = detail.pactName            }
            if let label = pactDescrTextView {
                label.text! = detail.pactDescr
            }
            if let label = pactStateLabel {
                label.text = detail.pactState
                if detail.pactState == "signed"{
                    label.backgroundColor = .green
                }
                if detail.pactState == "pending"{
                    label.backgroundColor = .yellow
                }
                if detail.pactState == "rejected"{
                    label.backgroundColor = .red
                }
            }
            if let label = pactPeopleLabel {
                label.text = detail.pactPeople
            }
            if let label = pactTimeLabel {
                label.text = String(describing: detail.pactTime)
            }
            if let label = pactSenderLabel {
                label.text = detail.pactSender
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: Pact? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    
}

