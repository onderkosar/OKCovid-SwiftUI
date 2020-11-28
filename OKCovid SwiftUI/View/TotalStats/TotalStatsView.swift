//
//  TotalStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct TotalStatsView: View {
    @StateObject var viewModel = StatsViewModel()
    
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
                Spacer()
                HeaderView(worldData: viewModel.worldData ?? MockData.sampleWorldData)
                    .frame(maxWidth: 500)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 15) {
                        ForEach(viewModel.countriesData, id: \.countryInfo._id) { country in
                            CountryCardView(countryData: country)
                                .onTapGesture {
                                    viewModel.selectedCountry = country
                                }
                        }
                    }
                    .padding(.leading, 15)
                }
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    CountryDetailView(countryData: viewModel.selectedCountry ?? MockData.sampleCountryData, isShowingDetail: $viewModel.isShowingDetailView)
                }
            }
        }
        .blur(radius: viewModel.isShowingDetailView ? 5 : 0)
    }
}

struct TotalStatsVC_Previews: PreviewProvider {
    static var previews: some View {
        TotalStatsView()
            .preferredColorScheme(.dark)
    }
}
