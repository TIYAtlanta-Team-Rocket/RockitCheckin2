

import UIKit

class MyEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func logoutButtonPressed(_ sender: AnyObject) {
        UserStore.mainUser = nil
        self.navigationController?.removeFromParentViewController()
    }
    
    
    @IBOutlet var checkedInTableView: UITableView!
    
    
    
    @IBOutlet var otherEventsTableView: UITableView!
    
    
    
    @IBOutlet var newEventButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        checkedInTableView.delegate = self
        otherEventsTableView.delegate = self
        checkedInTableView.dataSource = self
        otherEventsTableView.delegate = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        WebLink.storeAllEvents()
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
 
    @IBOutlet var checkedInCellEventName: UILabel!

    @IBOutlet var checkedInEventID: UILabel!
    
    @IBOutlet var otherEventsCellEventName: UILabel!
    
    @IBOutlet var otherEventsEventID: UILabel!
    
    
    
}

class checkedInTableViewController: UITableViewController {
    
    
       var events: [Event] = EventStore.allTheEvents {
            didSet {
                tableView.reloadData()
                for event in events {
                    print(event)
                }
            }
        }
    
       fileprivate var eventStore = EventStore.allTheEvents
    
}

extension checkedInTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! checkedInEventCell

        let event = events[indexPath.row]

        cell.title.text = event.name

        cell.eventID.text = "\(event.eventID)"

        return cell
    }
    
}

class checkedInEventCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var eventID: UILabel!

    func updateWith(event: Event) {
        self.title.text = event.name
        self.eventID.text = "\(event.eventID)"
    }

}



