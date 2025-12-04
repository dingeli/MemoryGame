//
//  CardView.swift
//  MemoryGame
//
//  Created by kancelarijazamlade Vranje on 23.11.23..
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        content
            .aspectRatio(2/3, contentMode: .fit)
            .foregroundStyle(.cardBeckround)
    }
    private var content:some View {
        ZStack {
            if card.isFlipped {
                flippedCard
            }
            else {
                closedCard
            }
        }
        .opacity(card.isMatched ? 0 : 1)
    }
    private var flippedCard: some View {
        Group {
            rect
                .fill().foregroundColor(
                    .cardForeground)
            rect
                .stroke(lineWidth: 2)
            Text(card.symbol)
                .scaleEffect(2)
        }
    }
    private var closedCard: some View {
        rect.fill()
    }
    
    private var rect: RoundedRectangle {
        RoundedRectangle(cornerRadius: 16)
    }
}


#Preview {
    let card = Card(symbol: "🪿")
    
    return CardView(card: card)
        .padding()
}
