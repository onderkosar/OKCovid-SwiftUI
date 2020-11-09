//
//  CountryInfoForm.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 8.11.2020.
//

import SwiftUI

struct CountryInfoForm: View {
    var countryModel: CountryModel
    
    var body: some View {
        Form {
            Section(header: Text(countryModel.updatedLblText)) {
                HStack {
                    Image(systemName: "person.2")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Population").foregroundColor(Color.gray)
                    Spacer()
                    Text(countryModel.population.numberFormat())
                }
                HStack {
                    Image(systemName: "eyedropper.halffull")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Tests").foregroundColor(Color.gray)
                    Spacer()
                    Text(countryModel.tests.numberFormat())
                }
                HStack {
                    Image(systemName: "thermometer")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Cases").foregroundColor(Color.gray)
                    Spacer()
                    Text(countryModel.cases.numberFormat())
                }
                HStack {
                    Image(systemName: "heart.slash")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("Deaths").foregroundColor(Color.gray)
                    Spacer()
                    Text(countryModel.deaths.numberFormat())
                }
            }
        }
        .frame(height: 220, alignment: .top)
        .disabled(true)
    }
}

struct CountryInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        CountryInfoForm(countryModel: CountryModel(country: "USA", countryInfo: CountryInfo(_id: 840, flag: "", iso2: "US", iso3: "USA", lat: 38, long: -97), population: 331679824, updated: 1604871554091, tests: 156566706, cases: 9934653, active: 3351368, deaths: 241098, recovered: 6342187))
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}
