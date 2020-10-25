//
//  CountryListVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 24.10.2020.
//

import SwiftUI

struct CountryListVC: View {
    @State var countries    = [CountryModel]()
    @State var searchText   = ""
    @State var isSearching  = false
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText, isSearching: $isSearching)
                .padding(.bottom, 30)
            VStack {
                ListCell(textOne: "CountryName", textTwo: "Cases", textThree: "Deaths", fontSize: 16, fontWeight: .bold, frameWidth: 130)
                .padding(.horizontal)
                if searchText.isEmpty {
                    List(countries, id: \.country) { item in
                        ListCell(textOne: item.country, textTwo: "\(item.cases)", textThree: "\(item.deaths)", fontSize: 12, fontWeight: .medium, frameWidth: 130)
                    }
                    .onAppear(perform: {
                        getData()
                    })
                } else {
                    List(countries.filter {
                        $0.country.lowercased().contains(searchText.lowercased())
                    }, id: \.country) { item in
                        ListCell(textOne: item.country, textTwo: "\(item.cases)", textThree: "\(item.deaths)", fontSize: 12, fontWeight: .medium, frameWidth: 130)
                    }
                    .onAppear(perform: {
                        getData()
                    })
                }
            }
        }
    }
    
    func getData() {
        NetworkManager.shared.fetch(for: "", ifDaily: false) { (result: [CountryModel]) in
            DispatchQueue.main.async {
                self.countries = result
            }
        }
    }
}

struct CountryListVC_Previews: PreviewProvider {
    static var previews: some View {
        CountryListVC()
//        HStack {
//            CountryListVC()
//            CountryListVC()
//                .colorScheme(.dark)
//        }.previewLayout(.fixed(width: 800, height: 400))
    }
}
