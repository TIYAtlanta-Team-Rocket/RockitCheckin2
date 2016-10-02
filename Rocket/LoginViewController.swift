
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if emailField.text!.characters.count > 1 && passwordField.text!.characters.count > 1 {
            if StringValidator.isValidEmailString(emailField.text!) {
                WebLink.loginMainUserWithCreds(email: emailField.text!, password: passwordField.text!) { result in
                    
                    if case let WebLink.loginCase.Success(newishUser) = result {
                        UserStore.mainUser = newishUser
                    }
                    if case let WebLink.loginCase.Failure(failureString) = result {
                        UserStore.mainUser = nil
                        self.descriptionLabel.text = failureString
                    }
                }
            } else {
                descriptionLabel.text = "Email is not in a valid format"
            }
        } else {
            descriptionLabel.text = "Email and Password must be longer than 2 characters"
        }
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
        descriptionLabel.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }


}

