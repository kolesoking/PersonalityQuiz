//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var whatAnimal: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whatAnimal.text = "Вы - \(returnEmoji())"
        animalDescription.text = returnDescription()
        
        navigationItem.hidesBackButton = true
    }
}
extension ResultViewController {
    private func chooseMoreOften() -> Animal {
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
    
        for answer in answersChosen {
            switch answer.animal {
            case .dog:
                dog += 1
            case .cat:
                cat += 1
            case .rabbit:
                rabbit += 1
            case .turtle:
                turtle += 1
            }
        }
        
        if dog >= cat && dog >= rabbit && dog >= turtle {
            return Animal.dog
        } else if cat >= dog && cat >= rabbit && cat >= turtle {
            return Animal.cat
        } else if rabbit >= dog && rabbit >= cat && rabbit >= turtle {
            return Animal.rabbit
        } else {
            return Animal.turtle
        }
        
    }
    
    private func returnEmoji() -> Animal.RawValue {
        switch chooseMoreOften() {
        case .dog:
            return Animal.dog.rawValue
        case .cat:
            return Animal.cat.rawValue
        case .rabbit:
            return Animal.rabbit.rawValue
        case .turtle:
            return Animal.turtle.rawValue
        }
    }
    
    private func returnDescription() -> String {
        switch chooseMoreOften() {
        case .dog:
            return Animal.dog.definition
        case .cat:
            return Animal.cat.definition
        case .rabbit:
            return Animal.rabbit.definition
        case .turtle:
            return Animal.turtle.definition
        }
    }
}


