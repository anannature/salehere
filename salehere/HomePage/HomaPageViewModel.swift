//
//  HomaPageViewModel.swift
//  salehere
//
//  Created by Anan Kaewsaart on 22/9/2566 BE.
//

import SocketIO
import Foundation

protocol HomaPageViewModelProtocol: AnyObject {

    var input: HomaPageViewModelInput { get }
    var output: HomaPageViewModelOutput { get }
}

protocol HomaPageViewModelInput: AnyObject {
    
    var didGetSocket: ((String) -> Void)? { get set }
    
    func getSocket()
}

protocol HomaPageViewModelOutput: AnyObject {}

class HomaPageViewModel: HomaPageViewModelProtocol {
    
    var input: HomaPageViewModelInput { self }
    var output: HomaPageViewModelOutput { self }
    var didGetSocket: ((String) -> Void)?
    
    func getSocket() {
        let socket = SocketManager(socketURL: URL(string: "wss://px-socket-api.herokuapp.com/")!).defaultSocket
        socket.connect()

        socket.on("new-notification") { data, ack in
            if let jsonData = data.first as? [String: Any],
               let notificationCount = jsonData["notificationCount"] as? Int {
                self.didGetSocket?(String(notificationCount))
            }
        }
    }

}

extension HomaPageViewModel: HomaPageViewModelInput {}
extension HomaPageViewModel: HomaPageViewModelOutput {}
