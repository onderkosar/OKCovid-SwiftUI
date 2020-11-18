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
        AboutCountryVC(countryModel: MockData.countryModel)
            .colorScheme(.dark)
    }
}
