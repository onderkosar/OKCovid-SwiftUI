//
//  CountryDetailView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 27.11.2020.
//

import SwiftUI
import MapKit

struct CountryDetailView: View {
    @State var countryData: CountryModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CountryInfoForm(countryData: countryData)
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    InsetMapView(countryData: countryData, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: countryData.countryInfo.lat ?? 48, longitude: countryData.countryInfo.long ?? 9), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)))
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    DailyStatsList(country: countryData.country)
                }
            }
            .padding(0)
            .navigationBarTitle("About " + countryData.country, displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: MockData.sampleCountryData)
            .colorScheme(.dark)
    }
}
