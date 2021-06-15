//
//  HomeTopView.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 12/06/2021.
//

import Foundation
import UIKit
import SnapKit

enum PageType {
    case search
    case favorite
}

class HomeTopView: BaseViewXib {
    
    @IBOutlet private weak var searchButton     : UIButton!
    @IBOutlet private weak var favoriteButton   : UIButton!
    @IBOutlet private weak var favoriteLabel    : UILabel!
    @IBOutlet private weak var searchTextfield  : UITextField!
    @IBOutlet private weak var shadowView       : UIView!
    
    var actionCallback: ((_ type: PageType)-> Void)?
    
    private lazy var viewTest = UIView()
    
    var searchDidChangeCallBack: ((_ text: String)-> Void)?
    
    override func setUpViews() {
        viewTest.backgroundColor = AppColor.search
        self.addSubview(viewTest)
        
        viewTest.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.width.equalTo(40)
            $0.centerX.equalTo(self.searchButton.snp.centerX)
            $0.bottom.equalTo(self.shadowView.snp.bottom)
        }
        searchButton.setImage(IMG.search_selected.image, for: .normal)
        searchTextfield.layer.borderColor = AppColor.search.cgColor
        searchTextfield.layer.borderWidth = 1
        searchTextfield.layer.cornerRadius = 5
        
        searchTextfield.addTarget(self,
                                  action: #selector(searchTextFieldDidChange),
                                  for: .editingChanged)
        searchTextfield.tintColor = AppColor.search
        searchTextfield.clearButtonMode = .whileEditing
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        shadowView.addBottomShadow()
    }
    
    @objc private func searchTextFieldDidChange(_ textField: UITextField) {
        searchDidChangeCallBack?(textField.text&.lowercased())
    }
    
    @IBAction private func searchButtonTapped() {
        actionCallback?(.search)
        searchButton.setAnimationTouch()
        self.viewTest.setAnimation {
            self.viewTest.snp.remakeConstraints {
                $0.height.equalTo(4)
                $0.width.equalTo(40)
                $0.bottom.equalTo(self.shadowView.snp.bottom)
                $0.centerX.equalTo(self.searchButton.snp.centerX)
            }
            self.searchTextfield.alpha = 1
            self.favoriteLabel.alpha = 0
            self.viewTest.backgroundColor = AppColor.search
            
        } complete: {
            self.searchTextfield.isHidden = false
            self.favoriteLabel.isHidden = true
            self.searchButton.setImage(IMG.search_selected.image, for: .normal)
            self.favoriteButton.setImage(IMG.favorite.image, for: .normal)
        }
    }
    
    @IBAction private func favoriteButtonTapped() {
        actionCallback?(.favorite)
        favoriteButton.setAnimationTouch()
        self.viewTest.setAnimation {
            self.viewTest.snp.remakeConstraints {
                $0.height.equalTo(4)
                $0.width.equalTo(40)
                $0.bottom.equalTo(self.shadowView.snp.bottom)
                $0.centerX.equalTo(self.favoriteButton.snp.centerX)
            }
            self.searchTextfield.alpha = 0
            self.favoriteLabel.alpha = 1
            self.viewTest.backgroundColor = AppColor.favorite
        } complete: {
            self.searchTextfield.isHidden = true
            self.favoriteLabel.isHidden = false
            self.searchButton.setImage(IMG.search.image, for: .normal)
            self.favoriteButton.setImage(IMG.favorite_selected.image, for: .normal)
        }
    }
}
