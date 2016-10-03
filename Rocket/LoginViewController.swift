
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var descriptionLabel: UILabel!
    
    var descriptionString: String?
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
    }
    
    func updateDescription() {
        descriptionLabel.text = descriptionString
        descriptionLabel.setNeedsDisplay()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "LoginSegue" {
            if UserStore.mainUser != nil {
                return true
            } else {
                return false
            }
        }
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        passwordField.delegate = self
        emailField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        emailField.text = ""
        passwordField.text = ""
        descriptionLabel.text = " "
        updateDescription()
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if emailField.text!.characters.count > 1 && passwordField.text!.characters.count > 1 {
            if StringValidator.isValidEmailString(emailField.text!) {
                WebLink.loginMainUserWithCreds(email: emailField.text!, password: passwordField.text!) { result in
                    if case let WebLink.loginCase.Success(newishUser) = result {
                        UserStore.mainUser = newishUser
                    }
                    if case let WebLink.loginCase.Failure(failureString) = result {
                        UserStore.mainUser = nil
                        self.descriptionString = failureString
                    }
                }
            } else {
                descriptionString = "Email is not in a valid format"
            }
        } else {
            descriptionString = "Email/Pass must be longer than 2 characters."
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }


}

