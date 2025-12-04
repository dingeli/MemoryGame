//
//  ContentView.swift
//  MemoryGame
//
//  Created by kancelarijazamlade Vranje on 14.11.23..
//

import SwiftUI

struct MemoryGameView: View {
    @State private var viewModel = CardViewModel()
    private let items = [GridItem(), GridItem(), GridItem()]
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            HStack(spacing: 24){
                shuffleButton
                menu
            }
            
            cardGrid
                .animation(.smooth, value: viewModel.cards)
        }
        
        .padding()
        .alert(isPresented: $viewModel.isShowingalert) {
            Alert(title: Text("Well Done"), message: Text("You did good job!"))
        }
    }
    
    //MARK: Propertiews
    
private var shuffleButton: some View {
    Button(action: {viewModel.shuffleCards() }, label: {
        Text("Shuffle 🔄")
            .foregroundStyle(.green)
            .padding()
    })
    .overlay{
        RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 2)
            .foregroundStyle(.green)
    }
}
    
    private var menu: some View {
        Menu("Select number of pairs") {
            Button("3", action: {viewModel.initializeGame(with: 3)})
            
            Button("4", action: {viewModel.initializeGame(with: 4)})
            
            Button("5", action: {viewModel.initializeGame(with: 5)})
            
            Button("6", action: {viewModel.initializeGame(with: 6)})
        }
    }
    
    private var cardGrid: some View {
        LazyVGrid(columns: items ) {
            
            ForEach(viewModel.cards) {card in
                CardView(card: card)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity )
        .scrollIndicators(.hidden)
    }
}
#Preview {
    MemoryGameView()
}


