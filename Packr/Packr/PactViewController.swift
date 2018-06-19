//
//  PactViewController.swift
//  Packr
//
//  Created by Mini8 on 28/05/2018.
//  Copyright © 2018 mini1. All rights reserved.
//

import UIKit
import LocalAuthentication
import FirebaseDatabase

class PactViewController: UIViewController {

    @IBOutlet weak var pactNameLabel: UILabel!
    @IBOutlet weak var pactDescrTextView: UITextView!
    @IBOutlet weak var pactStateLabel: UILabel!
    @IBOutlet weak var pactPeopleLabel: UILabel!
    @IBOutlet weak var pactTimeLabel: UILabel!
    @IBOutlet weak var pactSenderLabel: UILabel!

	@IBOutlet weak var pendingPactView: UIView!
	@IBOutlet weak var signedPactView: UIView!

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
				self.pendingPactView.isHidden = true
                if detail.pactState == "signed"{
                    label.backgroundColor = .green
                }
				if detail.pactState == "pending"{
                    label.backgroundColor = .yellow
					self.pendingPactView.isHidden = false
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

	@IBAction func authenticationWithTouchID() {
		let localAuthenticationContext = LAContext()
		localAuthenticationContext.localizedFallbackTitle = "Use Passcode"

		var authError: NSError?
		let reasonString = "To access the secure data"

		if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {

			localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in

				if success {
					let dbRef = Database.database().reference().child("Pact").child((self.detailItem?.pactID)!)
					dbRef.updateChildValues(["pactState":"signed"])
					self.detailItem?.pactState = "signed"
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
						self.configureView()
					}

				} else {
					//TODO: User did not authenticate successfully, look at error and take appropriate action
					guard let error = evaluateError else {
						return
					}

					print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error._code))

					//TODO: If you have choosen the 'Fallback authentication mechanism selected' (LAError.userFallback). Handle gracefully

				}
			}
		} else {

			guard let error = authError else {
				return
			}
			//TODO: Show appropriate alert if biometry/TouchID/FaceID is lockout or not enrolled
			print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error.code))
		}
	}

	func evaluateAuthenticationPolicyMessageForLA(errorCode: Int) -> String {

		var message = ""

		switch errorCode {

		case LAError.authenticationFailed.rawValue:
			message = "The user failed to provide valid credentials"

		case LAError.appCancel.rawValue:
			message = "Authentication was cancelled by application"

		case LAError.invalidContext.rawValue:
			message = "The context is invalid"

		case LAError.notInteractive.rawValue:
			message = "Not interactive"

		case LAError.passcodeNotSet.rawValue:
			message = "Passcode is not set on the device"

		case LAError.systemCancel.rawValue:
			message = "Authentication was cancelled by the system"

		case LAError.userCancel.rawValue:
			message = "The user did cancel"

		case LAError.userFallback.rawValue:
			message = "The user chose to use the fallback"

		default:
			message = evaluatePolicyFailErrorMessageForLA(errorCode: errorCode)
		}

		return message
	}

	func evaluatePolicyFailErrorMessageForLA(errorCode: Int) -> String {
		var message = ""
		if #available(iOS 11.0, macOS 10.13, *) {
			switch errorCode {
			case LAError.biometryNotAvailable.rawValue:
				message = "Authentication could not start because the device does not support biometric authentication."

			case LAError.biometryLockout.rawValue:
				message = "Authentication could not continue because the user has been locked out of biometric authentication, due to failing authentication too many times."

			case LAError.biometryNotEnrolled.rawValue:
				message = "Authentication could not start because the user has not enrolled in biometric authentication."

			default:
				message = "Did not find error code on LAError object"
			}
		} else {
			switch errorCode {
			case LAError.touchIDLockout.rawValue:
				message = "Too many failed attempts."

			case LAError.touchIDNotAvailable.rawValue:
				message = "TouchID is not available on the device"

			case LAError.touchIDNotEnrolled.rawValue:
				message = "TouchID is not enrolled on the device"

			default:
				message = "Did not find error code on LAError object"
			}
		}

		return message;
	}

	@IBAction func cancelPact() {
		let dbRef = Database.database().reference().child("Pact").child((detailItem?.pactID)!)
		dbRef.updateChildValues(["pactState":"declined"])
		detailItem?.pactState = "declined"
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.configureView()
		}
	}

}

