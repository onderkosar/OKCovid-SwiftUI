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
        VStack() {
            Text("WORLD STATS")
                .font(.system(.largeTitle, design: .serif))
                .fontWeight(.black)
                .shadow(color: .secondary, radius: 3, x: 2, y: 2)
            
            ZStack {
                CurvedSideRectangle()
                    .fill(Color.secondary).opacity(0.8)
                    .frame(height: 190.0)
                    .shadow(radius: 20)
                
                VStack(alignment: .center, spacing: 20) {
                    HStack() {
                        StatView(title: "Cases", subTitle: "\(worldModel.cases.numberFormat())")
                        .padding(.leading, 5)
                
                        Spacer()
                        
                        StatView(title: "Deaths", subTitle: "\(worldModel.deaths.numberFormat())")
                        .padding(.trailing, 5)
                    }
                    
                    HStack() {
                        StatView(title: "Active", subTitle: "\(worldModel.active.numberFormat())")
                        .padding(.leading, 5)
                        
                        Spacer()
                        
                        StatView(title: "Recovered", subTitle: "\(worldModel.recovered.numberFormat())")
                        .padding(.trailing, 5)
                    }
                    
                }
                .padding(.top, 5)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(worldModel: WorldModel(population: 0, updated: 0, cases: 0, active: 0, deaths: 0, recovered: 0))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
