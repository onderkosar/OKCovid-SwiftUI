//
//  HeaderView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct WorldStatsCard: View {
    var worldData: WorldModel
        
    var body: some View {
        VStack(spacing: 0) {
            Text("WORLD STATS")
                .font(.system(.largeTitle, design: .serif))
                .fontWeight(.black)
                .shadow(color: .secondary, radius: 1, x: 0.7, y: 0.7)
            
            ZStack {
                VStack(spacing: 20) {
                    Text("Population: \(worldData.population.numberFormat())")
                        .font(.system(size: 17, design: .serif))
                        .fontWeight(.light)
                        .shadow(color: Color(.darkGray), radius: 1, x: 0.7, y: 0.7)
                        .foregroundColor(Color(.label))
                        .padding(.top, 5)
                    VStack(alignment: .center, spacing: 20) {
                        HStack() {
                            OKStatCard(title: "Cases", subTitle: worldData.statOfCases)
                                .padding(.leading, 5)
                            Spacer()
                            OKStatCard(title: "Deaths", subTitle: worldData.statOfDeaths)
                                .padding(.trailing, 5)
                        }
                        HStack() {
                            OKStatCard(title: "Active", subTitle: worldData.statOfActive)
                                .padding(.leading, 5)
                            Spacer()
                            OKStatCard(title: "Recovered", subTitle: worldData.statOfRocovered)
                                .padding(.trailing, 5)
                        }
                    }
                    .padding(.vertical, 5)
                    
                }
            }
            .background(Color(.systemGray))
            .cornerRadius(9)
            .padding(.horizontal, 8)
        }
    }
}

struct WorldStatsCard_Previews: PreviewProvider {
    static var previews: some View {
        WorldStatsCard(worldData: WorldModel(population: 0, cases: 0, active: 0, deaths: 0, recovered: 0))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
