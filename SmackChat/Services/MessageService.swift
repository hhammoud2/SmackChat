//
//  MessageService.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/11/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func getChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(GET_CHANNELS_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {
                    return
                }
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                        }
                    }
                } catch {
                    print(error)
                }
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
