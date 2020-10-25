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
                    .frame(width: 29, height: 29)
                
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 27, height: 27)
                    .scaleEffect(1 + CGFloat(animation))
                    .opacity(1 - animation)
                
                Image(countryName.replaceSpace(with: "-"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                    .accentColor(Color.red)
                    .shadow(color: Color(.black), radius: 2, x: 2, y: 2)
            }
            .onAppear {
                withAnimation(Animation.easeIn(duration: 2)) {
                    animation = 1
                }
            }
            
            VStack {
                HStack(alignment: .top , spacing: 0) {
                    Text("Cases")
                        .frame(width: 50, height: 20, alignment: .leading)
                        .font(.system(size: 13, weight: .bold, design: .serif))
                        .foregroundColor(Color.black)
                        .padding(.leading, 2)
                    Text("\(cases.numberFormat())")
                        .frame(width: 66, height: 20, alignment: .trailing)
                        .font(.system(size: 12, weight: .bold, design: .serif))
                        .foregroundColor(Color.black)
                        .padding(.trailing, 2)
                }
                HStack(alignment: .top , spacing: 0) {
                    Text("Deaths")
                        .frame(width: 50, height: 20, alignment: .leading)
                        .font(.system(size: 13, weight: .bold, design: .serif))
                        .foregroundColor(Color.black)
                        .padding(.leading, 2)
                    Text("\(deaths.numberFormat())")
                        .frame(width: 66, height: 20, alignment: .trailing)
                        .font(.system(size: 12, weight: .bold, design: .serif))
                        .foregroundColor(Color.black)
                        .padding(.trailing, 2)
                }
            }
            .background(Color(.systemGray)).opacity(0.8)
            .cornerRadius(4)
            .shadow(color: Color(.black), radius: 2, x: 2, y: 2)
            
        }
        .frame(width: 118, height: 80)
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        OKAnnotation(countryName: "usa", cases: 0, deaths: 0)
            .colorScheme(.light)
            .previewLayout(.sizeThatFits)
    }
}
