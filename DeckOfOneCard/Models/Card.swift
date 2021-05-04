//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Gavin Woffinden on 5/4/21.
//

import Foundation

struct Card: Decodable {
    
    let value: String
    let suit: String
    let image: URL?
    
}
    
    struct TopLevelObject: Decodable {
        
        let cards: [Card]
    
    
}
