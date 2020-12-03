//
//  MapStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI
import MapKit

struct WorldMapView: View {
    @StateObject var viewModel = WorldMapViewModel()
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.anotationsData, annotationContent: { country in
                MapAnnotation(coordinate: country.location) {
                    WorldMapAnnotation(countryName: country.name.lowercased(), cases: country.cases, deaths: country.deaths)
                }
            })
            .onAppear(perform: {
                viewModel.getData()
            })
                .navigationBarTitle("World Map", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct WorldMapView_Previews: PreviewProvider {
    static var previews: some View {
        WorldMapView()
    }
}
