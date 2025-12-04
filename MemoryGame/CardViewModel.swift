//
//  CardViewModel.swift
//  MemoryGame
//
//  Created by kancelarijazamlade Vranje on 23.11.23..
//

import Foundation

@Observable
final class CardViewModel {
    
    init() {
        memoryGameModel = MemoryGameModel(numOfPairs: 3)
        memoryGameModel.onEndOfGame = {[weak self] in
            self?.setEndOfGame()
            
        }
    }
    
    //MARK: - Properties
    
    var isShowingalert = false
    
    var cards: [Card] {
        memoryGameModel.cards
    }
    private var memoryGameModel = MemoryGameModel(numOfPairs: 3)
    
    //MARK: Public methods
    
    func initializeGame(with numOfPairs: Int) {
        memoryGameModel.initialize(with: numOfPairs)
    }
    func shuffleCards() {
        memoryGameModel.shuffle()
    }
    func choose(_ card: Card) {
        memoryGameModel.choose(card)
    }
    
    private func setEndOfGame() {
        isShowingalert = true
    }
}
