//
//  TotalStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct TotalStatsVC: View {
    @StateObject var viewModel = TotalStatsViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .onAppear(perform: {
                        viewModel.getData()
                    })
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            } else {
                HeaderView(worldData: viewModel.worldData ?? MockData.worldModel)
                    .frame(maxWidth: 500)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0 ..< viewModel.countriesData.count) { item in
                            CountryCardView(countryData: viewModel.countriesData[item])
                                .cornerRadius(13)
                                .shadow(color: .secondary, radius: 1, x: 1, y: 1)
                        }
                    }
                    .padding(.leading, 8)
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
