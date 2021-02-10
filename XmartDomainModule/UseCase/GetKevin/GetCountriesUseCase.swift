//
//  GetCountriesUseCase.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/4/21.
//  Copyright © 2021 DelevantGames. All rights reserved.
//

import Foundation
import RxSwift

protocol GetCountriesUseCase {
    func getchCountries() -> Observable<ApiResult<CountryDto, Error>>
}
