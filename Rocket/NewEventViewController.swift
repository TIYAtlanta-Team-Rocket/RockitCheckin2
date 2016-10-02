//
//  NewEventViewController.swift
//  Rocket
//
//  Created by Daniel Kwolek on 10/2/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var eventNameField: UITextField!
    @IBOutlet var eventLocationField: UITextField!
    
    @IBOutlet var descriptionField: UITextField!
    @IBAction func addEventButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return true
    }
    
    
}
