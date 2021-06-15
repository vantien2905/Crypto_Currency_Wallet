//
//  Utils.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 14/06/2021.
//

import Foundation
import Alamofire

class ReachabilityHelper {
    
    static let shared = ReachabilityHelper()
    
    var reachability: ReachabilityService
    
    
    static func checkInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    static func openSetting() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // TODO: show messages
        }
    }
    
    private init() {
        reachability = ReachabilityService()
    }
}
