//
//  DailyStatsViewModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 3.12.2020.
//

import SwiftUI

final class CountryDetailViewModel: ObservableObject {
    @Published var dailyData: [DailyModel] = []
    
    func getDailyStatsData(for country: String) {
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
        
        return dateDictionary.sorted { $0.0 < $1.0 }
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
