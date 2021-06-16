//
//  UIApplication+Extensions.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 16/06/2021.
//

import Foundation
import UIKit

extension UIApplication {

    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }

        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }

        return controller
    }
}
