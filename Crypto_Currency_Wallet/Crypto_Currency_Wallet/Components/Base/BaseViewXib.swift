//
//  BaseViewXib.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 12/06/2021.
//

import UIKit

class BaseViewXib: UIView {
    var view : UIView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    func loadViewFromNib() {
        let nibName     = String(describing: type(of: self))
        let nib         = UINib(nibName: nibName, bundle: Bundle.main)
        if let view     = nib.instantiate(withOwner: self, options: nil)[0] as? UIView {
            view.frame      = bounds
            addSubview(view)
            view.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        setUpViews()
    }

    func setUpViews() {

    }
}
