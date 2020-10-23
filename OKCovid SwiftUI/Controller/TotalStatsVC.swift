//
//  TotalStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct TotalStatsVC: View {
    @State private var worldModel: WorldModel?
    
    var body: some View {
        VStack {
            HeaderView(worldModel: worldModel ?? WorldModel(population: 1, updated: 1, cases: 1, active: 1, deaths: 1, recovered: 1))
                .onAppear(perform: {
                    getGlobalData()
                })
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 15) {
                    ForEach(0 ..< 3) { item in
                        CountryView()
                            .cornerRadius(13)
                    }
                }
                .padding(.leading, 8)
            }
        }
    }
    
    func getGlobalData() {
        NetworkManager.shared.fetch(for: nil, ifDaily: false) { (result: WorldModel) in
            DispatchQueue.main.async {
                self.worldModel = result
            }
        }
    }
}

struct TotalStatsVC_Previews: PreviewProvider {
    static var previews: some View {
        TotalStatsVC()
            .preferredColorScheme(.dark)
//            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
