//
//  Candy.swift
//  00857202_hw4
//
//  Created by User16 on 2020/11/18.
//

import Foundation
struct Candy: Identifiable, Codable {
    var id = UUID()
    var candys: String
    var part_of_speech: Int
    var meaning: String
    var sentence: String
    var isFavor: Bool
}
