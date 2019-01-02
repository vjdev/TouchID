//
//  ViewController.swift
//  TouchID
//
//  Created by vijeesh on 02/01/19.
//  Copyright © 2019 vijeesh. All rights reserved.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4
        loginButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        loginButton.layer.borderWidth = 2
    }


    @IBAction func loginButtonClicked(_ sender: Any) {
        
        let context: LAContext = LAContext()
        let myLocalizedReasonString = "Authentication is needed to access your Home ViewController."
        var authError: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { [weak self](success, error) in
                if success {
                    DispatchQueue.main.async {
                        self?.alert(message: "Success")
                    }
                }else {
                    DispatchQueue.main.async {
                        self?.alert(message: "Failed")
                    }
                }
            }
        }else {
            print(authError?.localizedDescription)
        }
    }
    
    
    private func alert(message:String) {
        let alertController: UIAlertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.show(alertController, sender: self)
    }
    
    
    
}

