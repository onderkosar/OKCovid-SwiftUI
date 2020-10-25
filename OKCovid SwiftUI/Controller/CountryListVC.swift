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
        NavigationView {
            VStack(spacing: 0) {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                    .padding(.vertical, 5)
                Divider()
                    .frame(height: 4)
                    .background(Color(.systemGray2))
                    .padding(.bottom, 5)
                VStack(spacing: 0) {
                    ListCell(textOne: "Country", textTwo: "Cases", textThree: "Deaths", fontSize: 22, fontWeight: .bold, frameWidth: 130)
                        .shadow(color: .secondary, radius: 1, x: 2, y: 2)
                        .padding(.horizontal)
                    if searchText.isEmpty {
                        List {
                            ForEach(countries, id: \.country) { item in
                                NavigationLink(destination: DailyStatsVC(country: item.country)) {
                                    ListCell(textOne: item.country, textTwo: "\(item.cases.numberFormat())", textThree: "\(item.deaths.numberFormat())", fontSize: 18, fontWeight: .medium, frameWidth: 130)
                                        .foregroundColor(Color(.secondaryLabel))
                                }
                                
                            }
                        }
                        .listStyle(PlainListStyle())
                        .onAppear(perform: {
                            getData()
                        })
                    } else {
                        List {
                            ForEach(countries.filter {
                                $0.country.lowercased().contains(searchText.lowercased())
                            }, id: \.country) { item in
                                NavigationLink(destination: DailyStatsVC(country: item.country)) {
                                    ListCell(textOne: item.country, textTwo: "\(item.cases.numberFormat())", textThree: "\(item.deaths.numberFormat())", fontSize: 18, fontWeight: .medium, frameWidth: 130)
                                        .foregroundColor(Color(.secondaryLabel))
                                }
                                
                            }
                        }
                        .listStyle(PlainListStyle())
                        .onAppear(perform: {
                            getData()
                        })
                    }
                }
            }
            .navigationBarTitle("Country List", displayMode: .inline)
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
    }
}