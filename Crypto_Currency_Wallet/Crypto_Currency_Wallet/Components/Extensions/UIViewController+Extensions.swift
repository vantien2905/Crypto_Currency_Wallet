//
//  UIViewController+Extensions.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 11/06/2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func initFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>(_ : T.Type) -> T {
            return T(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib(self)
    }
    
    func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
    
    func present(_ controller: UIViewController, animated: Bool = true, modal: UIModalPresentationStyle = .fullScreen) {
        controller.modalPresentationStyle = modal
        self.present(controller, animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool = true) {
        self.dismiss(animated: animated, completion: nil)
    }
}
