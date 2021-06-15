//
//  CoinTableViewCell.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 11/06/2021.
//

import UIKit
import SDWebImage
import SkeletonView

protocol CoinTableViewCellDelegate: AnyObject {
    func favoriteActionTapped(indexPath: IndexPath)
}

class CoinTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView    : UIImageView!
    @IBOutlet weak var nameLabel        : UILabel!
    @IBOutlet weak var codeLabel        : UILabel!
    @IBOutlet weak var buyPriceLabel    : UILabel!
    @IBOutlet weak var sellPriceLabel   : UILabel!
    @IBOutlet weak var favoriteButton   : UIButton!
    @IBOutlet weak var sellPriceImage   : UIImageView!
    
    var coin: CoinEntity!
    
    var indexPath: IndexPath!
    
    weak var delegate: CoinTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func setData(coin: CoinEntity?, indexPath: IndexPath?) {
        guard let coin = coin, let indexPath = indexPath else { return }
        self.coin = coin
        self.indexPath = indexPath
        logoImageView.sd_setImage(with: URL(string: coin.icon&), placeholderImage: nil)
        nameLabel.text = coin.name
        codeLabel.text = coin.base
        buyPriceLabel.text = "$\(coin.buy_price&)"
        sellPriceLabel.text = "\(coin.sell_price&)"
        favoriteButton.setImage(coin.isFavorite
                                    ? IMG.favorite_selected.image
                                    : IMG.favorite.image,
                                for: .normal)
        
    }
    
    @IBAction func favoriteButtonTapped() {
        RealmHelper.share.updateObject {
            coin.isFavorite = !coin.isFavorite
        }
        favoriteButton.setImage(coin.isFavorite
                                    ? IMG.favorite_selected.image
                                    : IMG.favorite.image,
                                for: .normal)
        
        delegate?.favoriteActionTapped(indexPath: self.indexPath)
        
    }
    
    func configureSkeletons(_ isShow: Bool) {
        
        let list: [UIView] = [
            logoImageView,
            nameLabel,
            codeLabel,
            buyPriceLabel,
            sellPriceLabel,
            favoriteButton,
            sellPriceImage
        ]
        isShow ? showSkeletons(list) : hideSkeletons(list)
    }
    
    private func showSkeletons(_ listView: [UIView]) {
        for item in listView {
            item.isSkeletonable = true
            item.showAnimatedGradientSkeleton()
        }
    }
    
    private func hideSkeletons(_ listView: [UIView]) {
        for item in listView {
            item.isSkeletonable = true
            item.hideSkeleton()
        }
    }
}
