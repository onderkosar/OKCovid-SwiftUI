//
//  OKXMarkButton.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 27.11.2020.
//

import SwiftUI

struct OKXMarkButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.secondary)
                .opacity(0.2)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 34, height: 34)
                .foregroundColor(.primary)
        }
    }
}

struct OKXMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        OKXMarkButton()
            .previewLayout(.sizeThatFits)
    }
}
