//
//  GetKevinApiClient.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/2/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import Alamofire

public class GetKevinApiClient<T : Codable> : ApiClient<T> {
    
    private let endPoint = BASE_URL
    
    private var getKevinHeaders: HTTPHeaders = [
        "Client-Id": CLIENT_ID,
        "Client-Secret": CLIENT_SECRET,
        "Content-Type": "application/json"
    ]
    
    public init(customHeaders : HTTPHeaders? = nil) {
        for header in customHeaders! {
            getKevinHeaders.add(header)
        }
        super.init(endPoint, getKevinHeaders)
    }
    
    public init() {
        super.init(endPoint, getKevinHeaders)
    }
    
    
}


