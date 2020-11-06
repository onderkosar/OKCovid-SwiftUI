//
//  StatView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import SwiftUI

struct OKStatCard: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Text(title)
                .font(.system(.title, design: .serif))
                .fontWeight(.bold)
                .shadow(color: Color(.secondaryLabel), radius: 1, x: 0.7, y: 0.7)
            
            Text(subTitle)
                .font(.system(.footnote, design: .serif))
                .shadow(color: Color(.secondaryLabel), radius: 1, x: 0.7, y: 0.7)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .shadow(radius: 3)
        } //: VSTACK
        .frame(width: 160, height: 80)
        .background(Color(.systemGray3))
        .cornerRadius(8)
        .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        OKStatCard(title: "Title", subTitle: "Subtitle")
            .colorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
