//
//  MapView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 24.10.2020.
//

import SwiftUI
import MapKit

struct MapView: View {
    let countries = ["usa", "uk", "ita", "fr", "esp", "deu", "tr", "bel", "can", "au", "bra"]
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates  = CLLocationCoordinate2D(latitude: 55.000000, longitude: 15.0000000)
        var mapZoomLevel    = MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40)
        var mapRegion       = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    @State private var countriesModel: [CountryModel]       = []
    @State private var anotationsModel: [AnotationModel]    = []
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: anotationsModel, annotationContent: { country in
            MapAnnotation(coordinate: country.location) {
                MapAnnotationView(countryName: country.name.lowercased(), cases: country.cases, deaths: country.deaths)
            }
        })
        .onAppear(perform: {
            getData()
        })
    }
    
    func getData() {
        NetworkManager.shared.fetch(for: "", ifDaily: false) { (result: [CountryModel]) in
            DispatchQueue.main.async {
                self.countriesModel = result
                
                for item in countriesModel {
                    if item.cases > 1000 {
                        anotationsModel.append(AnotationModel(name: item.country, latitude: item.countryInfo.lat ?? 0, longitude: item.countryInfo.long ?? 0, cases: item.cases, deaths: item.deaths))
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}