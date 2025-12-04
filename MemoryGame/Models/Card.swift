//
//  Card.swift
//  MemoryGame
//
//  Created by kancelarijazamlade Vranje on 23.11.23..
//

import Foundation

struct Card: Identifiable, Equatable {
    let id = UUID()
    let symbol: String
    var isFlipped = false
    var isMatched = false
}
