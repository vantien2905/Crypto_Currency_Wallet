//
//  Reachability.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 15/06/2021.
//

import Reachability

public protocol ReachabilityServiceEvents: AnyObject {
    func reachabilityService(_ service: ReachabilityService, status: ReachabilityService.Status)
}

open class ReachabilityService: Multicastable {
    public enum Status {
        case notReachable
        case reachableViaWiFi
        case reachableViaWWAN
    }
    private let reachability: Reachability
    public var multicast = Multicast<ReachabilityServiceEvents>()
    
    public init() {
        self.reachability = try! Reachability()
        self.setupReachability()
    }
    
    func hasConnectivity() -> Bool {
            do {
                let reachability: Reachability = try Reachability()
                let networkStatus = reachability.connection
                
                switch networkStatus {
                case .unavailable:
                    return false
                case .wifi, .cellular:
                    return true
                case .none:
                    return false
                }
            }
            catch {
                return false
            }
        }
    
    func setupReachability() {
        reachability.whenReachable = { [weak self] reachability in
            guard let self = self else {
                return
            }
            if reachability.connection == .wifi {
                self.multicast.invoke {
                    $0.reachabilityService(self, status: .reachableViaWiFi)
                }
            } else {
                self.multicast.invoke {
                    $0.reachabilityService(self, status: .reachableViaWWAN)
                }
            }
        }
        
        reachability.whenUnreachable = { [weak self] reachability in
            guard let self = self else {
                return
            }
            self.multicast.invoke {
                $0.reachabilityService(self, status: .notReachable)
            }
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Cannot setupReachability")
        }
    }
}
