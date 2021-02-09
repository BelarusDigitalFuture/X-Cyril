//
//  GetCountryBanksUseCase.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/4/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import RxSwift

public final class GetCountryBanksUseCase {
    
    private let apiClient: GetKevinApiClient<BanksDto>;
    
    public init() {
        apiClient = GetKevinApiClient<BanksDto>()
    }
    
    public func fetchBanks(countryCode: String) -> Observable<ApiResult<BanksDto,Error>> {
        return apiClient.getItem(path: "auth/banks", parameters: ["countryCode" : countryCode])
    }
    
}
