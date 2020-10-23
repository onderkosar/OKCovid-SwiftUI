//
//  WorldModel.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import Foundation

struct WorldModel: Codable, Hashable {
    let population : Int
    let updated : Int
    let cases : Int
    let active : Int
    let deaths : Int
    let recovered : Int
}
