//
//  AppNetworking.swift
//  ZimoziDemo
//
//  Created by Gurdeep on 16/12/16.
//  Copyright © 2016 Gurdeep. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

//MARK:- Api Code
//=======================
enum ApiCode {
    
    static var success                  : Int { return 200 } // Success
    static var unauthorizedRequest      : Int { return 206 } // Unauthorized request
    static var headerMissing            : Int { return 207 } // Header is missing
    static var phoneNumberAlreadyExist  : Int { return 208 } // Phone number alredy exists
    static var requiredParametersMissing: Int { return 418 } // Required Parameter Missing or Invalid
    static var fileUploadFailed         : Int { return 421 } // File Upload Failed
    static var pleaseTryAgain           : Int { return 500 } // Please try again
    static var tokenExpired             : Int { return 401 } // Token expired refresh token needed to be generated
    static var noData                   : Int { return 404 } // No data found
    static var noNetwork                : Int { return -1009} //kCFErrorDomainCFNetwork

}


typealias JSONDictionary = [String : Any]
typealias JSONDictionaryArray = [JSONDictionary]
typealias SuccessResponse = (_ json : JSON) -> ()
typealias FailureResponse = (Error) -> (Void)
//typealias UserControllerSuccess = (_ user : User) -> ()


extension Notification.Name {
    
    static let NotConnectedToInternet = Notification.Name("NotConnectedToInternet")
}

enum AppNetworking {
    
    static var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func configureAlamofire() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15 // seconds
        configuration.timeoutIntervalForResource = 15
//        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    static func isInternetAvailable()-> Bool{
        return true
    }

    static let username = "admin"
    static let password = "12345"
    
    static func POST(endPoint : WebServices.EndPoint,
                     parameters : JSONDictionary = [:],
                     headers : HTTPHeaders = [:],
                     loader : Bool = true,
                     success : @escaping (JSON) -> Void,
                     failure : @escaping (Error) -> Void) {
        
        
        request(URLString: endPoint.path, httpMethod: .post, parameters: parameters, headers: headers, loader: loader, success: success, failure: failure)
    }
    
    static func GET(endPoint : WebServices.EndPoint,
                    parameters : JSONDictionary = [:],
                    headers : HTTPHeaders = [:],
                    loader : Bool = true,
                    success : @escaping (JSON) -> Void,
                    failure : @escaping (Error) -> Void) {
        
        request(URLString: endPoint.path, httpMethod: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers, loader: loader, success: success, failure: failure)
    }
    
    static func PUT(endPoint : WebServices.EndPoint,
                    parameters : JSONDictionary = [:],
                    headers : HTTPHeaders = [:],
                    loader : Bool = true,
                    success : @escaping (JSON) -> Void,
                    failure : @escaping (Error) -> Void) {
        
        request(URLString: endPoint.path, httpMethod: .put, parameters: parameters, headers: headers, loader: loader, success: success, failure: failure)
    }
    
    static func DELETE(endPoint : WebServices.EndPoint,
                       parameters : JSONDictionary = [:],
                       headers : HTTPHeaders = [:],
                       loader : Bool = true,
                       success : @escaping (JSON) -> Void,
                       failure : @escaping (Error) -> Void) {
        
        request(URLString: endPoint.path, httpMethod: .delete, parameters: parameters, headers: headers, loader: loader, success: success, failure: failure)
    }
    
    private static func request(URLString : String,
                                httpMethod : HTTPMethod,
                                parameters : JSONDictionary = [:],
                                encoding: ParameterEncoding = URLEncoding.httpBody,
                                headers : HTTPHeaders = [:],
                                loader : Bool = true,
                                success : @escaping (JSON) -> Void,
                                failure : @escaping (NSError) -> Void) {
        
        if loader { // Utilities.showActivityLoader()
            
        }
           print(parameters)
        
//        var header_auth = self.getHeaders()
        
        makeRequest(URLString: URLString, httpMethod: httpMethod, parameters: parameters, encoding: encoding, headers: [:], loader: loader, success: { (json) in
            let code = json["api_info"]["status"].stringValue
            if code == "healthy"{
                if loader {
                    //Utilities.hideActivityLoader()
                    
                }
                success(json)
            } //else if code == ApiCode.tokenExpired{
//                CommonFunctions.sessionExpired(message: message)
            //}
            else {
                failure(NSError.init(code: 0, localizedDescription: json["api_info"]["status"].stringValue))
            }
        }, failure: failure)
    }
    
    private static func makeRequest(URLString : String,
                                    httpMethod : HTTPMethod,
                                    parameters : JSONDictionary = [:],
                                    encoding: ParameterEncoding = URLEncoding.queryString,
                                    headers : HTTPHeaders = [:],
                                    loader : Bool = true,
                                    success : @escaping (JSON) -> Void,
                                    failure : @escaping (NSError) -> Void) {
        
        
        Alamofire.request(URLString, method: .get, parameters: parameters, encoding: encoding, headers: [:]).responseJSON { (response) in
            
            if loader {
                //Utilities.hideActivityLoader()
                
            }
            
            print("===================== METHOD =========================")
            print(httpMethod)
            print("===================== ENCODING =======================")
            print(encoding)
            print("===================== URL STRING =====================")
            print(URLString)
            print("===================== HEADERS ========================")
            print(headers)
            print("===================== PARAMETERS =====================")
            print(parameters.description)
            
            switch(response.result) {
            case .success(let value):
                print("===================== RESPONSE =======================")
                print(JSON(value))
                let json = JSON(value)
//                  let sdata = CommonFunctions.decryptData(data: json["data"].stringValue)
                  success(json)
                
            case .failure(let e):
                print("===================== FAILURE =======================")
                if loader {
                    //Utilities.hideActivityLoader()
                    
                }
                let error = NSError(localizedDescription: e.localizedDescription)
                print(error)
                if (e as NSError).code == NSURLErrorNotConnectedToInternet {
                    
                    NotificationCenter.default.post(name: .NotConnectedToInternet, object: nil)
                    
//                    CommonFunctions.showToastWithMessage(LocalizedString.pleaseCheckInternetConnection.localized)
                    failure(error)
                } else {
                    failure(error)
                }
            }
        }
    }
    
}




