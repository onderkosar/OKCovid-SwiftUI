//
//  CountryListVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 24.10.2020.
//

import SwiftUI

struct CountryListVC: View {
    @StateObject var viewModel  = CountryListViewModel()
    @State var searchText       = ""
    @State var isSearching      = false
    
    var body: some View {
        NavigationView {
            VStack() {
                OKSearchBar(searchText: $searchText, isSearching: $isSearching)
                    .padding(.vertical, 5)
                Divider()
                    .frame(height: 4)
                    .background(Color(.systemGray2))
                    .padding(.bottom, 5)
                Section(header:
                            OKListRow(textOne: "Country", textTwo: "Cases", textThree: "Deaths", fontSize: 22, fontWeight: .bold, frameWidth: 130)
                ) {
                    List {
                        ForEach(searchText.isEmpty ? viewModel.countriesData : viewModel.countriesData.filter {
                            $0.country.lowercased().contains(searchText.lowercased())
                        }, id: \.country) { country in
                            ZStack {
                                OKListRow(textOne: country.country, textTwo: "\(country.cases.numberFormat())", textThree: "\(country.deaths.numberFormat())", fontSize: 18, fontWeight: .medium, frameWidth: 130)
                                    .foregroundColor(Color(.secondaryLabel))
                                    .onTapGesture {
                                        viewModel.selectedCountry = country
                                    }
                            }
                        }
                        .listRowInsets(EdgeInsets())
                    }
                }
                .padding(.horizontal)
                .onAppear(perform: {
                    UITableView.appearance().showsVerticalScrollIndicator = false
                    viewModel.getData()
                })
            }
            .navigationBarTitle("Country List", displayMode: .inline)
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                AboutCountryVC(countryData: viewModel.selectedCountry ?? MockData.countryModel)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CountryListVC_Previews: PreviewProvider {
    static var previews: some View {
        CountryListVC()
    }
}
