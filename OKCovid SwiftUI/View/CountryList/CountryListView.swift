//
//  CountryListVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 24.10.2020.
//

import SwiftUI

struct CountryListView: View {
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
                            HStack {
                                OKTitleLabel(title: "Country",
                                        fontSize: 22,
                                        fontWeight: .bold)
                                    .frame(width: 130, alignment: .leading)
                                    .onTapGesture {
                                        viewModel.sortedBy = "name"
                                        viewModel.getCountryListData()
                                    }
                                Spacer()
                                OKTitleLabel(title: "Cases",
                                        fontSize: 22,
                                        fontWeight: .bold)
                                    .frame(width: 90, alignment: .trailing)
                                    .onTapGesture {
                                        viewModel.sortedBy = "cases"
                                        viewModel.getCountryListData()
                                    }
                                OKTitleLabel(title: "Deaths",
                                        fontSize: 22,
                                        fontWeight: .bold)
                                    .frame(width: 90, alignment: .trailing)
                                    .onTapGesture {
                                        viewModel.sortedBy = "deaths"
                                        viewModel.getCountryListData()
                                    }
                            }
                ) {
                    List {
                        ForEach(searchText.isEmpty ? viewModel.countriesData : viewModel.countriesData.filter {
                            $0.country.lowercased().contains(searchText.lowercased())
                        }, id: \.country) { country in
                            OKListRow(textOne: country.country,
                                      textTwo: "\(country.cases.numberFormat())",
                                      textThree: "\(country.deaths.numberFormat())",
                                      fontSize: 18,
                                      fontWeight: .medium,
                                      frameWidth: 130)
                                .foregroundColor(Color(.secondaryLabel))
                                .onTapGesture {
                                    viewModel.selectedCountry = country
                                }
                        }
                        .listRowInsets(EdgeInsets())
                    }
                }
                .padding(.horizontal)
                .onAppear(perform: {
                    UITableView.appearance().showsVerticalScrollIndicator = false
                    viewModel.getCountryListData()
                })
            }
            .navigationBarTitle("Country List", displayMode: .inline)
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                CountryDetailView(countryData: viewModel.selectedCountry ?? MockData.sampleCountryData, isShowingDetail: $viewModel.isShowingDetailView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .blur(radius: viewModel.isShowingDetailView ? 5 : 0)
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
