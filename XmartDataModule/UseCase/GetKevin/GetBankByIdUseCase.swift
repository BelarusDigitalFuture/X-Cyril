//
//  GetBankByIdUseCase.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/4/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import RxSwift
import XmartDomainModule

public final class GetBankByIduseCase {
    
    private let apiClient: GetKevinApiClient<Bank>;
    
    init() {
        apiClient = GetKevinApiClient<Bank>()
    }
    
    func getBankById(bankId: String) -> Observable<ApiResult<Bank,Error>> {
        return apiClient.getItem(path: "auth/banks/\(bankId)")
    }
    
}
