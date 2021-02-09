//
//   Resource.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/4/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation

public enum Resource<Value, Error> {
    case success(Value)
    case failure(Error)
    case loading
    
    public init(value: Value){
        self = .success(value)
    }
    
    init(error: Error){
        self = .failure(error)
    }
}
