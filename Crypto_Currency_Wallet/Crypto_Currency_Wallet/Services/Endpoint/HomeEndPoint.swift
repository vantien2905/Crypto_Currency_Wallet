//
//  PatronEndPoint.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/9/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Alamofire

enum HomeEndPoint {
    case getListCoint
    
}

extension HomeEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getListCoint:
            return "/price/all_prices_for_mobile?counter_currency=USD"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var parameters: JSONDictionary {
        switch self {
        case .getListCoint:
            return [:]
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
