//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var answers: [Answer]!
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        pollResult()
        
    }
    
    
    private func pollResult() {
        
        var resultDictionary = [AnimalType: Int]()
        
        for answer in answers {
            switch answer.type {
            case .cat:
                resultDictionary[.cat, default: 0] += 1
            case .dog:
                resultDictionary[.dog, default: 0] += 1
            case .rabbit:
                resultDictionary[.rabbit, default: 0] += 1
            case .turtle:
                resultDictionary[.turtle, default: 0] += 1
            }
        }
        
        resultDictionary = resultDictionary.filter { $0.value == resultDictionary.values.max() }
        
        if let textLabel = resultDictionary.first?.key.rawValue {
            resultLable.text = String(textLabel)
        }
        definitionLabel.text = resultDictionary.first?.key.definition
    }
}

