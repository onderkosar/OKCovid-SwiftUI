//
//  ContentView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 22.10.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TotalStatsView()
                .tabItem({
                    Image(systemName: "person.3.fill")
                    Text("Total Stats")
                })
            WorldMapView()
                .tabItem({
                    Image(systemName: "map.fill")
                    Text("Map")
                })
            CountryListView()
                .tabItem({
                    Image(systemName: "list.dash")
                    Text("Countries")
                })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
