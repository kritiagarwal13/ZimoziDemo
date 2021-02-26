

import Foundation
import SwiftyJSON


struct MainViewControllerModel : Codable {
	let api_info : Api_info?
	let items : [Items]?

    init() {
        self.init(withJSON: JSON())
    }

    init(withJSON json : JSON){
        api_info = Api_info(withJSON: json["api_info"])
        items = json["items"].arrayValue.map { Items(withJSON: $0) }
    }
}
