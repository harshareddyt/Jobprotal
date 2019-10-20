//
//  LoginViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 31/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    var gl:CAGradientLayer!
    var personname = NSString()
//  var locationManager: CLLocationManager?
    @IBAction func skipbutton(_ sender: UIButton) {
    }
    @IBOutlet weak var parttimestopView: UIView!
    @IBOutlet weak var PTImage: UIImageView!
    @IBOutlet weak var Email_View: UIView!
    @IBOutlet weak var Emailtxt_View: UIView!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var Emailicon_View: UIView!
    @IBOutlet weak var Emailicon_Img: UIImageView!
    @IBOutlet weak var Password_View: UIView!
    @IBOutlet weak var Passwordtext_View: UIView!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var Passwordicon_View: UIView!
    @IBOutlet weak var passwordicon_Img: UIImageView!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var ForgotPasswordButton: UIButton!
    @IBAction func LoginButton(_ sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBar
//        self.present(vc, animated: true, completion: nil)
        logincheck()
    }
    @IBAction func signupButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func forgotpasswordButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    //UserDefaults.standard.set("Anand", forKey: "name")


    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()


        Email_View.layer.cornerRadius = 15
        Email_View.clipsToBounds = true
        Emailtxt_View.layer.cornerRadius = 15
        Emailtxt_View.clipsToBounds = true
        Emailicon_View.layer.cornerRadius = 15
        Emailicon_View.clipsToBounds = true
        EmailTextField.layer.cornerRadius = 15
        EmailTextField.clipsToBounds = true
        
        Password_View.layer.cornerRadius = 15
        Password_View.clipsToBounds = true
        Passwordtext_View.layer.cornerRadius = 15
        Passwordtext_View.clipsToBounds = true
        Passwordicon_View.layer.cornerRadius = 15
        Passwordicon_View.clipsToBounds = true
        PasswordTextField.layer.cornerRadius = 15
        PasswordTextField.clipsToBounds = true
        PasswordTextField.isSecureTextEntry = true
        
        LoginButton.layer.cornerRadius = 20
        LoginButton.clipsToBounds = true
        LoginButton.layer.masksToBounds = true
        
        EmailTextField.attributedPlaceholder = NSAttributedString(string: "Mobile Number",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        PasswordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
      
    }
    func setGradientBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [-1, 1.3]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    
    
    func logincheck()
    {
        
        let url:URL = URL(string:"http://14.98.166.66/PartTimeJobs/api/JobsAPI/LoginCheck")!
        
        let postString = "contactnumber=\(EmailTextField.text!)&pword=\(PasswordTextField.text!)"
        
        let postData:Data = postString.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))!
        
        let postLength:NSString = String( postData.count ) as NSString
        
        let request:NSMutableURLRequest = NSMutableURLRequest(url:url)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        var reponseError: NSError?
        var response: URLResponse?
        var urlData: Data?
        
        do {
            
            urlData = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning:&response)
            
        } catch let error as NSError {
            reponseError = error
            urlData = nil
        }
        
        if ( urlData != nil ) {
            let res = response as! HTTPURLResponse!;
            
            print("Response code: %ld", res?.statusCode);
            
            if ((res?.statusCode)! >= 200 && (res?.statusCode)! < 300)
            {
                let responseData:NSString  = NSString(data:urlData!, encoding:String.Encoding.utf8.rawValue)!
                
                NSLog("Response ==> %@", responseData);
            }
        }
        
        do {
            
            let jsonData = try? JSONSerialization.jsonObject(with: urlData!, options: []) as! NSDictionary
            
            print("Success: %ld", jsonData);
            
            let dataString = (jsonData?.value(forKey:"info")) as! NSDictionary
            print("dataString:\(dataString)")
            
            let sucess = (dataString.value(forKey:"errormessage")) as! NSString
            
            print("sucess:\(sucess)")
            
            let falses =  "Success"
            let invalidmail = "EmailID/Password required."
            let invalidpswd = "Invalid password"
            
            if falses.isEqual(sucess)
            {
                let view = self.storyboard?.instantiateViewController(withIdentifier:
                    "TabBar") as! TabBar
                self.present( view, animated:false, completion:nil)
            }
            else if invalidmail.isEqual(sucess)
            {
                let alertController = UIAlertController(title: "Login Failed", message: "check your Mail ID", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alertController, animated: true, completion: nil)
                print("Invalid em")
            }
            else if invalidpswd.isEqual(sucess)
            {
                let alertController = UIAlertController(title: "Login Failed", message: "Plz check Your Password", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alertController, animated: true, completion: nil)
                
                print("Invalid Password")
            }
        }
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
