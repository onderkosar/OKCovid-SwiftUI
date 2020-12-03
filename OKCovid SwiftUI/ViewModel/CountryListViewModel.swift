//
//  CountryListViewModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 3.12.2020.
//

import SwiftUI

final class CountryListViewModel: ObservableObject {
    @Published var countriesData: [CountryModel]    = []
    @Published var isShowingDetailView              = false
    @Published var sortedBy                         = "name"
    
    var selectedCountry: CountryModel? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    func getCountryListData() {
        NetworkManager.shared.fetch(for: "", ifDaily: false) { (result: [CountryModel]) in
            DispatchQueue.main.async {
                self.countriesData = result.sorted {
                    if self.sortedBy == "cases" {
                        return $0.cases > $1.cases
                    } else if self.sortedBy == "deaths" {
                        return $0.deaths > $1.deaths
                    } else {
                        return $1.countryName > $0.countryName
                    }
                }
            }
        }
    }
}
