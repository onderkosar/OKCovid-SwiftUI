//
//  HeaderView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct HeaderView: View {
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
                    HStack {
                        OKStatCard(title: "Cases", subTitle: "\(worldData.cases.numberFormat())\n" + "\(((Double(worldData.cases) * 100) / Double(worldData.population)).rounded(by: 2))% of the population")
                            .padding(.leading, 5)
                        Spacer()
                        
                        OKStatCard(title: "Deaths", subTitle: "\(worldData.deaths.numberFormat())\n" + "\(((Double(worldData.deaths) * 100) / Double(worldData.cases)).rounded(by: 2))% of total cases")
                        .padding(.trailing, 5)
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        OKStatCard(title: "Active", subTitle: "\(worldData.active.numberFormat())\n" + "\(((Double(worldData.active) * 100) / Double(worldData.population)).rounded(by: 2))% of the population")
                        .padding(.leading, 5)
                        
                        Spacer()
                        
                        OKStatCard(title: "Recovered", subTitle: "\(worldData.recovered.numberFormat())\n" + "\(((Double(worldData.recovered) * 100) / Double(worldData.cases)).rounded(by: 2))% of total cases")
                        .padding(.trailing, 5)
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

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(worldData: WorldModel(population: 0, cases: 0, active: 0, deaths: 0, recovered: 0))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
