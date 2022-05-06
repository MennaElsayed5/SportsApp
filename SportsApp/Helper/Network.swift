//
//  Network.swift
//  SportsApp
//
//  Created by Menna on 06/05/2022.
//

import Foundation
import Network
final class Network{
    
    static let shared = Network()
    private let queue = DispatchQueue.global()
    private let monitor:NWPathMonitor
    public private(set) var isConnected:Bool = true
    public private(set) var connectionType:ConnectionType = .unKnown
   
    enum ConnectionType {
        case wifi
        case unKnown
    }
    
    private init(){
        monitor = NWPathMonitor()
    }
    public func satrtMonitoring(){
        
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = {
            [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            
            self?.getConnectionType(path: path)
        }
    }
    public func stopMonitoring(){
        monitor.cancel()
    }
    public func getConnectionType(path :NWPath){
           
        if path.usesInterfaceType(.wifi){
            connectionType = .wifi
        }
        else{
            connectionType = .unKnown
        }
  }
}

