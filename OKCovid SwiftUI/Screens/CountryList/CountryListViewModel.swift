//
//  CountryListViewModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 27.11.2020.
//

import SwiftUI

final class CountryListViewModel: ObservableObject {
    @Published var countriesData: [CountryModel]    = []
    @Published var isShowingDetailView              = false
    
    var selectedCountry: CountryModel? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    func getData() {
        NetworkManager.shared.fetch(for: "", ifDaily: false) { (result: [CountryModel]) in
            DispatchQueue.main.async {
                self.countriesData = result
            }
        }
    }
}
