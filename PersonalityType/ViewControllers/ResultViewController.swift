//
//  ResultViewController.swift
//  PersonalityType
//
//  Created by user on 20/03/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var selectedAnswers : [Answer]?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Результат"
        navigationItem.hidesBackButton = true
        
        configure()

    }
    
    // MARK: --Methods
    
    func configure() {
        guard let selectedAnswers = selectedAnswers else { return }
        
        guard let yourType = ResultManager.calculateResult(for: selectedAnswers) else {
            titleLabel.text = "Что то пошло не так :("
            descriptionLabel.text = "Попробуйте еще раз"
            return
        }
        
        titleLabel.text = "Вы — \(yourType.rawValue)!"
        descriptionLabel.text = yourType.description
    }

}
