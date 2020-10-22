//
//  StatView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import SwiftUI

struct StatView: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Text(title)
                .font(.system(.title, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .shadow(radius: 3)
            
            Text(subTitle)
                .font(.system(.footnote, design: .serif))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .shadow(radius: 3)
        } //: VSTACK
        .frame(width: 160, height: 80)
        .background(Color.secondary)
        .cornerRadius(8)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(title: "Title", subTitle: "Subtitle")
            .previewLayout(.sizeThatFits)
    }
}
