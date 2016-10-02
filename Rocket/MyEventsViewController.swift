

import UIKit

class MyEventsViewController: UIViewController {
    @IBAction func logoutButtonPressed(_ sender: AnyObject) {
        UserStore.mainUser = nil
        self.navigationController?.removeFromParentViewController()
    }
    @IBOutlet var newEventButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
}

