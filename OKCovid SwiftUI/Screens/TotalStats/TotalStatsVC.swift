//
//  TotalStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct TotalStatsVC: View {
    @StateObject var viewModel = CovidStatsViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .onAppear(perform: {
                        viewModel.getTotalStatsData()
                    })
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
            } else {
                HeaderView(worldData: viewModel.worldData ?? MockData.sampleWorldData)
                    .frame(maxWidth: 500)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.countriesData, id: \.countryInfo._id) { country in
                            CountryCardView(countryData: country)
                                .padding()
                                .onTapGesture {
                                    viewModel.selectedCountry = country
                                }
                        }
                    }
                }
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    CountryDetailView(countryData: viewModel.selectedCountry ?? MockData.sampleCountryData, isShowingDetail: $viewModel.isShowingDetailView)
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
