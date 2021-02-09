//
//  BanksDTO.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/4/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import XmartDomainModule

public struct BanksDto : Codable {
    public var data : [Bank]
}
