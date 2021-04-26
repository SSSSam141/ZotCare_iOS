//
//  LoginDesign.swift
//  aware-client-ios-v2
//
//  Created by Sam on 2021/4/21.
//  Copyright © 2021 Yuuki Nishiyama. All rights reserved.
//

import UIKit

@IBDesignable

class LoginDesign: UIView {
    
    @IBInspectable var shadowColor:UIColor = UIColor.clear{
        didSet{
            layer.shadowColor=shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat=0{
        didSet{
            layer.shadowRadius=shadowRadius
        }
    }
    @IBInspectable var shadowOpacity:CGFloat=0{
        didSet{
            layer.shadowOpacity=Float(shadowOpacity)
        }
    }
    @IBInspectable var shadowOffsetY: CGFloat=0{
        didSet{
            layer.shadowOffset.height=shadowOffsetY
        }
    }
    
    
    
}
