//
//  MemoryGameModel.swift
//  MemoryGame
//
//  Created by kancelarijazamlade Vranje on 28.11.23..
//

import Foundation
struct MemoryGameModel {
    //MARK: - Properties
    
    var onEndOfGame:()->() = {}
    
    private(set) var cards = [Card]()
    
    private var isEndOfGame: Bool {
        cards.allSatisfy{card in
            card.isMatched
        }
    }
    private let setOfSymbols = ["🐥","🐨","🐼","🐹","🐻‍❄️","🐙"]
    private var indexOfFlippedCard: Int?
    
    //MARK: - Init
    
    init(numOfPairs: Int) {
        setCards(of: numOfPairs)
    }
    //MARK: Public metods
    
    mutating func initialize(with numOfPairs: Int) {
        self = MemoryGameModel(numOfPairs: numOfPairs)
    }
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        guard let choosedCardindex = cards.firstIndex(of: card) else { return }
        guard choosedCardindex != indexOfFlippedCard else { return }
        
        let choosedCard = cards[choosedCardindex]
        guard !choosedCard.isMatched && !choosedCard.isFlipped else { return }
        
        if let flipedCardIndex = indexOfFlippedCard {
            if choosedCard.symbol == cards[flipedCardIndex].symbol {
                cards[choosedCardindex].isMatched = true
                cards[flipedCardIndex].isMatched = true
                
                if isEndOfGame {
                    onEndOfGame()
                }
            }
            indexOfFlippedCard = nil
        }
        else {
            for index in 0..<cards.count {
                cards[index].isFlipped = false
            }
            indexOfFlippedCard = choosedCardindex
        }
        cards[choosedCardindex].isFlipped = true

    }
    
    //MARK: Private methods
    
    private mutating func setCards(of numOfPairs: Int) {
        for index in 0..<numOfPairs {
           let symbol = setOfSymbols[index]
            cards.append(Card(symbol: symbol))
            cards.append(Card(symbol: symbol))
            
        }
    }
}
