//
//  CountryModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import Foundation

struct CountryModel: Codable, Hashable {
    let country : String
    let countryInfo : CountryInfo
    let population : Int
    let updated : Int
    let tests : Int
    let cases : Int
    let active : Int
    let deaths : Int
    let recovered : Int
}

struct CountryInfo: Codable, Hashable {
    let _id : Double
    let flag : String
    let iso2 : String
    let iso3 : String
    let lat : Double
    let long: Double
}
