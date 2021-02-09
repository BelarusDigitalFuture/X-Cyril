//
//  ApiError.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/2/21.
//  Copyright © 2021 DelevantGames. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}
