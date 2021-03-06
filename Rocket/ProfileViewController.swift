import Foundation
import UIKit
import MessageUI

class ProfileViewController: UIViewController, MFMailComposeViewControllerDelegate {
    static let composeVC = MFMailComposeViewController()
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    
    
    
    func setDelegate() {
        ProfileViewController.composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        ProfileViewController.composeVC.setToRecipients(["Daniel.M.Kwolek@gmail.com"])
        ProfileViewController.composeVC.setSubject("Hello!")
        ProfileViewController.composeVC.setMessageBody("Hello from California!", isHTML: false)
        

        
    }
    
    static func canSendEmail () {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    
    
    @IBAction func emailButtonPressed(sender: AnyObject)  {
        setDelegate()
        // Present the view controller modally.
        ProfileViewController.canSendEmail()
        self.present(ProfileViewController.composeVC, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(UserStore.profileUser!.firstName!)"
        self.setDelegate()
    }
    override func viewDidAppear(_ animated: Bool) {
        nameTextField.text = "\(UserStore.profileUser!.firstName!) \(UserStore.profileUser!.lastName!)"
        emailTextField.text = UserStore.profileUser!.email!
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

