//
//  GetKevinRepository.swift
//  Xmart
//
//  Created by Andrei Lashkevich on 2/2/21.
//  Copyright © 2021 DelevantGames. All rights reserved.
//

import Foundation

import RxSwift

protocol GetKevinRepository {
    func fetchCountries() -> Observable<CountryDto>
}
