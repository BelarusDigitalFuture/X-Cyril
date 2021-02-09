//
//  GetCountriesUseCase.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/3/21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import Foundation
import RxSwift

public final class GetCountriesUseCase {
    
    private let apiClient: GetKevinApiClient<CountryDto>;
    
    public init() {
        self.apiClient = GetKevinApiClient<CountryDto>()
    }
    
    public func fetchCountries() -> Observable<ApiResult<CountryDto, Error>> {
        return apiClient.getItem(path: "auth/countries")
    }

    
}
