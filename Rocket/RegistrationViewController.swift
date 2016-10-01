//
//  RegistrationViewController.swift
//  Rocket
//
//  Created by Daniel Kwolek on 10/1/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var techSkillsField: UITextField!
    @IBOutlet var registerButtonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registration"
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "HasRegisteredSegue" {
            
            
        }
        return true
    }
    
    
}
