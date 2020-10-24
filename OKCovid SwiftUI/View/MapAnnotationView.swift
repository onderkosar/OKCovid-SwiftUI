//
//  MapAnnotationView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 24.10.2020.
//

import SwiftUI

struct MapAnnotationView: View {
    var location: CountryLocation
    
    @State private var animation: Double = 0.0
    let countryName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 24, height: 24)
            
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 22, height: 22)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(countryName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .clipShape(Circle())
                .accentColor(Color.red)
        }
        .onAppear {
            withAnimation(Animation.easeIn(duration: 2)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(location: CountryLocation(country: "", latitude: 0, longitude: 0), countryName: "")
    }
}
