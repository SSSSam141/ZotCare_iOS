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



class LoginController: UIViewController, UITextFieldDelegate {

  
    
    @IBOutlet weak var usrName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var login_btn: UIButton!
    
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
   
    
    @IBAction func RegAction(_ sender: Any) {
        AwareDataProvider.request(.regUser(usrname: usrName.text!, password: password.text!)){ result in
            if case .success(let response) = result {
               // 解析数据
                let jsonDic = try! response.mapJSON()
                print(jsonDic)
                if response.statusCode==409 {
                    let  alertController =  UIAlertController (title:  "Warning" ,
                                            message:  "This account has been registered before!" , preferredStyle: .alert)
                            //let  cancelAction =  UIAlertAction (title:  "取消" , style: .cancel, handler:  nil )
                            let  okAction =  UIAlertAction (title:  "OK" , style: . default , handler: {
                                action  in
                            })
                            //alertController.addAction(cancelAction)
                            alertController.addAction(okAction)
                            self .present(alertController, animated:  true , completion:  nil )
                    
                }else{
                    let  alertController =  UIAlertController (title:  "Congradulations!" ,
                                            message:  "You have successfully registered the current account!" , preferredStyle: .alert)
                          //  let  cancelAction =  UIAlertAction (title:  "取消" , style: .cancel, handler:  nil )
                            let  okAction =  UIAlertAction (title:  "OK" , style: . default , handler: {
                                action  in
                                print ( "点击了确定" )
                            })
                           // alertController.addAction(cancelAction)
                            alertController.addAction(okAction)
                            self .present(alertController, animated:  true , completion:  nil )
                    
                }
            
        }
        
        }
        
        
        
    }
    

    @IBAction func loginAction(_ sender: Any) {
    
        AwareDataProvider.request(.loginUser(usrname: usrName.text!, password: password.text!)) { result in
                 if case .success(let response) = result {
                    // 解析数据
                     let jsonDic = try! response.mapJSON()
                     print(jsonDic)
                  
                    if response.statusCode == 404{
                        let  alertController =  UIAlertController (title:  "Warning" ,
                                                message:  "This account does not exist, please register it berfore login!" , preferredStyle: .alert)
                                let  okAction =  UIAlertAction (title:  "OK" , style: . default , handler: {
                                    action  in
                                    print ( "点击了确定" )
                                })
                                alertController.addAction(okAction)
                                self .present(alertController, animated:  true , completion:  nil )
                        
                    }else if response.statusCode == 400{
                        let  alertController =  UIAlertController (title:  "Wrong Password" ,
                                                message:  "Please try it again" , preferredStyle: .alert)
                                let  okAction =  UIAlertAction (title:  "OK" , style: . default , handler: {
                                    action  in
                                    print ( "点击了确定" )
                                })
                                alertController.addAction(okAction)
                                self .present(alertController, animated:  true , completion:  nil )
                        
                    }else{
                       
                        self.performSegue(withIdentifier: "login_success", sender: self)
                    }
                 
             }
        
        
        }
    

                
    }
 
    
 
}

