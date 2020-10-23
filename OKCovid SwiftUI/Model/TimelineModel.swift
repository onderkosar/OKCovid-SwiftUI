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
