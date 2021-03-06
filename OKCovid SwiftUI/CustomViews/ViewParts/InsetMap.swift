//
//  InsetMapView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 8.11.2020.
//

import SwiftUI
import MapKit

struct InsetMap: View {
    var countryData: CountryModel
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.8333, longitude: 12.8333), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                ZStack() {
                    HStack {
                        Image(countryData.country.lowercased().replaceSpace(with: "-"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                            .shadow(color: Color(.black), radius: 2, x: 2, y: 2)
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    .background(
                        Color.black
                            .opacity(0.6)
                            .cornerRadius(8)
                    )
                }
                .padding(12), alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMap_Previews: PreviewProvider {
    static var previews: some View {
        InsetMap(countryData: MockData.sampleCountryData)
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}
