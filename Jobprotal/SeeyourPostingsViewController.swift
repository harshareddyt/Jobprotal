//
//  SeeyourPostingsViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 04/06/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit
import CoreLocation



class SeeyourPostingsViewController: UIViewController , CLLocationManagerDelegate {
    
    var gl:CAGradientLayer!
    let locationMgr = CLLocationManager()
    var jobID = NSNumber()
    var ID = NSNumber()
    var datastring = NSDictionary()





    
    @IBOutlet weak var mainScrl: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
        @IBOutlet weak var jobtitleLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var descriptiontextfield: UITextField!
    @IBOutlet weak var workingplacetextfield: UITextField!
    @IBOutlet weak var locationtextfield: UITextField!
    @IBOutlet weak var jobtypetextfield: UITextField!
    @IBOutlet weak var jobroletextfield: UITextField!
    @IBOutlet weak var phonenumbertextfield: UITextField!
    @IBOutlet weak var addresstextfield: UITextField!
    @IBOutlet weak var persontocontacttextfield: UITextField!
    @IBOutlet weak var mailtocontacttextfield: UITextField!
    @IBOutlet weak var okayButton: UIButton!
    
    @IBAction func turnonloc(_ sender: UIButton) {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        // 1
        case .notDetermined:
            locationMgr.requestWhenInUseAuthorization()
            return
            
        // 2
        case .denied, .restricted:
            let alert = UIAlertController(title: "Location Services disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        case .authorizedAlways, .authorizedWhenInUse:
            break
            
        }
        
        // 4
        locationMgr.delegate = self
        locationMgr.startUpdatingLocation()
//
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedLoad()
        
        setGradientBackground()

        mainScrl.contentSize.height = okayButton.frame.origin.y + okayButton.frame.height + 750
        okayButton.layer.cornerRadius = 10

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last {
            print("Current location: \(currentLocation)")
        }
    }
    
    // 2
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func setGradientBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [-2,1]
        gradientLayer.frame = self.view.bounds
        
        self.topView.layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    
    
    func detailedLoad(){
        let url:URL = URL(string: "http://14.98.166.66/PartTimeJobs/api/JobsAPI/GetById?id/")!
        let postString = "id=\(jobID)"
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
                let responseData:NSString  = NSString(data:urlData!, encoding:String.Encoding.utf8.rawValue)!
                NSLog("Response ==> %@", responseData);
            }
        }
        do {
            let jsonData = try? JSONSerialization.jsonObject(with: urlData!, options: []) as! NSDictionary
            
//            let jsonmessage = ((jsonData as AnyObject).value(forKey:"info") as! NSDictionary)
             datastring = (jsonData?.value(forKey:"res")) as! NSDictionary
           
            ID = datastring.value(forKey: "id") as! NSNumber
        }
    }

    
    

}
