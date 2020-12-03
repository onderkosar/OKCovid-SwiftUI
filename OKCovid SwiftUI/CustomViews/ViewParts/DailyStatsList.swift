//
//  DailyStatsList.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 3.12.2020.
//

import SwiftUI

struct DailyStatsList: View {
    @Binding var dailyData: [DailyModel]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "list.bullet.indent")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Daily Stats")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .padding(.top, 15)
            .padding(.vertical, 2)
            Section(header:
                        OKListRow(textOne: "Date", textTwo: "Cases", textThree: "Deaths", fontSize: 22, fontWeight: .bold, frameWidth: 130)
            ) {
                List {
                    ForEach(dailyData, id: \.uuid) { item in
                        OKListRow(textOne: "\(item.dDate.convertToMonthYearFormat())", textTwo: "\(item.dCases.numberFormat())", textThree: "\(item.dDeaths.numberFormat())", fontSize: 18, fontWeight: .medium, frameWidth: 130)
                            .foregroundColor(Color(.secondaryLabel))
                    }
                    .listRowInsets(EdgeInsets())
                }
                .frame(height: 600, alignment: .top)
            }
            .padding(.horizontal)
            
        }
    }
}

//struct DailyStatsList_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyStatsList()
//    }
//}
