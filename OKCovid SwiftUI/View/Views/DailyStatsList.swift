//
//  DailyStatsList.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 8.11.2020.
//

import SwiftUI

struct DailyStatsList: View {
    @State var dailyData = [DailyModel]()
    @State var country: String
    
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
                .onAppear(perform: {
                    UITableView.appearance().showsVerticalScrollIndicator = false
                    downloadTimelineData(for: country)
                })
            }
            .padding(.horizontal)
            
        }
    }
    
    func downloadTimelineData(for country: String) {
        NetworkManager.shared.fetch(for: country, ifDaily: true) { (result: TimelineModel) in
            
            let casesDict       = self.convertTimelineData(timeline: result.timeline.cases)
            let deathsDict      = self.convertTimelineData(timeline: result.timeline.deaths)
            let timelineData    = TimelineData(country: result.country, casesTimeline: casesDict, deathsTimeline: deathsDict)
            
            DispatchQueue.main.async {
                self.updateArray(with: timelineData)
            }
        }
    }
    
    func convertTimelineData(timeline: [String: Int]) -> Array<(key: Date, value: Int)> {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MM/dd/yy"
        
        var dateDictionary          = [Date: Int]()
        
        for (key, value) in timeline {
            let date                = dateFormatter.date(from: key)
            dateDictionary[date!]   = value
        }
        let sortedList = dateDictionary.sorted { $0.0 < $1.0 }
        
        return sortedList
    }
    
    func updateArray(with timelineData: TimelineData) {
        for i in 1...timelineData.casesTimeline.count - 1 {
            self.dailyData.append(.init(dDate: timelineData.casesTimeline[i].key, dCases: timelineData.casesTimeline[i].value - timelineData.casesTimeline[i-1].value, dDeaths: timelineData.deathsTimeline[i].value - timelineData.deathsTimeline[i-1].value))
        }
        
        var reversedNames   = [DailyModel]()

        for name in dailyData {
            reversedNames.insert(name, at: 0)
        }
        
        self.dailyData     = reversedNames
    }
}

struct DailyStatsList_Previews: PreviewProvider {
    static var previews: some View {
        DailyStatsList(country: "USA")
            .colorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
