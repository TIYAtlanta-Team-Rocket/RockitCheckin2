import Foundation
import UIKit
import MessageUI

class ProfileViewController: UIViewController {
    static let composeVC = MFMailComposeViewController()
    
    func setDelegate() {
      //  ProfileViewController.composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        ProfileViewController.composeVC.setToRecipients(["address@example.com"])
        ProfileViewController.composeVC.setSubject("Hello!")
        ProfileViewController.composeVC.setMessageBody("Hello from California!", isHTML: false)
        

        
    }
    
    
    
    
    func canSendEmail () {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    
    
    @IBAction func emailButtonPressed(sender: AnyObject)  {
        setDelegate()
        // Present the view controller modally.
        self.present(ProfileViewController.composeVC, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

