//
//  TotalStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct TotalStatsVC: View {
    let countries = ["usa", "uk", "ita", "fr", "esp", "deu", "tr", "bel", "can", "au", "bra"]
    
    @State private var worldModel: WorldModel?
    @State private var countriesModel: [CountryModel] = []
    
    
    var body: some View {
        VStack {
            if countriesModel.count < countries.count {
                ProgressView()
                    .onAppear(perform: {
                        getData()
                    })
            } else {
                HeaderView(worldModel: worldModel ?? WorldModel(population: 1, updated: 1, cases: 1, active: 1, deaths: 1, recovered: 1))
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 15) {
                        ForEach(0 ..< countriesModel.count) { item in
                            CountryView(countryModel: countriesModel[item], countryIso: countries[item])
                                .cornerRadius(13)
                        }
                    }
                    .padding(.leading, 8)
                }
            }
        }
    }
    
    func getData() {
        NetworkManager.shared.fetch(for: nil, ifDaily: false) { (result: WorldModel) in
            DispatchQueue.main.async {
                self.worldModel = result
            }
        }
        
        for item in countries {
            NetworkManager.shared.fetch(for: item, ifDaily: false) { (result: CountryModel) in
                DispatchQueue.main.async {
                    self.countriesModel.append(result)
                }
            }
        }
    }
}

struct TotalStatsVC_Previews: PreviewProvider {
    static var previews: some View {
        TotalStatsVC()
            .preferredColorScheme(.dark)
    }
}
