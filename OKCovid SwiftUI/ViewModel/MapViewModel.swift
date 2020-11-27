//
//  MapViewModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 27.11.2020.
//

import SwiftUI
import MapKit

final class MapViewModel: ObservableObject {
    
    @Published var region: MKCoordinateRegion = {
        var mapCoordinates  = CLLocationCoordinate2D(latitude: 55.000000, longitude: 15.0000000)
        var mapZoomLevel    = MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40)
        var mapRegion       = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    @Published var countriesData: [CountryModel]       = []
    @Published var anotationsData: [AnotationModel]    = []
    
    func getData() {
        NetworkManager.shared.fetch(for: "", ifDaily: false) { (result: [CountryModel]) in
            DispatchQueue.main.async { [self] in
                self.countriesData = result
                
                for item in countriesData {
                    if item.cases > 1000 {
                        anotationsData.append(AnotationModel(name: item.country, latitude: item.countryInfo.lat ?? 0, longitude: item.countryInfo.long ?? 0, cases: item.cases, deaths: item.deaths))
                    }
                }
            }
        }
    }
}
