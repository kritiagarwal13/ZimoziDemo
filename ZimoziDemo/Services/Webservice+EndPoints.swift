//
//  Webservice+EndPoints.swift
//  ZimoziDemo
//
//  Created by Gurdeep on 06/03/17.
//  Copyright © 2017 Gurdeep. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.data.gov.sg/v1/transport/traffic-images"   //Live url

extension WebServices {

    enum EndPoint : String {
        
        case mapValues = ""
        
        var path : String {
            
            let url = BASE_URL
            return url + self.rawValue
        }
    }
}
