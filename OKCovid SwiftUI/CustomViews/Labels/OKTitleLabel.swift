//
//  OKTitleLabel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 2.12.2020.
//

import SwiftUI

struct OKTitleLabel: View {
    var title: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    
    var body: some View {
        Text(title)
            .font(.system(size: fontSize, weight: fontWeight, design: .serif))
            .shadow(color: .secondary, radius: 0.5, x: 0.3, y: 0.3)
    }
}

struct OKTitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        OKTitleLabel(title: "Title", fontSize: 22, fontWeight: .bold)
            .previewLayout(.sizeThatFits)
    }
}
