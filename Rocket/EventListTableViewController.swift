

import UIKit

class EventListTableViewController: UITableViewController {
    
    var eventStore: EventStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Events"
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventStore.allTheEvents!.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",
                                                 for: indexPath)
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        
  
        
        return cell
    }
    
}

