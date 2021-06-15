//
//  ComponentBuilder.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 14/06/2021.
//

import Foundation


public protocol ComponentBuilder {}

public extension ComponentBuilder where Self: Any {
    /// Calls the parameter block in order to update the receiver properties and then returns the object.
    func build(_ block: (Self) -> Void) -> Self {
        block(self)

        return self
    }
}

extension NSObject: ComponentBuilder {}
