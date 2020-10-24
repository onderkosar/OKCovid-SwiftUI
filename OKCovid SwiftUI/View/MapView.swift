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
    
    @State private var countriesModel: [CountryModel]   = []
    @State private var locations: [CountryLocation]     = []
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            MapPin(coordinate: item.location, tint: Color.red)
        })
        .onAppear(perform: {
            getData()
        })
    }
    
    func getData() {        
        for item in countries {
            NetworkManager.shared.fetch(for: item, ifDaily: false) { (result: CountryModel) in
                DispatchQueue.main.async {
                    locations.append(CountryLocation(latitude: result.countryInfo.lat, longitude: result.countryInfo.long))
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
