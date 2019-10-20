
//
//  HomeViewController.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 31/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var recordsArray:[Int] = Array()
//    var limit = 20
//    let totalEnteries = 100

    
    var dataString = NSArray()
    var jobRole = NSString()
    var jobLocation = NSString()
    var jobID = NSNumber()
    var pagenumber = 100
    var pagesize = 4
    
//    var pagenumber:[Int] = Array()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier:"MyTableViewCell",for: indexPath) as!MyTableViewCell
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyTableViewCell") as! MyTableViewCell
        }
        cell.newlbl.text = "Row \(recordsArray[indexPath.row])"
        
        
//        let JobRole = dataString.value(forKey:"jobrole") as! NSArray
//
//        cell.jobrolelabel.text = JobRole[indexPath.row] as! String
//
//        let PostedBy = dataString.value(forKey:"username") as! NSArray
//
//        cell.postedpersonname.text = PostedBy[indexPath.row] as! String
//
//        let JobLocation = dataString.value(forKey:"location") as! NSArray
//        cell.joblocationlabel.text = JobLocation[indexPath.row] as! String

        return cell
        /*
         
         var cell = tableView.dequeueReusableCell(withIdentifier: "listcell")
         if cell == nil {
         cell = UITableViewCell(style: .default, reuseIdentifier: "listcell")
         }
         cell?.textLabel?.text = "Row \(recordsArray[indexPath.row])"
         return cell!
 
         
         
         
         */
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == recordsArray.count - 1 {
            // we are at last cell load more content
            if recordsArray.count < pagenumber {
                // we need to bring more records as there are some pending records available
                var index = recordsArray.count
                pagesize = index + 20
                while index < pagesize {
                    recordsArray.append(index)
                    index = index + 1
                }
                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
            }
        }
    }
    @objc func loadTable() {
        self.tableview.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let x = indexPath.row
        print("CoMmInG")
        let vc = storyboard?.instantiateViewController(withIdentifier: "SeeyourPostingsViewController") as!  SeeyourPostingsViewController
        let ID = (self.dataString.object(at: x) as! NSDictionary).value(forKey: "id") as! NSNumber
        vc.jobID = ID
        self.present(vc, animated: true, completion: nil)
    }
    

    
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
//        homeData()
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView(frame: .zero)

        var index = 0
        while index < pagesize {
            recordsArray.append(index)
            index = index + 1
        }
      
        }
   
    
    
    func homeData(){
        
        // let url:URL = URL(string: "http://14.98.166.66/PartTimeJobs/api/JobsAPI/GetHomeData?pageNumber=" + pagenumber + "&pageSize=" + pagesize NSUUID().UUIDString)!
        
        let url:URL = URL(string: "http://14.98.166.66/PartTimeJobs/api/JobsAPI/GetHomeData?pageNumber=4&pageSize=10")!
        
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
            dataString = (jsonData?.value(forKey:"res")) as! NSArray
            print("dataString:::\(dataString)")
//            jobRole = dataString.value(forKey: "jobrole") as!  NSString
//            jobLocation = dataString.value(forKey: "location") as!  NSString
            //            json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! Dictionary<String, AnyObject>
        }
    }
}
