//
//  ApiResult.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/3/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import RxSwift

public enum ApiResult<Value, Error>{
    case success(Value)
    case failure(Error)
    
    init(value: Value){
        self = .success(value)
    }
    
    init(error: Error){
        self = .failure(error)
    }
}

struct ApiErrorMessage: Codable{
    var error_message: String
}

enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}


