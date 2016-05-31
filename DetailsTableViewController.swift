//
//  DetailsTableViewController.swift
//  Lab4
//
//  Created by Bekah Suttner on 5/30/16.
//  Copyright © 2016 Bekah Suttner. All rights reserved.
//

import UIKit

class DetailsTableViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    var name: String = "Initial"
    var email: String = "Initial"
    var phone: String = "Initial"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = self.name
        self.emailLabel.text = self.email
        self.phoneLabel.text = self.phone
    }
    
}
