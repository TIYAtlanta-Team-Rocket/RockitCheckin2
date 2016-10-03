

import UIKit

class EventViewController: UIViewController {
        @IBOutlet var eventName: UILabel!
        @IBOutlet var eventLocation: UILabel!
        @IBOutlet var eventDescription: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Event"
    }
    override func viewDidAppear(_ animated: Bool) {
        self.eventName.text = EventStore.mainEvent!.name!
        self.eventLocation.text = EventStore.mainEvent!.location!
        self.eventDescription.text = EventStore.mainEvent!.description!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

