//
//  HeaderView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct HeaderView: View {
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
                        StatView(title: "Cases", subTitle: "41.878.121")
                        .padding(.leading, 5)
                
                        Spacer()
                        
                        StatView(title: "Deaths", subTitle: "1.140.701")
                        .padding(.trailing, 5)
                    }
                    
                    HStack() {
                        StatView(title: "Active", subTitle: "10.777.854")
                        .padding(.leading, 5)
                        
                        Spacer()
                        
                        StatView(title: "Recovered", subTitle: "31.100.267")
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
        HeaderView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
