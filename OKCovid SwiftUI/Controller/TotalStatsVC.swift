//
//  TotalStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct TotalStatsVC: View {
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
        }
    }
}

struct TotalStatsVC_Previews: PreviewProvider {
    static var previews: some View {
        TotalStatsVC()
            .preferredColorScheme(.dark)
//            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
