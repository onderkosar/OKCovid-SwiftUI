//
//  ListCell.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 25.10.2020.
//

import SwiftUI

struct ListCell: View {
    @State var textOne: String
    @State var textTwo: String
    @State var textThree: String
    
    @State var fontSize: CGFloat
    @State var fontWeight: Font.Weight
    @State var frameWidth: CGFloat
    
    var body: some View {
        HStack {
            Text(textOne)
                .font(.system(size: fontSize, weight: fontWeight, design: .serif))
                .frame(width: frameWidth, alignment: .leading)
            Spacer()
            Text(textTwo)
                .font(.system(size: fontSize, weight: fontWeight, design: .serif))
                .font(.footnote)
                .frame(width: (frameWidth-40), alignment: .trailing)
            Text(textThree)
                .font(.system(size: fontSize, weight: fontWeight, design: .serif))
                .font(.footnote)
                .frame(width: (frameWidth-40), alignment: .trailing)
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(textOne: "Text1", textTwo: "Text2", textThree: "Text3", fontSize: 16, fontWeight: .bold, frameWidth: 130)
            .previewLayout(.sizeThatFits)
    }
}
