//
//  SocketService.swift
//  
//
//  Created by Hammoud Hammoud on 12/12/17.
//

import Foundation
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    
    override init() {
        super.init()
    }
    
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!)
    
    func establishConnection() {
        manager.defaultSocket.connect()
    }
    
    func closeConnection() {
        manager.defaultSocket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        manager.defaultSocket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getNewChannel(completion: @escaping CompletionHandler) {
        manager.defaultSocket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String, let channelDesc = dataArray[1] as? String, let channelID = dataArray[2] as? String else {
                return
            }
            let newChannel = Channel(_id: channelID, name: channelName, description: channelDesc, __v: nil)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
}
