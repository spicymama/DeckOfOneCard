//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Gavin Woffinden on 5/4/21.
//

import UIKit

class CardController {
    
    static func fetchCard(completion: @escaping (Result <Card, CardError>)-> Void) {
        
        guard let url = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1") else {
            return completion(.failure(.invalidURL))
        }
       print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else {return completion(.failure(.noData))}
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                guard let card = topLevelObject.cards.first else {return completion(.failure(.unableToDecode))}
                completion(.success(card))
            } catch {
                completion(.failure(.thrownError(error)))
                print(error)
            }
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError>)-> Void) {
        if let url = card.image {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else {return completion(.failure(.noData))}
            guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            completion(.success(image))
            
        }.resume()
    }
}
}
