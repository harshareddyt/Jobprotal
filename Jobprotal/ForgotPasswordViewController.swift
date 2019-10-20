//
//  ForgotPasswordViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 30/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    var gl:CAGradientLayer!
    
    @IBOutlet weak var PTiconImage: UIImageView!
    @IBOutlet weak var forgotpwd_View: UIView!
    @IBOutlet weak var forgotpasswordView: UIView!
    @IBOutlet weak var forgotpasswordtxt_View: UIView!
    
    @IBOutlet weak var forgotpwdTextField: UITextField!
    
    @IBOutlet weak var usericon_image: UIView!
    
    @IBOutlet weak var Userimg: UIImageView!
    
    
    @IBOutlet weak var submit_btn: UIButton!
    
    @IBAction func submit_btn(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func setGradientBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [-1, 1.3]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        usericon_image.layer.cornerRadius = 20
        usericon_image.clipsToBounds = true
        //          UserimgView.layer.borderWidth = 1
        usericon_image.layer.masksToBounds = true
        
        forgotpasswordView.layer.cornerRadius = 15
        forgotpasswordView.clipsToBounds = true
        forgotpasswordtxt_View.layer.cornerRadius = 15
        forgotpasswordtxt_View.clipsToBounds = true
        //        forgotpasswordView.layer.masksToBounds = true
        
        forgotpwdTextField.layer.cornerRadius = 10
        forgotpwdTextField.layer.masksToBounds  = true
        forgotpwdTextField.clipsToBounds = true
        forgotpwd_View.layer.cornerRadius = 20
        forgotpwd_View.clipsToBounds = true
        
        submit_btn.layer.cornerRadius = 20
        submit_btn.clipsToBounds = true
        submit_btn.layer.masksToBounds = true
       
        forgotpwdTextField.attributedPlaceholder = NSAttributedString(string: "Email-Id",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
}
