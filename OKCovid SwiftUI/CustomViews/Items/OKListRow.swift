//
//  ListCell.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 25.10.2020.
//

import SwiftUI

struct OKListRow: View {
    @State var textOne: String
    @State var textTwo: String
    @State var textThree: String
    
    @State var fontSize: CGFloat
    @State var fontWeight: Font.Weight
    @State var frameWidth: CGFloat
    
    var body: some View {
        HStack {
            OKTitleLabel(title: textOne, fontSize: fontSize, fontWeight: fontWeight)
                .frame(width: frameWidth, alignment: .leading)
            Spacer()
            OKTitleLabel(title: textTwo, fontSize: fontSize, fontWeight: fontWeight)
                .frame(width: (frameWidth-40), alignment: .trailing)
            OKTitleLabel(title: textThree, fontSize: fontSize, fontWeight: fontWeight)
                .frame(width: (frameWidth-40), alignment: .trailing)
        }
        .frame(height: (fontSize+1), alignment: .center)
    }
}

struct OKListRow_Previews: PreviewProvider {
    static var previews: some View {
        OKListRow(textOne: "Text1", textTwo: "Text2", textThree: "Text3", fontSize: 16, fontWeight: .bold, frameWidth: 130)
            .previewLayout(.sizeThatFits)
    }
}
