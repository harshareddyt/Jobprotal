//
//  PostanofferViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 04/06/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//
import UIKit
import Foundation
class PostanofferViewController: UIViewController {
    var dataString = NSArray()
    var StateName = NSArray()
    var CityName = NSArray()
    var successmessage = String()
    var stateID = NSNumber()
//    var stateList = ["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu & Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim","TamilNadu","Telangana","Tripura","Uttarakhand","Uttar Pradesh","West Bengal"]
    var jobtypeList = ["Full Time","Part Time","Work From Home","Online Job"]
    @IBOutlet weak var mainscrl: UIScrollView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var titletextfield: UITextField!
    @IBOutlet weak var descriptiontextfield: UITextField!
    @IBOutlet weak var addtocontacttextfield: UITextField!
    @IBOutlet weak var phonetextfield: UITextField!
    @IBOutlet weak var emailidtextfield: UITextField!
    @IBOutlet weak var citytextfield: UITextField!
    @IBOutlet weak var statetetfield: UITextField!
    @IBOutlet weak var roletextfield: UITextField!
    @IBOutlet weak var workingplacetextfield: UITextField!
    @IBOutlet weak var jobtypetextfield: UITextField!
    @IBOutlet weak var titletextfield1: UITextField!
    @IBOutlet weak var descriptiontextfield1: UITextField!
    @IBOutlet weak var workingplacetextfield1: UITextField!
    @IBOutlet weak var roletextfield1: UITextField!
    @IBOutlet weak var jobtypetextfield1: UITextField!
    @IBOutlet weak var emailidtextfield1: UITextField!
    @IBOutlet weak var persontocontacttextfield1: UITextField!
    @IBOutlet weak var phonenumbertextfield1: UITextField!
    @IBOutlet weak var addtocontacttextfield1: UITextField!
    @IBOutlet weak var persontocontacttextfield: UITextField!
    @IBOutlet weak var citytextfield1: UITextField!
    @IBOutlet weak var statetextfield1: UITextField!
    @IBOutlet weak var CityView: UIView!
    @IBOutlet weak var CityScrl: UIScrollView!
    @IBOutlet weak var CityBtn: UIButton!
    @IBAction func postButton(_ sender: UIButton) {
        if ((titletextfield1.text?.isEmpty)! &&
            (descriptiontextfield1.text?.isEmpty)! && (workingplacetextfield1.text?.isEmpty)! && (emailidtextfield1.text?.isEmpty)!) &&
            (citytextfield1.text?.isEmpty)! && (statetextfield1.text?.isEmpty)! &&
        (phonenumbertextfield1.text?.isEmpty)! && (emailidtextfield1.text?.isEmpty)! &&
        (persontocontacttextfield1.text?.isEmpty)! && (addtocontacttextfield1.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Invalid Entry", message: "Fill all the fields", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else if (titletextfield1.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Invalid Entry", message: "Fill all the fields", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        } else if (descriptiontextfield1.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Failed", message: "Description is Empty", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        } else if (workingplacetextfield1.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Failed", message: "Working place is Empty", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        } else if (jobtypetextfield1.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Failed", message: "JobType is Empty", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        } else if (citytextfield1.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Failed", message: "CityName is Empty", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        } else if (statetextfield1.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Failed", message: "StateName is Empty", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }else if (phonenumbertextfield1.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Failed", message: "PhoneNumber is Empty", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            savejob()
            let x = ViewController()
            let alertController = UIAlertController(title: "Thank you", message: "Post Saved", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{ action in
                let ViewController = self.storyboard?.instantiateViewController(withIdentifier:"TabBar") as! TabBar
                self.present(ViewController, animated:false, completion:nil)
            }))
            present(alertController, animated: true, completion:nil)
        }
    }
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var stateScrl: UIScrollView!
    @IBOutlet weak var jobtypeView: UIView!
    @IBOutlet weak var jobtypeScrl: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        stateView.isHidden=true
        CityView.isHidden = true
        jobtypeView.isHidden = true
        statedrop()
        citydrop()
        jobtypedrop()
        mainscrl.contentSize.height = postButton.frame.origin.y + postButton.frame.height + 500
        postButton.layer.cornerRadius = 10
//        savejob()
    }
    func statedrop(){
        let url:URL = URL(string: "http://14.98.166.66/PartTimeJobs/api/JobsAPI/StateDrop")!
        let postString = ""
        print("postString:::\(postString)")
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
                let responseData:NSString  = NSString(data:urlData!,    encoding:String.Encoding.utf8.rawValue)!
                NSLog("Response ==> %@", responseData);
            }
        }
        do {
            let jsonData = try? JSONSerialization.jsonObject(with: urlData!, options: []) as! NSDictionary
             let dataStrings = (jsonData?.value(forKey:"info")) as! NSDictionary
            dataString = (jsonData?.value(forKey:"res")) as! NSArray
            print("dataString:::\(dataString)")
            StateName = dataString.value(forKey: "StateName") as! NSArray
            //            jobRole = dataString.value(forKey: "jobrole") as!  NSString
            //            jobLocation = dataString.value(forKey: "location") as!  NSString
            //            json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! Dictionary<String, AnyObject>
        }
        stateScrl.layer.borderWidth = 0.25
        stateScrl.bounces = false
        stateScrl.backgroundColor = UIColor.white
//        stateScrl.contentSize = CGSize(width: stateView.frame.size.width, height: CGFloat(StateName.count)*40)
        var b = 0
        var bb = 0
        for i in 0..<StateName.count
        {
            let But = UIButton()
            But.frame = CGRect(x: 0, y: b, width: Int(stateView.frame.size.width), height: 40)
            But.setTitle(StateName[i] as! String , for: .normal)
            But.layer.borderWidth = 0.25
            But.alpha = 0.9
            But.setTitleColor(UIColor.black, for: .normal)
            But.tag = i
            But.addTarget(self, action: #selector(sateAction), for: .touchUpInside)
            But.backgroundColor = UIColor.white
            stateScrl.addSubview(But)
            bb = b+40
            b = bb
            stateScrl.contentSize.height = But.frame.origin.y + But.frame.height + 10
        }
    }
    @objc func sateAction(sender:UIButton)
    {
        statetextfield1.text = sender.titleLabel?.text
        stateView.isHidden=true
    }
    @IBAction func statedropbut(_ sender: Any) {
        stateView.isHidden=false
    }
    func citydrop(){
        let url:URL = URL(string: "http://14.98.166.66/PartTimeJobs/api/JobsAPI/CityDrop?stateid=36")!
        let postString = ""
        print("postString:::\(postString)")
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
                let responseData:NSString  = NSString(data:urlData!,    encoding:String.Encoding.utf8.rawValue)!
                NSLog("Response ==> %@", responseData);
            }
        }
        do {
            let jsonData = try? JSONSerialization.jsonObject(with: urlData!, options: []) as! NSDictionary
            let dataStrings = (jsonData?.value(forKey:"info")) as! NSDictionary
            dataString = (jsonData?.value(forKey:"res")) as! NSArray
            print("dataString:::\(dataString)")
            CityName = dataString.value(forKey: "CityName") as! NSArray
            //            jobRole = dataString.value(forKey: "jobrole") as!  NSString
            //            jobLocation = dataString.value(forKey: "location") as!  NSString
            //            json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! Dictionary<String, AnyObject>
        }
        CityScrl.layer.borderWidth = 0.25
        CityScrl.bounces = false
        CityScrl.backgroundColor = UIColor.white
        //        stateScrl.contentSize = CGSize(width: stateView.frame.size.width, height: CGFloat(StateName.count)*40)
        var b = 0
        var bb = 0
        for i in 0..<CityName.count
        {
            let But = UIButton()
            But.frame = CGRect(x: 0, y: b, width: Int(CityView.frame.size.width), height: 40)
            But.setTitle(CityName[i] as! String , for: .normal)
            But.layer.borderWidth = 0.25
            But.alpha = 0.9
            But.setTitleColor(UIColor.black, for: .normal)
            But.tag = i
            But.addTarget(self, action: #selector(cityAction), for: .touchUpInside)
            But.backgroundColor = UIColor.white
            CityScrl.addSubview(But)
            bb = b+40
            b = bb
            CityScrl.contentSize.height = But.frame.origin.y + But.frame.height + 10
        }
    }
    @objc func cityAction(sender:UIButton)
    {
        citytextfield1.text = sender.titleLabel?.text
        CityView.isHidden=true
    }
    @IBAction func CityBtn(_ sender: UIButton) {
        CityView.isHidden=false
        stateView.isHidden = true
    }
    func jobtypedrop(){
        jobtypeScrl.layer.borderWidth = 0.25
        jobtypeScrl.bounces = false
        jobtypeScrl.backgroundColor = UIColor.white
        jobtypeScrl.contentSize = CGSize(width: jobtypeView.frame.size.width, height: CGFloat(jobtypeList.count)*40)
        var b = 0
        var bb = 0
        for i in 0..<jobtypeList.count
        {
            let But = UIButton()
            But.frame = CGRect(x: 0, y: b, width: Int(jobtypeView.frame.size.width), height: 40)
            But.setTitle(jobtypeList[i] as String , for: .normal)
            But.layer.borderWidth = 0.25
            But.alpha = 0.9
            But.setTitleColor(UIColor.black, for: .normal)
            But.tag = i
            But.addTarget(self, action: #selector(jobtypeAction), for: .touchUpInside)
            But.backgroundColor = UIColor.white
            jobtypeScrl.addSubview(But)
            bb = b+40
            b = bb
        }
    }
    @objc func jobtypeAction(sender:UIButton)
    {
        jobtypetextfield1.text = sender.titleLabel?.text
        jobtypeView.isHidden=true
    }
    @IBAction func jobtypebtn(_ sender: UIButton) {
        jobtypeView.isHidden=false
    }
    func savejob(){
        guard let url = URL(string: "http://14.98.166.66/PartTimeJobs/api/JobsAPI/SaveJob") else { return }
        let headers = [
            "Content-Type": "application/json",
            "cache-control": "no-cache",        ]
        let parameters = [
            "jobtitle": titletextfield1.text!,
            "jobdescription": descriptiontextfield1.text!,
            "jobrole": roletextfield1.text!,
            "location": workingplacetextfield1.text!,
            "jobtype": jobtypetextfield1.text!,
            "contactnumber": phonenumbertextfield1.text!,
            "contactperson": persontocontacttextfield1.text!,
//            "jobaddress": .text!,
            "emailid": emailidtextfield1.text!,
//            "postedby": contacttxtfield.text!
            "cityid": citytextfield1.text!]

        /*
         "jobid" : "0",
         "jobtitle" : "Senior Manager required",
         "jobdescription" : "senior manager in it department",
         "jobrole" : "Senior Manager",
         "location" : "Hyderabad",
         "jobtype" : "Parttime",
         "contactnumber" : "9908073618",
         "contactperson" : "Mahipal Reddy T",
         "jobaddress" : "3 Cube towers, Whitefields, Hyderabad",
         "emailid" : "tmpreddy2015@gmail",
         "postedby" : "1",
         "cityid" : "36"
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
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("json:  \(json)")
                        let jsonmessage  = ((json as AnyObject).value(forKey:"info")) as! NSDictionary
                        self.successmessage = jsonmessage.value(forKey: "errormessage") as! String
                        let message = "Emailid already exists."
                        if self.successmessage.isEqual(message) {
                            DispatchQueue.main.async {
                                IJProgressView.shared.hideProgressView()
                            }

                        } else {
                            DispatchQueue.main.async {
                                IJProgressView.shared.hideProgressView()
                            }
                            let alert = UIAlertController(title: "", message: "Thanks! Your Account has been succesfully created.", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "Please Login", style: .default, handler: { action in
                                DispatchQueue.main.async {
                                    IJProgressView.shared.hideProgressView()
                                }
                                let view = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                                self.present(view, animated: false,completion: nil)
                            })
                            alert.addAction(ok)
                            DispatchQueue.main.async(execute: {
                                self.present(alert, animated: true)
                            })
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
