//
//  LoginController.swift
//  aware-client-ios-v2
//
//  Created by Sam on 2021/4/21.
//  Copyright © 2021 Yuuki Nishiyama. All rights reserved.
//

import UIKit
import SwiftyJSON
import Moya



class LogoutController: UIViewController, UITextFieldDelegate {

  
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
      
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true


    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        

  

    }
   
    @IBAction func LogOut(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
    UserDefaults.standard.synchronize()
    }
    
    
        
        
        
    }
    

    
        

                
    
 
    
 

