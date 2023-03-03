//🐥//  ViewController.swift
//  Concentration
//
//  Created by Students on 03.03.2023.
//

import UIKit

class ViewController: UIViewController {

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

    var emojiiChoises = ["🐤", "🐞", "🐖", "🐍", "🐙",]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmojii: emojiiChoises[cardNumber], on: sender)
        } else {
            print("choosen card was not in cardButtons")
        }
    }
        
    func flipCard(withEmojii emojii: String, on button: UIButton) {
        if button.currentTitle == emojii {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emojii, for: .normal)
            button.backgroundColor = .systemMint
        }
        
        
    }
}

