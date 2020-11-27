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
    let updated : Double
    let tests : Int
    let cases : Int
    let active : Int
    let deaths : Int
    let recovered : Int
    
    // MARK: - Country Model Computed Properties
    var countryName:String {
        var fullName = ""
        if country == "USA" {
            fullName = "United States of America"
        } else if country == "UK" {
            fullName = "United Kingdom"
        } else {
            fullName = country
        }
        return fullName
    }
    
    var updatedLblText: String {
        let converted   = (updated / 1000).getDateFromTimeStamp()
        let dateLblText = "last updated: " + converted + " (GMT)"
        
        return dateLblText
    }
    
    var statOfCases: String {
        if cases == 0 {
            return "N/A\n"
        } else {
            return "\(cases.numberFormat())\n" + "\(((Double(cases) * 100) / Double(population)).rounded(by: 2))% of the population"
        }
    }
    
    var statOfDeaths: String {
        if deaths == 0 {
            return "N/A\n"
        } else {
            return "\(deaths.numberFormat())\n" + "\(((Double(deaths) * 100) / Double(cases)).rounded(by: 2))% of total cases"
        }
    }
    
    var statOfActive: String {
        if recovered == 0 {
            return "N/A\n"
        } else {
            return "\(active.numberFormat())\n" + "\(((Double(active) * 100) / Double(population)).rounded(by: 2))% of the population"
        }
    }
    
    var statOfRocovered: String {
        if recovered == 0 {
            return "N/A\n"
        } else {
            return "\(recovered.numberFormat())\n" + "\(((Double(recovered) * 100) / Double(cases)).rounded(by: 2))% of total cases"
        }
    }
}

struct CountryInfo: Codable, Hashable {
    let _id : Double?
    let flag : String?
    let iso2 : String?
    let iso3 : String?
    let lat : Double?
    let long: Double?
    
    // MARK: - Country Info Computed Properties
    var location: CLLocationCoordinate2D? {
        CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0)
    }
}

struct AnotationModel: Codable, Identifiable {
    var id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    var cases: Int
    var deaths: Int
    
    // MARK: - Anotation Model Computed Properties
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
