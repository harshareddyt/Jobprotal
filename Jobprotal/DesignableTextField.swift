//
//  DesignableTextField.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 30/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

//import UIKit
//
//@IBDesignable
//class DesignableTextField: UITextField {
//
//    @IBInspectable var leftImage : UIImage? {
//        didSet{
//            updateView()
//        }
//    }
//
//    @IBInspectable var leftPadding : CGFloat = 0 {
//        didSet{
//            updateView()
//        }
//    }
//
//    func updateView(){
//        if let image = leftImage {
//            leftViewMode = .always
//
//            let imageView = UIImageView(frame:CGRect(x: leftPadding, y: 0, width: 30, height: 30))
//            imageView.image = image
//
//            let width = leftPadding + 20
//
//            let view = UIView(frame: CGRect(x: 0, y: 0, width: 20 , height: 25))
//            view.addSubview(imageView)
//            leftView = view
//        }else {
//            leftViewMode = .never
//        }
//    }
//
//
//}
