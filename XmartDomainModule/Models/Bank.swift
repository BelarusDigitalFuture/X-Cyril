//
//  Bank.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/4/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation

public struct Bank : Codable {
    public internal(set) var name : String
    public internal(set) var officialName : String?
    public internal(set) var imageUri : String
    public internal(set) var id: String
}
