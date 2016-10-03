
//
//  File.swift
//  Rocket
//
//  Created by Daniel Kwolek on 10/2/16.
//  Copyright © 2016 Arcore. All rights reserved.
//


import UIKit

class CheckedInEventCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var eventID: UILabel!
    
    func updateWith(event: Event) {
        self.title.text = event.name
        self.eventID.text = event.eventid!.description
    }
}
