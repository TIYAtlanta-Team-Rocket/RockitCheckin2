
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if emailField.text == "Test1@Test1.Test1" && passwordField.text == "Test1Test1" {
    //        UserStore.mainUser = UserStore.testUser1
            return
        }
        
        
        if emailField.text!.characters.count > 5 && passwordField.text!.characters.count > 5 {
            if StringValidator.isValidEmailString(emailField.text!) {
                do {
                UserStore.mainUser = try WebLink.fetchUserWithLogin(email: emailField.text!, password: passwordField.text!)
                } catch WebLink.errorList.invalidEmailOrPassword(let errorString) {
                    descriptionLabel.text = errorString
                    return
                } catch {
                    descriptionLabel.text = "Unexpected Error"
                    return
                }
                
            } else {
                descriptionLabel.text = "Email is not in a valid format"
            }
        } else {
            descriptionLabel.text = "Email and Password must be longer than 5 characters"
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

