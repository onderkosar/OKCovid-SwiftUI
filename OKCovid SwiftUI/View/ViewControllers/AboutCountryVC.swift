//
//  DailyStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 25.10.2020.
//

import SwiftUI

struct AboutCountryVC: View {
    @State var country: String
    @State var countryModel: CountryModel
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CountryInfoForm(countryModel: countryModel)
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    InsetMapView()
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    DailyStatsList(country: country)
                }
            }
            .padding(0)
            .navigationBarTitle("About " + country, displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AboutCountryVC_Previews: PreviewProvider {
    static var previews: some View {
        AboutCountryVC(country: "USA", countryModel: CountryModel(country: "USA", countryInfo: CountryInfo(_id: 840, flag: "", iso2: "US", iso3: "USA", lat: 38, long: -97), population: 331679824, updated: 1604846922098, tests: 156566706, cases: 9934653, active: 3351368, deaths: 241098, recovered: 6342187))
            .colorScheme(.dark)
    }
}
