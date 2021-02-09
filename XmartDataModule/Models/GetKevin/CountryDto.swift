//
//  CountryDto.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/2/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import XmartDomainModule

public struct CountryDto: Codable {
    
   var data: [String]
    
    public func toDomain() -> Countries {
        return Countries(
            countriesList: data
        )
    }
    
}
