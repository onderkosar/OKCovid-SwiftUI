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
            OKTitleLabel(title: title, fontSize: 28, fontWeight: .bold)
            OKTitleLabel(title: subTitle, fontSize: 13, fontWeight: .medium)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(width: 160, height: 80)
        .background(Color(.systemGray3))
        .cornerRadius(8)
        .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
    }
}

struct OKStatCard_Previews: PreviewProvider {
    static var previews: some View {
        OKStatCard(title: "Title", subTitle: "Subtitle")
            .colorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
