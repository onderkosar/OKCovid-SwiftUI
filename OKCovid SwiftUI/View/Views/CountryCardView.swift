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
                    VStack {
                        Text(countryModel.countryName)
                            .font(.system(.title2, design: .serif))
                            .fontWeight(.bold)
                            .foregroundColor(Color(.darkText))
                            .padding(5)
                            .padding(.trailing, 15)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .shadow(color: Color(.darkGray), radius: 1, x: 0.7, y: 0.7)
                        Text("Population\n" + "\(countryModel.population.numberFormat())")
                            .font(.system(size: 17, design: .serif))
                            .fontWeight(.light)
                            .foregroundColor(Color(.lightText))
                            .padding(.trailing, 15)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .shadow(color: Color(.darkGray), radius: 1, x: 0.7, y: 0.7)
                        
                    }
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
        .onTapGesture {
            self.presentVC = true
        }
        .sheet(isPresented: self.$presentVC) {
            AboutCountryVC(country: countryModel.country, countryModel: countryModel)
        }
    }
    
    func statOfCases() -> String {
        if countryModel.cases == 0 {
            return "N/A\n"
        } else {
            return "\(countryModel.cases.numberFormat())\n" + "\(((Double(countryModel.cases) * 100) / Double(countryModel.population)).rounded(by: 2))% of the population"
        }
    }
    
    func statOfDeaths() -> String {
        if countryModel.deaths == 0 {
            return "N/A\n"
        } else {
            return "\(countryModel.deaths.numberFormat())\n" + "\(((Double(countryModel.deaths) * 100) / Double(countryModel.cases)).rounded(by: 2))% of total cases"
        }
    }
    
    func statOfActive() -> String {
        if countryModel.recovered == 0 {
            return "N/A\n"
        } else {
            return "\(countryModel.active.numberFormat())\n" + "\(((Double(countryModel.active) * 100) / Double(countryModel.population)).rounded(by: 2))% of the population"
        }
    }
    
    func statOfRocovered() -> String {
        if countryModel.recovered == 0 {
            return "N/A\n"
        } else {
            return "\(countryModel.recovered.numberFormat())\n" + "\(((Double(countryModel.recovered) * 100) / Double(countryModel.cases)).rounded(by: 2))% of total cases"
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryCardView(countryModel: CountryModel(country: "USA", countryInfo: CountryInfo(_id: 0, flag: "", iso2: "", iso3: "", lat: 0, long: 0), population: 331679824, updated: 0, tests: 0, cases: 9934653, active: 3351368, deaths: 241098, recovered: 6342187), countryIso: "usa")
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}
