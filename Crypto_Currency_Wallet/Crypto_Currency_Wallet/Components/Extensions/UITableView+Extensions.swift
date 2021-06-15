//
//  UITableView+Extensions.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 11/06/2021.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(header: UITableViewHeaderFooterView.Type, isNib: Bool = true) {
        if !isNib {
            self.register(header.self, forHeaderFooterViewReuseIdentifier: String(describing: header.self))
        } else {
            self.register(header.nib, forHeaderFooterViewReuseIdentifier: header.identifier)
        }
    }
    
    func dequeue<T: UITableViewHeaderFooterView>(header: T.Type, isNib: Bool = true) -> T {
        if isNib {
            return dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.identifier)) as! T
        } else {
            return dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as! T
        }
        
    }
    
    func registerTableCell<T: UITableViewCell>(_: T.Type, fromNib: Bool = true) {
        if fromNib {
            self.register( T.nib, forCellReuseIdentifier: T.identifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.identifier)
        }
    }
    
    func dequeueTableCell<T: UITableViewCell>(_: T.Type) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: T.identifier)
        
        return cell as! T
    }
    
    func dequeueTableCell<T: UITableViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath)
        
        return cell as! T
    }
}

extension UITableView {

    func setEmptyView(title: String = "Empty data",
                      message: String = "",
                      messageImage: UIImage = IMG.empty_data.image ?? UIImage()) {

        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))

        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()

        messageImageView.backgroundColor = .clear

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.textColor = UIColor.lightGray
        titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .bold)

        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont.systemFont(ofSize: 17)

        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)

        NSLayoutConstraint.activate([
            messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -30),
            messageImageView.widthAnchor.constraint(equalToConstant: 60),
            messageImageView.heightAnchor.constraint(equalToConstant: 60),

            titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),

            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: emptyView.leadingAnchor, constant: 40)

        ])



        messageImageView.image = messageImage
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center


        UIView.animate(withDuration: 1, animations: {
            messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
        }, completion: { (finish) in
            UIView.animate(withDuration: 1, animations: {
                messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
            }, completion: { (finishh) in
                UIView.animate(withDuration: 1, animations: {
                    messageImageView.transform = CGAffineTransform.identity
                })
            })
        })

        self.backgroundView = emptyView
    }

    func restore() {
        self.backgroundView = nil
    }

}
