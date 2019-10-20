//
//  SignUpViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 30/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var gl:CAGradientLayer!
    var successmessage = String()
    var ID = NSNumber()



    @IBOutlet weak var signuplabel_View: UIView!
    @IBOutlet weak var Uplabel: UILabel!
    @IBOutlet weak var signlabel: UILabel!
    @IBOutlet weak var PTiconImage: UIImageView!
    @IBOutlet weak var RegisterBtn: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var username_View: UIView!
    @IBOutlet weak var email_View: UIView!
    @IBOutlet weak var contact_View: UIView!
    @IBOutlet weak var address_View: UIView!
    @IBOutlet weak var postalcode_View: UIView!
    @IBOutlet weak var password_View: UIView!
    
    @IBOutlet weak var usernametxt_View: UIView!
    @IBOutlet weak var emailtxt_View: UIView!
    @IBOutlet weak var contacttxt_View: UIView!
    @IBOutlet weak var addresstxt_View: UIView!
    @IBOutlet weak var postalcodetxt_View: UIView!
    @IBOutlet weak var paswordtxt_View: UIView!
    
    @IBOutlet weak var usernametxtfield: UITextField!
    @IBOutlet weak var emailtxtfield: UITextField!
    @IBOutlet weak var contacttxtfield: UITextField!
    @IBOutlet weak var addresstxtfield: UITextField!
    @IBOutlet weak var postalcodetxtfield: UITextField!
    @IBOutlet weak var passwordtxtfield: UITextField!
    
    @IBOutlet weak var usernameiconView: UIView!
    @IBOutlet weak var emailiconView: UIView!
    @IBOutlet weak var contacticonView: UIView!
    @IBOutlet weak var addressiconView: UIView!
    @IBOutlet weak var postalcodeiconView: UIView!
    @IBOutlet weak var passwordiconView: UIView!
    
    @IBOutlet weak var usernameicon_Image: UIImageView!
    @IBOutlet weak var emailicon_Image: UIImageView!
    @IBOutlet weak var contacticon_Image: UIImageView!
    @IBOutlet weak var addressicon_Image: UIImageView!
    @IBOutlet weak var postalcodeicon_Image: UIImageView!
    @IBOutlet weak var passwordicon_Image: UIImageView!
    
    
    @IBAction func RedisterButton(_ sender: UIButton) {
        signup()
        let alert = UIAlertController(title: "", message: "Thanks! Your Account has been succesfully created.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Please Login", style: .default, handler: { action in
            
            DispatchQueue.main.async {
                IJProgressView.shared.hideProgressView()
            }
            
            let view = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            //
            self.present(view, animated: false,completion: nil)
            
        })
        
        alert.addAction(ok)
        
        
        DispatchQueue.main.async(execute: {
            
            self.present(alert, animated: true)
            
        })
        
//        users.set(usernametxtfield, forKey: "fullName")
//        users.set(email, forKey: "email")
//        ruserok        
        
    }
    
    
    @IBAction func LoginNowButton(_ sender: UIButton) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        usernameiconView.layer.cornerRadius = 20
        usernameiconView.clipsToBounds = true
        usernameiconView.layer.masksToBounds = true
        emailiconView.layer.cornerRadius = 20
        emailiconView.clipsToBounds = true
        emailiconView.layer.masksToBounds = true
        contacticonView.layer.cornerRadius = 20
        contacticonView.clipsToBounds = true
        contacticonView.layer.masksToBounds = true
        addressiconView.layer.cornerRadius = 20
        addressiconView.clipsToBounds = true
        addressiconView.layer.masksToBounds = true
        postalcodeiconView.layer.cornerRadius = 20
        postalcodeiconView.clipsToBounds = true
        postalcodeiconView.layer.masksToBounds = true
        passwordiconView.layer.cornerRadius = 20
        passwordiconView.clipsToBounds = true
        passwordiconView.layer.masksToBounds = true
        
        usernametxt_View.layer.cornerRadius = 15
        usernametxt_View.clipsToBounds = true
        usernametxt_View.layer.masksToBounds = true
        emailtxt_View.layer.cornerRadius = 15
        emailtxt_View.clipsToBounds = true
        emailtxt_View.layer.masksToBounds = true
        contacttxt_View.layer.cornerRadius = 15
        contacttxt_View.clipsToBounds = true
        contacttxt_View.layer.masksToBounds = true
        addresstxt_View.layer.cornerRadius = 15
        addresstxt_View.clipsToBounds = true
        addresstxt_View.layer.masksToBounds = true
        postalcodetxt_View.layer.cornerRadius = 15
        postalcodetxt_View.clipsToBounds = true
        postalcodetxt_View.layer.masksToBounds = true
        paswordtxt_View.layer.cornerRadius = 15
        paswordtxt_View.clipsToBounds = true
        paswordtxt_View.layer.masksToBounds = true
        
        RegisterBtn.layer.cornerRadius = 20
        RegisterBtn.clipsToBounds = true
        RegisterBtn.layer.masksToBounds = true
        
        passwordtxtfield.isSecureTextEntry = true
        
        usernametxtfield.attributedPlaceholder = NSAttributedString(string: "Username",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailtxtfield.attributedPlaceholder = NSAttributedString(string: "Email-Id",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        addresstxtfield.attributedPlaceholder = NSAttributedString(string: "Address",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        contacttxtfield.attributedPlaceholder = NSAttributedString(string: "Contact Number",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        postalcodetxtfield.attributedPlaceholder = NSAttributedString(string: "Postalcode",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordtxtfield.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        rechebil()
        signup()

        
        
    }
    
    
    func setGradientBackground() {
            
    let gradientLayer = CAGradientLayer()
      gradientLayer.colors = [UIColor.blue.cgColor, UIColor.black.cgColor]
      gradientLayer.locations = [-1, 1.3]
      gradientLayer.frame = self.view.bounds
            
      self.view.layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    
    
    
    
    
    func signup(){
        
        DispatchQueue.main.async {
            
            IJProgressView.shared.showProgressView()
        }
        
        guard let url = URL(string: "http://14.98.166.66/PartTimeJobs/api/JobsAPI/Signup") else { return }
        let headers = [
            "Content-Type": "application/json",
            "cache-control": "no-cache",
            //            "Postman-Token": "a670c020-5d3e-4e05-8535-5c8ad7c63eb2"
        ]
        let parameters = [
            "username": usernametxtfield.text!,
            "emailid": emailtxtfield.text!,
            "pword": passwordtxtfield.text!,
            "useraddress": addresstxtfield.text!,
            "postalcode": postalcodetxtfield.text!,
            "contactnumber": contacttxtfield.text!]

        /*
         "userid" : "0",
         "username" : "Mahipal Reddy",
         "emailid" : "tmpreddy2015@gmail.com",
         "pword" : "12345",
         "useraddress" : "hyderabad",
         "postalcode" : "500010",
         "contactnumber" : "9908073618",
        */


        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                //print(response)
            }
            //  print("parameter:\(parameters)")
            if let data = data {
                do {
                    let status = Reach().connectionStatus()
                    switch status {
                    case .unknown, .offline:
                        print("Not connected")

                        let alert = UIAlertController(title: "", message: "No Internet Connection", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Try Again", style: .default, handler: { action in
                            self.rechebil()
                        })
                        alert.addAction(ok)
                        DispatchQueue.main.async(execute: {
                            self.present(alert, animated: true)
                        })
                    case .online(.wwan):
                        print("Connected via WWAN")
                    case .online(.wiFi):
                        print("Connected via WiFi")
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
//                        let info = try JSONSerialization.jsonObject(with: data,options: [])
                        print("json:  \(json)")
                        let jsonmessage  = ((json as AnyObject).value(forKey:"info") as! NSDictionary)
                        
                        let datasstring  = jsonmessage.value(forKey: "res") as! NSDictionary
                        
////                            .value(forKey: "res") as! NSDictionary)
//                       let jsonmessage1 = ((info as AnyObject).value(forKey:"res")) as! NSDictionary
                        self.successmessage = datasstring.value(forKey: "errormessage") as! String
                        
                        
                        // let lat = ((((dic["results"] as! AnyObject).value(forKey: "geometry") as AnyObject).value(forKey: "location") as AnyObject).value(forKey: "lat") as AnyObject).object(0) as! Double

                        

                        let message = "Emailid already exists."

                        if self.successmessage.isEqual(message) {



                            DispatchQueue.main.async {

                                IJProgressView.shared.hideProgressView()
                                
                              
                            }

                        } else {
                            DispatchQueue.main.async {
                                IJProgressView.shared.hideProgressView()
                            }


//                            let alert = UIAlertController(title: "", message: "Thanks! Your Account has been succesfully created.", preferredStyle: .alert)
//
//                            let ok = UIAlertAction(title: "Please Login", style: .default, handler: { action in
//
//                                DispatchQueue.main.async {
//                                    IJProgressView.shared.hideProgressView()
//                                }
//
//                                let view = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                                //
//                                self.present(view, animated: false,completion: nil)
//
//                            })
//
//                            alert.addAction(ok)
//
//
//                            DispatchQueue.main.async(execute: {
//
//                                self.present(alert, animated: true)
//
//                            })


                        }


                    }
                } catch {

                    print(error)
                }
            }
            }
            .resume()
    }


    func rechebil()
    {
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            print("Not connected")
            let alert = UIAlertController(title: "", message: "No Internet Connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Try Again", style: .default, handler: { action in
                self.rechebil()
            })
            alert.addAction(ok)
            DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
            })
        case .online(.wwan):
            print("Connected via WWAN")
        case .online(.wiFi):
            print("Connected via WiFi")
        }
    }
   
}
