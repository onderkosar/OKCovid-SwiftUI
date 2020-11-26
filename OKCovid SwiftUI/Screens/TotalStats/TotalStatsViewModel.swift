//
//  TotalStatsViewModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 26.11.2020.
//

import SwiftUI

final class TotalStatsViewModel: ObservableObject {
    @Published var worldData: WorldModel?
    @Published var countriesData: [CountryModel]    = []
    @Published var isLoading                        = true
    @Published var isShowingDetailView              = false
    
    var selectedCountry: CountryModel? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    let countries = ["usa", "uk", "ita", "fr", "esp", "deu", "tr", "bel", "can", "au", "bra"]
    
    func getData() {
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
}
