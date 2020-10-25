//
//  TimelineModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import Foundation

struct TimelineModel: Codable, Hashable {
    let country: String
    let province: [String]
    let timeline: TimelineInfoModel
}

struct TimelineInfoModel: Codable, Hashable {
    let cases, deaths, recovered: [String: Int]
}

struct TimelineData {
    var country: String
    var casesTimeline: Array<(key: Date, value: Int)>
    var deathsTimeline: Array<(key: Date, value: Int)>
}

struct DailyModel: Hashable {
    let uuid = UUID()

    let dDate: Date
    let dCases: Int
    let dDeaths: Int
}
