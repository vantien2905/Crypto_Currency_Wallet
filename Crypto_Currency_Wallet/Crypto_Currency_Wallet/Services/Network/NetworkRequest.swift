//
//  NetworkRequest.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

/***
 Input: endPoint (all info to request)
 Ouput: data or error
 ***/
import Alamofire
import UIKit
//---
typealias RequestSuccess = (_ data: Data) -> Void
typealias RequestFailure = (_ error: APIError?) -> Void

//---
typealias NetworkSuccess = (_ data: BaseResponse ) -> Void

let noInternet = APIError(code: 2000, message: "No Internet")

//---
struct SuccessHandler<T> {
    typealias object = (_ object: T?) -> Void
    typealias array = (_ array: [T]) -> Void
    typealias anyObject = (_ object: Any?) -> Void
}

// NetworkPotocol
protocol NetworkRequestProtocol {
    func requestData(endPoint: EndPointType,
                     success: @escaping RequestSuccess,
                     failure: @escaping RequestFailure)
}

//---
struct NetworkRequest: NetworkRequestProtocol {
    func requestData(endPoint: EndPointType,
                     success: @escaping RequestSuccess,
                     failure: @escaping RequestFailure) {

        var url: URL!
        if endPoint.path.contains("?") {
            let urlString = AppConstant.BASE_URL + endPoint.path
            url = URL(string: urlString)
        } else {
            url = makeUrl(path: endPoint.path)
        }
        let encoding = getAlamofireEncoding(httpMethod: endPoint.httpMethod)
        
        let request = Alamofire.request(url,
                                        method      : endPoint.httpMethod,
                                        parameters  : endPoint.parameters,
                                        encoding    : encoding,
                                        headers     : endPoint.headers)
        debugPrint(request)
        request.responseData { (dataResponse) in
            switch dataResponse.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                let apiError = APIError(error: error)
                failure(apiError)
            }
        }
    }
}

// MARK: helper NetworkRequest
extension NetworkRequest {
    private func getAlamofireEncoding(httpMethod: HTTPMethod) -> ParameterEncoding {
        switch httpMethod {
        case .get:
            return URLEncoding.default
        case .post:
            return JSONEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    private func makeUrl(path: String) -> URL {
        if let baseUrl = URL(string: AppConstant.BASE_URL) {
            let url = baseUrl.appendingPathComponent(path)
            return url
        } else {
            return URL(string: AppConstant.BASE_URL)!
        }
    }
}
