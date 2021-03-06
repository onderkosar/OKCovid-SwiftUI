//
//  MapAnnotationView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 24.10.2020.
//

import SwiftUI

struct OKAnnotation: View {
    @State private var animation: Double = 0.0
    
    let countryName: String
    let cases: Int
    let deaths: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 24, height: 24)
                
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 22, height: 22)
                    .scaleEffect(1 + CGFloat(animation))
                    .opacity(1 - animation)
                
                Image(countryName.replaceSpace(with: "-"))
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
            
            VStack {
                HStack(alignment: .top , spacing: 0) {
                    Text("Cases")
                        .frame(width: 30, height: 11, alignment: .leading)
                        .font(.system(size: 8, weight: .bold, design: .serif))
                        .foregroundColor(Color.black)
                    Text("\(cases.numberFormat())")
                        .frame(width: 50, height: 11, alignment: .trailing)
                        .font(.system(size: 9, weight: .bold, design: .serif))
                        .foregroundColor(Color.black)
                }
                HStack(alignment: .top , spacing: 0) {
                    Text("Deaths")
                        .frame(width: 30, height: 11, alignment: .leading)
                        .font(.system(size: 8, weight: .bold, design: .serif))
                        .foregroundColor(Color.black)
                    Text("\(deaths.numberFormat())")
                        .frame(width: 50, height: 11, alignment: .trailing)
                        .font(.system(size: 9, weight: .bold, design: .serif))
                        .foregroundColor(Color.black)
                }
            }
            .background(Color(.systemGray)).opacity(0.8)
            .cornerRadius(4)
            
        }
        .frame(width: 80, height: 50)
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        OKAnnotation(countryName: "usa", cases: 0, deaths: 0)
            .colorScheme(.light)
            .previewLayout(.sizeThatFits)
    }
}
