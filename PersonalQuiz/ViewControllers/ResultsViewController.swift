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
        //print(answers.count)
        self.navigationItem.hidesBackButton = true
        
        pollResult()
        
    }
    
    
    
    private func pollResult() {

        var resultDic = [AnimalType: Int]()
        
        for answer in answers {
            switch answer.type {
            case .cat:
                resultDic[.cat, default: 0] += 1
            case .dog:
                resultDic[.dog, default: 0] += 1
            case .rabbit:
                resultDic[.rabbit, default: 0] += 1
            case .turtle:
                resultDic[.turtle, default: 0] += 1
            }
        }
        print(resultDic.count)
        resultDic = resultDic.filter { $0.value == resultDic.values.max() }
        print(resultDic)
        resultLable.text = String((resultDic.first?.key.rawValue)!)
        definitionLabel.text = resultDic.first?.key.definition
    }

}

