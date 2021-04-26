//
//  YSharApI.swift
//  aware-client-ios-v2
//
//  Created by Sam on 2021/4/14.
//  Copyright © 2021 Yuuki Nishiyama. All rights reserved.
//

import Foundation
import Moya

let AwareDataProvider = MoyaProvider<AwareData>()

public enum AwareData{
    case name(name:String)
    case data
    case loginUser(usrname:String,password:String)
    case regUser(usrname:String,password:String)
}

extension AwareData:TargetType{
   public var path: String {
        return ""
    }
    

    public var baseURL: URL{
        switch self {
        case .loginUser(_,_): return URL(string: "http://192.168.3.11:5000/auth/login")!
            
        case .regUser(_,_): return URL(string: "http://192.168.3.11:5000/auth/register")!
            
        default:
            return URL(string: "http://192.168.3.11:5000/datalogging/aware/upload")!
        }
    }
    public var method: Moya.Method{
        return .post
    }
    public var task: Task{
        switch self {
        case let .loginUser(usrname, pw):
            return .requestParameters(parameters: ["email":usrname,"password":pw],encoding: JSONEncoding.default)
        case let .regUser(usrname, pw):
            return .requestParameters(parameters: ["email":usrname,"password":pw],encoding: JSONEncoding.default)
        
        default:
            return .requestPlain
        }
        
        
    }
    public var validate: Bool{
        return false
    }
    
    public var sampleData: Data{
        return"{}".data(using: String.Encoding.utf8)!
        
    }
    public var headers: [String : String]?{
        switch self{
        default:
            return["Content-type": "application/json"]
        }
    }
    
    
    
}
