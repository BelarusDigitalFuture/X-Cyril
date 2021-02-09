//
//  ApiClient.swift
//  XmartDataModule
//
//  Created by Andrei Lashkevich on 2/6/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import Alamofire

public class ApiClient<T : Codable> {
    
    private var headers: HTTPHeaders
    private let endPoint: String
    private let session = URLSession.shared
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(_ endPoint: String, _ headers : HTTPHeaders) {
        self.headers  = headers
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItem(path: String, parameters: [String: Any]? = nil) -> Observable<ApiResult<T, Error>> {
        let absolutePath = "\(endPoint)\(path)"
        return request(.get, absolutePath, parameters: parameters, headers: headers)
            .responseData()
            .observe(on: scheduler)
            .expectingObject(ofType: T.self)
    }
    
}

extension Observable where Element == (HTTPURLResponse, Data){
    fileprivate func expectingObject<T : Codable>(ofType type: T.Type) -> Observable<ApiResult<T, Error>>{
        return self.map{ (httpURLResponse, data) -> ApiResult<T, Error> in
            switch httpURLResponse.statusCode{
            case 200 ... 299:
                let object = try JSONDecoder().decode(type, from: data)
                return .success(object)
            case 403:
                return .failure(ApiError.forbidden)
            default:
                return .failure(ApiError.internalServerError)
            }
        }
    }
}

