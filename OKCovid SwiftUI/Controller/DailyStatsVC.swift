//
//  DailyStatsVC.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 25.10.2020.
//

import SwiftUI

struct DailyStatsVC: View {
    @State var dailyModel = [DailyModel]()
    @State var country: String
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ListCell(textOne: "Date", textTwo: "Cases", textThree: "Deaths", fontSize: 22, fontWeight: .bold, frameWidth: 130)
                    .shadow(color: .secondary, radius: 1, x: 2, y: 2)
                    .padding(.horizontal)
                    .padding(.top, 15)
                List {
                    ForEach(dailyModel, id: \.uuid) { item in
                        ListCell(textOne: "\(item.dDate.convertToMonthYearFormat())", textTwo: "\(item.dCases.numberFormat())", textThree: "\(item.dDeaths.numberFormat())", fontSize: 18, fontWeight: .medium, frameWidth: 130)
                            .foregroundColor(Color(.secondaryLabel))
                    }
                }
                .listStyle(PlainListStyle())
                .onAppear(perform: {
                    downloadTimelineData(for: country)
                })
            }
            .navigationBarTitle(country + " " + "Daily Stats", displayMode: .inline)
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
            self.dailyModel.append(.init(dDate: timelineData.casesTimeline[i].key, dCases: timelineData.casesTimeline[i].value - timelineData.casesTimeline[i-1].value, dDeaths: timelineData.deathsTimeline[i].value - timelineData.deathsTimeline[i-1].value))
        }
        
        var reversedNames   = [DailyModel]()

        for name in dailyModel {
            reversedNames.insert(name, at: 0)
        }
        
        self.dailyModel     = reversedNames
    }
}

struct DailyStatsVC_Previews: PreviewProvider {
    static var previews: some View {
        DailyStatsVC(country: "USA")
    }
}
