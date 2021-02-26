//
//  Webservices.swift
//  ZimoziDemo
//
//  Created by Gurdeep on 16/12/16.
//  Copyright © 2016 Gurdeep. All rights reserved.
//

import Foundation
import SwiftyJSON

enum WebServices { }

extension NSError {
    
    convenience init(localizedDescription : String) {
        
        self.init(domain: "AppNetworkingError", code: 0, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
    
    convenience init(code : Int, localizedDescription : String) {
        
        self.init(domain: "AppNetworkingError", code: code, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
}

extension WebServices {
    
    static func getMapValues(parameters : JSONDictionary, success : @escaping (JSON) -> Void, failure : @escaping (Error) -> Void) {
        AppNetworking.GET(endPoint: .mapValues, parameters: parameters, loader: true, success: { (json : JSON) -> Void in
            if json["api_info"]["status"].stringValue == "healthy" {
                success(json)
            }else{
                let code = json["status_code"].intValue
                let message = json["message"].stringValue
                let error = NSError(code: code, localizedDescription: message)
                failure(error)
            }
        }, failure: { (e : Error) -> Void in
            failure(e)
        })
    }
    
}

//MARK:- Error Codes
//==================
struct error_codes {
    static let success = 200
    
}

