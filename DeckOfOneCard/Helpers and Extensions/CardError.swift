//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by Gavin Woffinden on 5/4/21.
//

import UIKit

enum CardError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    
    var errorDescription: String? {
        
        switch self {
        case .invalidURL:
            return "Unable to reach server"
            
        case .thrownError:
            return "That card does not exist"
            
        case .noData:
            return "The server responded with no data"
            
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
}
