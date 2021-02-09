//
//  ValidationStatus.swift
//  XmartDataModule
//
//  Created by Andrei Lashkevich on 2/8/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation

public class ValidationResult {
    
    private var isSuccess: Bool
    private var errorMessage: String?

    init(_ errorMessage: String) {
        isSuccess =  false
        self.errorMessage = errorMessage
    }
    
    init() {
        self.isSuccess = true
    }
    
    func getIsSuccess() -> Bool {
        return isSuccess
    }
    
}
