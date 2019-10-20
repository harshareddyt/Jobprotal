//
//  MyTableViewCell.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 03/06/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myimage: UIImageView!
    
    @IBOutlet weak var vieww: UIView!
    @IBOutlet weak var jobrolelabel: UILabel!
    @IBOutlet weak var joblocationlabel: UILabel!
    @IBOutlet weak var postedpersonname: UILabel!
    
    @IBOutlet weak var newlbl: UILabel!
    @IBOutlet weak var locationimg_btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vieww.layer.borderWidth = 5.0
        vieww.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
//        vieww.layer.shadowOpacity = 5
//        vieww.layer.shadowRadius = 3
//        vieww.layer.shadowColor = UIColor.black.cgColor

        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
