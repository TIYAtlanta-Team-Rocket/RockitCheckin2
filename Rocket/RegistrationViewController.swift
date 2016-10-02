//
//  RegistrationViewController.swift
//  Rocket
//
//  Created by Daniel Kwolek on 10/1/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var techSkillsField: UITextField!
    
    @IBAction func registrationButtonPressed(_ sender: AnyObject) {
        if checkerfunction() {
            let user = User.createUserWithData(firstName: firstNameField.text!, lastName: lastNameField.text!, email: emailField.text!, password: passwordField.text!, techSkills: techSkillsField.text!, adminFlag: false)
            try? WebLink.registerUser(user: user!)
        }
    }
    
    func checkerfunction() -> Bool {
        if (firstNameField.text != nil && lastNameField.text != nil && passwordField.text != nil && confirmPasswordField.text == passwordField.text && emailField.text != nil && techSkillsField.text != nil) {
            let checkArray = [firstNameField.text, lastNameField.text, passwordField.text, emailField.text]
            for string in checkArray {
                if string!.characters.count < 5 {
                    return false
                }
            }
            return true
        }
        return false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registration"
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        confirmPasswordField.delegate = self
        techSkillsField.delegate = self
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "HasRegisteredSegue" {
            if UserStore.mainUser != nil {
                return true
            }
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
}
