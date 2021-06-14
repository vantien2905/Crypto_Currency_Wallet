//
//  HomeInteractor.swift
//  Crypto_Currency_Wallet
//
//  Created Tien Dinh on 11/06/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class HomeInteractor: HomeInteractorInputProtocol {
    func getListCoin() {
        let data = RealmHelper.share.getObjects(CoinEntity.self).toArray(ofType: CoinEntity.self)
        Provider.shared.homeAPIService.getListCoin { result in
            for (index, item) in result.enumerated() {
                for local in data {
                    if item.base == local.base {
                        result[index].isFavorite = local.isFavorite
                    }
                }
            }
            RealmHelper.share.addObjects(result)
            self.presenter?.didGetListCoin(result: result, error: nil)
        } failure: { error in
            self.presenter?.didGetListCoin(result: nil, error: error)
        }
    }
    

    weak var presenter: HomeInteractorOutputProtocol?
}