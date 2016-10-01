import UIKit

class NewEventTableViewController: UITableViewController {
    
    //   var events: [Event] = EventStore.tempEvents {
//        didSet {
//            tableView.reloadData()
//            for event in events {
//                print(event)
//            }
//        }
//    }
    
    //   fileprivate var eventStore = EventStore.tempEvents
    
}

//extension NewEventTableViewController {
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return events.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventCell
//        
//        let event = events[indexPath.row]
//        
//        cell.title.text = event.name
//        
//        cell.eventID.text = event.eventID?.uuidString
//        
//        return cell
//    }
//    
//}
//
//class eventCell: UITableViewCell {
//    
//    @IBOutlet var title: UILabel!
//    @IBOutlet var eventID: UILabel!
//    
//    func updateWith(event: Event) {
//        self.title.text = event.name
//        self.eventID.text = event.eventID?.uuidString
//    }
//    
//}


//@interface ItemsViewController ()
//@property (strong, nonatomic) IBOutlet UITableView *imageView;
//
//@end
//
//@implementation ItemsViewController
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.itemStore.allItems.count;
//    }
//    
//    - (void)viewDidLoad {
//        [super viewDidLoad];
//        self.tableView.rowHeight = UITableViewAutomaticDimension;
//        self.tableView.estimatedRowHeight = 65;
//        }
//        
//        - (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.tableView reloadData];
//    
//    
//    }
//    
//    
//    - (UITableViewCell *)tableView:(UITableView *)tableView
//cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    ItemCell *cell =
//        [self.tableView dequeueReusableCellWithIdentifier:@"ItemCell"
//    forIndexPath:indexPath];
//    
//    [cell updateLabels];
//    
//    Item *item = self.itemStore.allItems[indexPath.row];
//    
//    cell.nameLabel.text = item.name;
//    cell.serialNumberLabel.text = item.serialNumber;
//    cell.valueLabel.text = [NSString stringWithFormat:@"$%d", item.valueInDollars];
//    
//    return cell;
//    }
//    
//    // MARK: - Actions
//    - (IBAction)addNewItem:(id)sender {
//        
//        // Create a new item and add it to the store
//        Item *newItem = [self.itemStore createItem];
//        // Figure out where that item is in the array
//        NSUInteger itemIndex = [self.itemStore.allItems indexOfObject:newItem];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:itemIndex inSection:0];
//        
//        
//        // Insert this row into the table
//        [self.tableView insertRowsAtIndexPaths:@[indexPath]
//        withRowAnimation:UITableViewRowAnimationAutomatic];
//        }
//        
//        
//        
//        - (void)tableView:(UITableView *)tableView
//commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
//forRowAtIndexPath:(NSIndexPath *)indexPath {
//    // If the table view is asking to commit a delete command...
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        Item *item = self.itemStore.allItems[indexPath.row];
//        
//        
//        NSString *title = [NSString stringWithFormat:@"Delete %@", item.name];
//        NSString *message = @"Are you sure that you want to delete this item?";
//        UIAlertController *ac =
//        [UIAlertController alertControllerWithTitle:title
//        message:message
//        preferredStyle:UIAlertControllerStyleActionSheet];
//        
//        UIAlertAction *cancelAction =
//        [UIAlertAction actionWithTitle:@"Cancel"
//        style:UIAlertActionStyleCancel
//        handler:nil];
//        UIAlertAction *deleteAction =
//        [UIAlertAction actionWithTitle:@"Remove"
//        style:UIAlertActionStyleDestructive
//        handler:^(UIAlertAction * _Nonnull action) {
//        // Remove the item from the store
//        [self.itemStore removeItem:item];
//        
//        // Delete the item's image from the image store
//        [self.imageStore deleteImageForKey:item.itemKey];
//        
//        // Also remove its cell from the table view
//        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
//        withRowAnimation:UITableViewRowAnimationAutomatic];
//        
//        }];
//        [ac addAction:cancelAction];
//        [ac addAction:deleteAction];
//        [self presentViewController:ac animated:YES completion:nil];
//        
//        
//    }
//    }
//    
//    
//    - (void)tableView:(UITableView *)tableView
//moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
//toIndexPath:(NSIndexPath *)destinationIndexPath {
//    [self.itemStore moveItemAtIndex:sourceIndexPath.row
//        toIndex:destinationIndexPath.row];
//    
//    }
//    
//    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//        // If the triggered segue is the "ShowItem" segue
//        if ([segue.identifier isEqualToString:@"ShowItem"]) {
//            // Figure out which row was just tapped
//            NSInteger row = [self.tableView indexPathForSelectedRow].row;
//            // Get the item at that row and pass it along
//            // to the segue's destination view controller
//            Item *item = self.itemStore.allItems[row];
//            DetailViewController *dvc =
//                (DetailViewController *)segue.destinationViewController;
//            dvc.item = item;
//            dvc.imageStore = self.imageStore;
//        }
//        }
//        
//        // MARK: - Initializers
//        - (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        self.navigationItem.leftBarButtonItem = [self editButtonItem];
//    }
//    return self;
//}
//
//
//@end
