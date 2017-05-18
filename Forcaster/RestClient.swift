//
//  RestClient.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 AYCAP All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON

protocol RestClientProtocol {
    func get(urlString: String, callback: @escaping (_ data: JSON?) -> Void)
}

class RestClient: RestClientProtocol {

    func get(urlString: String, callback: @escaping (_ data: JSON?) -> Void) {
        Alamofire.request(urlString).responseSwiftyJSON { response in
            if response.error != nil {
                callback(nil)
            }
            callback(response.value)
        }
    }
}
