//
//  TotalStatsViewModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 26.11.2020.
//

import SwiftUI

final class StatsViewModel: ObservableObject {
    @Published var worldData: WorldModel?
    @Published var countriesData: [CountryModel]    = []
    @Published var isLoading                        = true
    @Published var isShowingDetailView              = false
    @Published var sortedBy                         = "name"
    
    var selectedCountry: CountryModel? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    private let countries = ["usa", "uk", "ita", "fr", "esp", "deu", "tr", "can", "au", "bra"]
    
    func getTotalStatsData() {
        NetworkManager.shared.fetch(for: nil, ifDaily: false) { (result: WorldModel) in
            DispatchQueue.main.async {
                self.worldData = result
            }
        }
        
        for item in countries {
            NetworkManager.shared.fetch(for: item, ifDaily: false) { (result: CountryModel) in
                DispatchQueue.main.sync {
                    self.countriesData.append(result)
                    
                    if self.countriesData.count == self.countries.count {
                        self.isLoading = false
                    }
                }
            }
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
