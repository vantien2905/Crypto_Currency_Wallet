//
//  Utils.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 14/06/2021.
//

import Foundation
import Alamofire
import Network

class Utils {
    static func checkInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

class Reachability {
    static let shared = Reachability()

    let monitorForWifi = NWPathMonitor(requiredInterfaceType: .wifi)
    let monitorForCellular = NWPathMonitor(requiredInterfaceType: .cellular)
    private var wifiStatus: NWPath.Status = .requiresConnection
    private var cellularStatus: NWPath.Status = .requiresConnection
    var isReachable: Bool { wifiStatus == .satisfied || isReachableOnCellular }
    var isReachableOnCellular: Bool { cellularStatus == .satisfied }

    func startMonitoring() {
        monitorForWifi.pathUpdateHandler = { [weak self] path in
            self?.wifiStatus = path.status

            if path.status == .satisfied {
                print("Wifi is connected!")
                // post connected notification
                
            } else {
                print("No wifi connection.")
                // post disconnected notification
            }
        }
        monitorForCellular.pathUpdateHandler = { [weak self] path in
            self?.cellularStatus = path.status

            if path.status == .satisfied {
                print("Cellular connection is connected!")
                // post connected notification
            } else {
                print("No cellular connection.")
                // post disconnected notification
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitorForCellular.start(queue: queue)
        monitorForWifi.start(queue: queue)
    }

    func stopMonitoring() {
        monitorForWifi.cancel()
        monitorForCellular.cancel()
    }
    
    class func isConnectedToNetwork() -> Bool {
        return shared.isReachable
    }
}
