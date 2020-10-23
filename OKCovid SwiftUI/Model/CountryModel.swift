//
//  CountryModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import Foundation

struct CountryModel: Codable, Hashable {
    let country : String
//    let countryInfo : CountryInfoModel!
    
    let population : Int
    let updated : Int
    let tests : Int
    let cases : Int
    let active : Int
    let deaths : Int
    let recovered : Int
}

struct CountryInfoModel: Codable, Hashable {
    let id : Int
    let flag : String
    let iso2 : String
    let iso3 : String
    let lat : Int
    let longField : Int
}
