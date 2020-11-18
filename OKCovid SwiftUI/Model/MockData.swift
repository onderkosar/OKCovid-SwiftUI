//
//  MockData.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 18.11.2020.
//

import Foundation

struct MockData {
    static let countryInfo      = CountryInfo(_id: 840,
                                              flag: "https://disease.sh/assets/img/flags/us.png",
                                              iso2: "US",
                                              iso3: "USA",
                                              lat: 38,
                                              long: -97)
    
    static let countryModel     = CountryModel(country: "USA",
                                               countryInfo: countryInfo,
                                               population: 331743344,
                                               updated: 1605727532041,
                                               tests: 172178586,
                                               cases: 11758671,
                                               active: 4389449,
                                               deaths: 255112,
                                               recovered: 7114110)
    
    static let worldModel       = WorldModel(population: 7787962770,
                                             updated: 1605727532039,
                                             cases: 56342420,
                                             active: 15778135,
                                             deaths: 1350973,
                                             recovered: 39213312)
}
