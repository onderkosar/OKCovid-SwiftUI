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
                OKSearchBar(searchText: $searchText, isSearching: $isSearching)
                    .padding(.vertical, 5)
                Divider()
                    .frame(height: 4)
                    .background(Color(.systemGray2))
                    .padding(.bottom, 5)
                Section(header:
                            OKListRow(textOne: "Country", textTwo: "Cases", textThree: "Deaths", fontSize: 22, fontWeight: .bold, frameWidth: 130)
                ) {
                    if searchText.isEmpty {
                        List {
                            ForEach(countries, id: \.country) { item in
                                ZStack {
                                    OKListRow(textOne: item.country, textTwo: "\(item.cases.numberFormat())", textThree: "\(item.deaths.numberFormat())", fontSize: 18, fontWeight: .medium, frameWidth: 130)
                                        .foregroundColor(Color(.secondaryLabel))
                                    NavigationLink(destination: AboutCountryVC(countryModel: item)) {
                                        EmptyView()
                                    }
                                }
                            }
                            .listRowInsets(EdgeInsets())
                        }
                    } else {
                        List {
                            ForEach(countries.filter {
                                $0.country.lowercased().contains(searchText.lowercased())
                            }, id: \.country) { item in
                                NavigationLink(destination: AboutCountryVC(countryModel: item)) {
                                    OKListRow(textOne: item.country, textTwo: "\(item.cases.numberFormat())", textThree: "\(item.deaths.numberFormat())", fontSize: 18, fontWeight: .medium, frameWidth: 130)
                                        .foregroundColor(Color(.secondaryLabel))
                                }
                                
                            }
                            .listRowInsets(EdgeInsets())
                        }
                    }
                    
                }
                .padding(.horizontal)
                .onAppear(perform: {
                    UITableView.appearance().showsVerticalScrollIndicator = false
                    getData()
                })
            }
            .navigationBarTitle("Country List", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
