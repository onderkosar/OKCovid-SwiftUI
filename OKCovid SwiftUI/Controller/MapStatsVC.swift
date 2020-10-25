//
//  MapStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct MapStatsVC: View {
    
    var body: some View {
        NavigationView {
            MapView()
                .navigationBarTitle("World Map", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct MapStatsVC_Previews: PreviewProvider {
    static var previews: some View {
        MapStatsVC()
    }
}
