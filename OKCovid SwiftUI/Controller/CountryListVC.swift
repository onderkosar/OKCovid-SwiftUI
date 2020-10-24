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
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search countries...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                if searchText.isEmpty {
                    List(countries, id: \.country) { item in
                        VStack(alignment: .leading) {
                            Text(item.country)
                                .font(.headline)
                            Text("\(item.cases)")
                                .font(.footnote)
                        }
                    }
                    .onAppear(perform: {
                        getData()
                    })
                } else {
                    List(countries.filter {
                        $0.country.lowercased().contains(searchText.lowercased())
                    }, id: \.country) { item in
                        VStack(alignment: .leading) {
                            Text(item.country)
                                .font(.headline)
                            Text("\(item.cases)")
                                .font(.footnote)
                        }
                    }
                    .onAppear(perform: {
                        getData()
                    })
                }
            }
            .navigationBarTitle("Countries", displayMode: .inline)
        }
        .navigationBarTitle("Countries")
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
    }
}
