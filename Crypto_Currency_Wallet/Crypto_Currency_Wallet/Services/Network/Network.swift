//
//  Network.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON
import Alamofire

/***
 Input: endPoint (all info to request)
 Ouput: BaseResponse or error
 ***/

protocol APINetworkProtocol {
    func requestData(endPoint: EndPointType, success: @escaping NetworkSuccess, failure: @escaping RequestFailure)
}

struct APINetwork: APINetworkProtocol {
    let request: NetworkRequestProtocol

    init(request: NetworkRequestProtocol) {
        self.request = request
    }

    func requestData(endPoint: EndPointType, success: @escaping NetworkSuccess, failure: @escaping RequestFailure) {
        request.requestData(endPoint: endPoint, success: { data in
            let json = JSON(data)
            guard let result = Mapper<BaseResponse>().map(JSONObject: json.dictionaryObject) else {
                
                failure(APPError.canNotParseData)
                return
            }

            self.handleResponse(response: result, success: success, failure: failure)
        }) { error in
            failure(APIError(error: error))
        }
    }
}

// handle base response
extension APINetwork {
    private func handleResponse(response: BaseResponse, success: @escaping NetworkSuccess, failure: @escaping RequestFailure) {
        if response.data != nil || response.message == nil {
            success(response)
        } else {
            // handle error with message from API
            let error = APIError(baseResponse: response)
            failure(error)
        }
    }
}
