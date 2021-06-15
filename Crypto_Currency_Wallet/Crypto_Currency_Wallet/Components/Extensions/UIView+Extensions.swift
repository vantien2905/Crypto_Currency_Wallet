//
//  UIView+Extrnsion.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 11/06/2021.
//

import Foundation
import UIKit

extension UIView {
    
    public func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
    
    public class var nibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
    
    static var className: String {
        return String(describing: self)
    }
    
    static var identifier: String {
        return self.className
    }
}

extension UIView {
    
    /// SwifterSwift: Remove all subviews in view.
    public func removeSubviews() {
        subviews.forEach({$0.removeFromSuperview()})
    }
    /// SwifterSwift: Get view's parent view controller
    public var parentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    public func setAnimationTouch(_ scale: CGFloat = 1.15) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut,
                       animations: {
                        self.transform = CGAffineTransform.init(scaleX: scale, y: scale)
                        //reducing the size
                        UIView.animate(withDuration: 0.5,
                                       delay: 0.2,
                                       usingSpringWithDamping: 0.5,
                                       initialSpringVelocity: 2,
                                       options: .curveEaseInOut,
                                       animations: {
                                        self.transform = CGAffineTransform.identity
                                        
                                       })
                       })
    }
    
    func addBottomShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.6
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 2)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                     y: bounds.maxY - layer.shadowRadius,
                                                     width: bounds.width,
                                                     height: layer.shadowRadius)).cgPath
    }
}

extension UIView {
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
}
