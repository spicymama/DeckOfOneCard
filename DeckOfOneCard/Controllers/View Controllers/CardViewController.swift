//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Gavin Woffinden on 5/4/21.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var drawButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateViews(with: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    func fetchImageAndUpdateViews(with card: Card) {
        
        CardController.fetchImage(for: card) {[weak self] (result) in
            
            DispatchQueue.main.async {
                switch result {
                
                case .success(let image):
                    self?.cardImageView.image = image
                    self?.cardNameLabel.text = "\(card.value) of \(card.suit)"
                    
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
            
    }
    
}
    
    



