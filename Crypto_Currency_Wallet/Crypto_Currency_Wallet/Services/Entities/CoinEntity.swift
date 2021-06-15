//
//  CoinEntity.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 11/06/2021.
//

import Foundation
import ObjectMapper
import RealmSwift

class CoinEntity: Object, Mappable {
    
    @objc dynamic var base          : String?
    @objc dynamic var counter       : String?
    @objc dynamic var buy_price     : String?
    @objc dynamic var sell_price    : String?
    @objc dynamic var icon          : String?
    @objc dynamic var name          : String?
    
    @objc dynamic var isFavorite = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "base"
    }
    
    func mapping(map: Map) {
        self.base           <- map["base"]
        self.counter        <- map["counter"]
        self.buy_price      <- map["buy_price"]
        self.sell_price     <- map["sell_price"]
        self.icon           <- map["icon"]
        self.name           <- map["name"]
    }
}
