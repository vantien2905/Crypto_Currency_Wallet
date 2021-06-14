//
//  PatronAPIService.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/9/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation

protocol HomeAPIServiceProtocol {
    func getListCoin(
               success: @escaping SuccessHandler<CoinEntity>.array,
               failure: @escaping RequestFailure)
}

class HomeAPIService: HomeAPIServiceProtocol {

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }
    
    func getListCoin(
               success: @escaping SuccessHandler<CoinEntity>.array,
        failure: @escaping RequestFailure) {
        let endPoint = HomeEndPoint.getListCoint
        network.requestData(endPoint: endPoint,
                            success: MapperData.mapArray(success),
                            failure: failure)
    }
}


