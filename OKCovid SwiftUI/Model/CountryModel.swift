//
//  CountryModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import Foundation
import MapKit

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
    let _id : Double?
    let flag : String?
    let iso2 : String?
    let iso3 : String?
    let lat : Double?
    let long: Double?
    
    var location: CLLocationCoordinate2D? {
        CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0)
    }
}

struct CountryLocation: Codable, Identifiable {
    var id = UUID()
    var country: String
    var latitude: Double
    var longitude: Double
    
    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
