//🐥//  ViewController.swift
//  Concentration
//
//  Created by Students on 03.03.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            //flipCard(withEmojii: emojiiChoises[cardNumber], on: sender)
        } else {
            print("choosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices { // return CountableRange of Int
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .systemMint
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .white : .orange
            }
        }
    }
    
    var emojiChoises = ["🐤", "🐞", "🐷", "🐍", "🐙", "🐏", "🐈‍⬛", "🦙", "🐪", "🦓",]
    var emoji = [Int : String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoises.count > 0 {
            let randomIndex = Int( arc4random_uniform(UInt32(emojiChoises.count)) )
            emoji[card.identifier] = emojiChoises.remove(at: randomIndex)
        }
                
        return emoji[card.identifier] ?? "?"
        
        //        if emoji[card.identifier] != nil {
        //            return emoji[card.identifier]!
        //        } else {
        //            return "?"
        //        }

    }
}

