//
//  DailyStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 25.10.2020.
//

import SwiftUI
import MapKit

struct AboutCountryVC: View {
    @State var countryModel: CountryModel
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CountryInfoForm(countryModel: countryModel)
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    InsetMapView(countryModel: countryModel, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: countryModel.countryInfo.lat ?? 48, longitude: countryModel.countryInfo.long ?? 9), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)))
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    DailyStatsList(country: countryModel.country)
                }
            }
            .padding(0)
            .navigationBarTitle("About " + countryModel.country, displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AboutCountryVC_Previews: PreviewProvider {
    static var previews: some View {
        AboutCountryVC(countryModel: CountryModel(country: "USA", countryInfo: CountryInfo(_id: 840, flag: "", iso2: "US", iso3: "USA", lat: 38, long: -97), population: 331679824, updated: 1604846922098, tests: 156566706, cases: 9934653, active: 3351368, deaths: 241098, recovered: 6342187))
            .colorScheme(.dark)
    }
}
