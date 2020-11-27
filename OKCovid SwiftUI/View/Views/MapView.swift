//
//  MapView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 24.10.2020.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.anotationsData, annotationContent: { country in
            MapAnnotation(coordinate: country.location) {
                OKAnnotation(countryName: country.name.lowercased(), cases: country.cases, deaths: country.deaths)
            }
        })
        .onAppear(perform: {
            viewModel.getData()
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewLayout(.sizeThatFits)
    }
}
