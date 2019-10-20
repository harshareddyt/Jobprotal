//
//  PostViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 31/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit
class PostViewController: UIViewController {
    @IBOutlet weak var postanofferview: UIView!
    @IBOutlet weak var seeyourpostingview: UIView!
    @IBOutlet weak var Textfield1: UITextField!
    @IBOutlet weak var Textfield2: UITextField!
    @IBOutlet weak var postanoffer_btn: UIButton!
    @IBAction func postanoffer_btn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostanofferViewController") as! PostanofferViewController
        self.present(vc, animated: true, completion: nil)
    }
//    @IBOutlet weak var seeyourposting_btn: UIButton!
//    @IBAction func seeyourposting_btn(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SeeyourPostingsViewController") as! SeeyourPostingsViewController
//        self.present(vc, animated: true, completion: nil)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//      Textfield1.layer.cornerRadius = Textfield1.frame.size.height / 2
        postanofferview.layer.borderWidth = 1.0
        postanofferview.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        postanofferview.layer.shadowOpacity = 5
        postanofferview.layer.shadowRadius = 5
        postanofferview.layer.shadowColor = UIColor.black.cgColor
        seeyourpostingview.layer.borderWidth = 1.0
        seeyourpostingview.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        seeyourpostingview.layer.shadowOpacity = 5
        seeyourpostingview.layer.shadowRadius = 5
        seeyourpostingview.layer.shadowColor = UIColor.black.cgColor
    }
}
