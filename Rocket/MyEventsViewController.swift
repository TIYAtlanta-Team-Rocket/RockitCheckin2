

import UIKit

class MyEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBAction func logoutButtonPressed(_ sender: AnyObject) {
        UserStore.mainUser = nil
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckedInEventCell", for: indexPath) as! CheckedInEventCell
        let event = EventStore.allTheEvents[indexPath.row]
        cell.title.text = event.name
        cell.eventID.text = " "
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventStore.allTheEvents.count
    }
    
    @IBOutlet var checkedInTableView: UITableView!
    
    @IBOutlet var newEventButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserStore.mainUser?.adminFlag == false {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
        WebLink.updateAllEvents()
        checkedInTableView.reloadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        checkedInTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyEventSegue" {
            let cell = sender as! CheckedInEventCell
            for event in EventStore.allTheEvents {
                if cell.eventID.text == event.eventid!.description {
                    EventStore.mainEvent = event
                }
            }
        }
        else if segue.identifier == "MainProfileSegue" {
            UserStore.profileUser = UserStore.mainUser
        }
    }
}
