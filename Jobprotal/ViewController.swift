//
//  ViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 30/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    var gl:CAGradientLayer!

    
    @IBOutlet weak var LoginSignupView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var signupButton: UIButton!
    @IBAction func signupButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        LoginSignupView.layer.cornerRadius = 70
        LoginSignupView.clipsToBounds = true
//        showUserSettings()
        
//        if let url = URL(string: "App-prefs:root=LOCATION_SERVICES") {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound],completionHandler:{ didAllow,error in
        })
    }
    
    func showUserSettings() {
        guard let urlGeneral = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(urlGeneral)
    }

    
    func setGradientBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [-1, 1.3]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
