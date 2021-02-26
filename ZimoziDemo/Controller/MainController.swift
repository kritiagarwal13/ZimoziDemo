//
//  MainController.swift
//  ZimoziDemo
//
//  Created by Kriti Agarwal on 27/02/21.
//

import UIKit


protocol MainControllerDelegate: AnyObject {
    
    func getMapValuesSuccess(data: [Items])
    func getMapValuesFailed(message:String)
    
    
}

extension MainControllerDelegate {
    func getMapValuesSuccess(data: [Items]){}
    func getMapValuesFailed(message:String){}
}


class MainController {
    
    weak var delegate: MainControllerDelegate?
    
    func getMapValues(_ parameters: JSONDictionary) {
        
        WebServices.getMapValues(parameters: parameters, success: { (json) in
            let jsonData = json["items"].arrayValue.map { Items(withJSON: $0) }
            self.delegate?.getMapValuesSuccess(data: jsonData)
        }) { (error) -> (Void) in
            self.delegate?.getMapValuesFailed(message: error.localizedDescription)
        }
    }
    
}
