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
                    .scaleEffect(2)
            } else {
                HeaderView(worldData: viewModel.worldData ?? MockData.worldModel)
                    .frame(maxWidth: 500)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.countriesData, id: \.countryInfo._id) { country in
                            CountryCardView(countryData: country)
                                .cornerRadius(13)
                                .shadow(color: .secondary, radius: 1, x: 1, y: 1)
                                .onTapGesture {
                                    viewModel.selectedCountry = country
                                }
                        }
                    }
                    .padding(.leading, 8)
                }
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    AboutCountryVC(countryData: viewModel.selectedCountry ?? MockData.countryModel)
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
