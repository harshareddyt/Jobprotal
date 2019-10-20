//
//  UserProfileViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 31/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var mainview: UIView!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func logoutButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainview.layer.borderWidth = 1.0
        mainview.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        mainview.layer.shadowOpacity = 1
        mainview.layer.shadowRadius = 10
        mainview.layer.shadowColor = UIColor.black.cgColor
        logoutButton.layer.cornerRadius = 10
    }
    
}
