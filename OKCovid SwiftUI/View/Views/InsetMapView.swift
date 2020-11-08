//
//  InsetMapView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 8.11.2020.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38, longitude: -97), span: MKCoordinateSpan(latitudeDelta: 30.0, longitudeDelta: 30.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color(.systemOrange))
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(Color(.systemGray3))
                            .fontWeight(.bold)
                    } //: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.6)
                            .cornerRadius(8)
                    )
                } //: NAVIGATION
                .padding(12), alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}
