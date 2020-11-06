//
//  CountryView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import SwiftUI

struct CountryCardView: View {
    var countryModel: CountryModel
    var countryIso: String
    
    @State private var presentVC: Bool = false
    
    var body: some View {
        ZStack {
            VStack() {
                HStack {
                    Image(countryIso)
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                        .shadow(color: Color(.darkGray), radius: 1, x: 2, y: 2)
                    Spacer()
                    Text(countryModel.countryName)
                        .font(.system(.title2, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color(.darkText))
                        .padding(5)
                        .padding(.trailing, 15)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .shadow(color: Color(.darkGray), radius: 1, x: 0.7, y: 0.7)
                }
                .padding(.horizontal, 8)
                VStack(alignment: .center, spacing: 20) {
                    HStack() {
                        OKStatCard(title: "Cases", subTitle: "\(countryModel.cases.numberFormat())")
                            .padding(.leading, 5)
                
                        Spacer()
                        
                        OKStatCard(title: "Deaths", subTitle: "\(countryModel.deaths.numberFormat())")
                            .padding(.trailing, 5)
                    }
                    
                    HStack() {
                        OKStatCard(title: "Active", subTitle: "\(countryModel.active.numberFormat())")
                            .padding(.leading, 5)
                        
                        Spacer()
                        
                        OKStatCard(title: "Recovered", subTitle: "\(countryModel.recovered.numberFormat())")
                            .padding(.trailing, 5)
                    }
                    
                }
                .padding(.top, 5)
            }
        }
        .frame(width: 340, height: 340, alignment: .center)
        .background(Color(.systemGray))
        .onTapGesture {
            self.presentVC = true
        }
        .sheet(isPresented: self.$presentVC) {
            DailyStatsVC(country: countryModel.country)
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryCardView(countryModel: CountryModel(country: "USA", countryInfo: CountryInfo(_id: 0, flag: "", iso2: "", iso3: "", lat: 0, long: 0), population: 0, updated: 0, tests: 0, cases: 0, active: 0, deaths: 0, recovered: 0), countryIso: "usa")
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}
