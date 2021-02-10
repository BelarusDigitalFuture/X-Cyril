//
//  AuthLink.swift
//  XmartDomainModule
//
//  Created by Andrei Lashkevich on 2/8/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation

public struct AuthLink {
    public internal(set) var authorizationLink: String
    var state: String
    
    public init(authorizationLink: String, state: String) {
        self.authorizationLink = authorizationLink
        self.state = state
    }
    
}
