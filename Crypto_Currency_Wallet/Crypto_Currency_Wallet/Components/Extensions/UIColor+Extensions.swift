//
//  UIColor+Extensions.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 14/06/2021.
//

import Foundation
import UIKit

extension UIColor {

    convenience init(hexString: String) {
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)

        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}

extension Int {
    func toIntPositive()-> Int {
        if self >= 0 {
            return self
        }
        return 0 - self
    }
}
