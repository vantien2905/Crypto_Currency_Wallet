//
//  UIView+Animations.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 14/06/2021.
//

import Foundation
import UIKit

public typealias CompletionClosure = (() -> Void)

extension UIView {
    
    func setAnimation(animation: CompletionClosure?,
                      complete: CompletionClosure? = nil) {
        guard let superView = superview else { return }
        superView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: [.curveEaseInOut]) {
            animation?()
            superView.layoutIfNeeded()
        } completion: { _ in
            complete?()
        }
    }
}
