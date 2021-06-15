//
//  IMG.swift
//
//  Auto Created by images.rb
//
//

import UIKit

enum IMG: String {
    
	case favorite
	case favorite_selected
    case search
    case buy
    case sell
    case search_selected
    case empty_data
    case ic_wifi_interupt
    case lost_connection_logo
}

extension IMG {
    var image: UIImage? {
        return UIImage(named: self.rawValue, in: Bundle(identifier: "ch.resource.vn.Crypto-Currency-Wallet.test"), compatibleWith: nil)
    }
}
