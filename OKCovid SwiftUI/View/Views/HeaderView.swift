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
                    HStack {
                        OKStatCard(title: "Cases", subTitle: "\(worldModel.cases.numberFormat())")
                        .padding(.leading, 5)
                
                        Spacer()
                        
                        OKStatCard(title: "Deaths", subTitle: "\(worldModel.deaths.numberFormat())")
                        .padding(.trailing, 5)
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        OKStatCard(title: "Active", subTitle: "\(worldModel.active.numberFormat())")
                        .padding(.leading, 5)
                        
                        Spacer()
                        
                        OKStatCard(title: "Recovered", subTitle: "\(worldModel.recovered.numberFormat())")
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
