//
//  HeaderView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct HeaderView: View {
    var worldModel: WorldModel
        
    var body: some View {
        VStack(spacing: 0) {
            Text("WORLD STATS")
                .font(.system(.largeTitle, design: .serif))
                .fontWeight(.black)
                .shadow(color: .secondary, radius: 1, x: 0.7, y: 0.7)
            
            ZStack {
                VStack(spacing: 20) {
                    Text("Population: \(worldModel.population.numberFormat())")
                        .font(.system(size: 17, design: .serif))
                        .fontWeight(.light)
                        .foregroundColor(Color(.lightText))
                        .padding(.top, 5)
                        .padding(.trailing, 15)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .shadow(color: Color(.darkGray), radius: 1, x: 0.7, y: 0.7)
                    HStack {
                        OKStatCard(title: "Cases", subTitle: "\(worldModel.cases.numberFormat())\n" + "\(((Double(worldModel.cases) * 100) / Double(worldModel.population)).rounded(by: 2))% of the population")
                            .padding(.leading, 5)
                        Spacer()
                        
                        OKStatCard(title: "Deaths", subTitle: "\(worldModel.deaths.numberFormat())\n" + "\(((Double(worldModel.deaths) * 100) / Double(worldModel.cases)).rounded(by: 2))% of total cases")
                        .padding(.trailing, 5)
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        OKStatCard(title: "Active", subTitle: "\(worldModel.active.numberFormat())\n" + "\(((Double(worldModel.active) * 100) / Double(worldModel.population)).rounded(by: 2))% of the population")
                        .padding(.leading, 5)
                        
                        Spacer()
                        
                        OKStatCard(title: "Recovered", subTitle: "\(worldModel.recovered.numberFormat())\n" + "\(((Double(worldModel.recovered) * 100) / Double(worldModel.cases)).rounded(by: 2))% of total cases")
                        .padding(.trailing, 5)
                    }
                    .padding(.vertical, 5)
                    
                }
            }
            .background(Color(.systemGray))
            .cornerRadius(9)
            .padding(.horizontal, 8)
        }
        .shadow(color: .secondary, radius: 1, x: 1, y: 1)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(worldModel: WorldModel(population: 0, updated: 0, cases: 0, active: 0, deaths: 0, recovered: 0))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
