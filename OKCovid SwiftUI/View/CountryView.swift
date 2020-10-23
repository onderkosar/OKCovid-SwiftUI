//
//  CountryView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import SwiftUI

struct CountryView: View {
    var body: some View {
        ZStack {
            VStack() {
                HStack {
                    Image("united-states")
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                    Spacer()
                    Text("United States of America")
                        .font(.system(.title2, design: .serif))
                        .fontWeight(.bold)
                        .padding(5)
                        .padding(.trailing, 15)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                }
                .padding(.horizontal, 8)
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
        .frame(width: 340, height: 340, alignment: .center)
        .background(Color.secondary)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
            .previewLayout(.sizeThatFits)
    }
}
