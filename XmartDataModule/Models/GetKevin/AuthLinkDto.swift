//
//  AuthLinkDto.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/4/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import XmartDomainModule

public struct AuthLinkDto : Codable {
    var authorizationLink: String
    var state: String
    
    public func toDomain() -> AuthLink {
        return AuthLink(
            authorizationLink: authorizationLink,
            state: state
        )
    }
    
}
