//
//  CountryView.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import SwiftUI

struct CountryCardView: View {
    var countryData: CountryModel

    var body: some View {
        ZStack {
            VStack() {
                HStack {
                    Image(countryData.country.lowercased())
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                        .shadow(color: Color(.darkGray), radius: 1, x: 2, y: 2)
                    Spacer()
                    VStack {
                        Text(countryData.countryName)
                            .font(.system(.title2, design: .serif))
                            .fontWeight(.bold)
                            .foregroundColor(Color(.darkText))
                            .padding(5)
                        Text("Population\n" + "\(countryData.population.numberFormat())")
                            .font(.system(size: 17, design: .serif))
                            .fontWeight(.light)
                            .foregroundColor(Color(.label))
                    }
                    .shadow(color: Color(.darkGray), radius: 0.5, x: 0.3, y: 0.3)
                    .padding(.trailing, 15)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                }
                .padding(.horizontal, 8)
                VStack(alignment: .center, spacing: 20) {
                    HStack() {
                        OKStatCard(title: "Cases", subTitle: statOfCases())
                            .padding(.leading, 5)
                        Spacer()
                        OKStatCard(title: "Deaths", subTitle: statOfDeaths())
                            .padding(.trailing, 5)
                    }
                    HStack() {
                        OKStatCard(title: "Active", subTitle: statOfActive())
                            .padding(.leading, 5)
                        Spacer()
                        OKStatCard(title: "Recovered", subTitle: statOfRocovered())
                            .padding(.trailing, 5)
                    }
                }
                .padding(.top, 5)
            }
        }
        .frame(width: 340, height: 340, alignment: .center)
        .background(Color(.systemGray))
        .cornerRadius(13)
    }
    
    func statOfCases() -> String {
        if countryData.cases == 0 {
            return "N/A\n"
        } else {
            return "\(countryData.cases.numberFormat())\n" + "\(((Double(countryData.cases) * 100) / Double(countryData.population)).rounded(by: 2))% of the population"
        }
    }
    
    func statOfDeaths() -> String {
        if countryData.deaths == 0 {
            return "N/A\n"
        } else {
            return "\(countryData.deaths.numberFormat())\n" + "\(((Double(countryData.deaths) * 100) / Double(countryData.cases)).rounded(by: 2))% of total cases"
        }
    }
    
    func statOfActive() -> String {
        if countryData.recovered == 0 {
            return "N/A\n"
        } else {
            return "\(countryData.active.numberFormat())\n" + "\(((Double(countryData.active) * 100) / Double(countryData.population)).rounded(by: 2))% of the population"
        }
    }
    
    func statOfRocovered() -> String {
        if countryData.recovered == 0 {
            return "N/A\n"
        } else {
            return "\(countryData.recovered.numberFormat())\n" + "\(((Double(countryData.recovered) * 100) / Double(countryData.cases)).rounded(by: 2))% of total cases"
        }
    }
}

struct CountryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CountryCardView(countryData: MockData.sampleCountryData)
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}
