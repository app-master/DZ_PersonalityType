//
//  QuestionViewController.swift
//  PersonalityType
//
//  Created by user on 20/03/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    // MARK: --IBOutlets
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleCollectionButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleCollectionLabels: [UILabel]!
    @IBOutlet var multipleCollectionSwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet var rangeCollectionLabels: [UILabel]!
    @IBOutlet weak var rangeSlider: UISlider!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    let questions = Question.loadData()
    var questionIndex = 0
    var selectedAnswers = [Answer]()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }
    
    // MARK: Methods
    
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        
        navigationItem.title = "Вопрос #\(questionIndex + 1) из \(questions.count)"
        
        switch currentQuestion.type {
        
        case .single:
            updateSingleStack(using: currentQuestion)
        case .multiple:
            updateMultipleStack(using: currentQuestion)
        case .range:
            updateRangeStack(using: currentQuestion)
            
        }
        
    }
    
    func updateSingleStack(using question:Question) {
        
        questionLabel.text = question.text
        
        let answers = question.answers
        let minCount = min(question.answers.count, singleCollectionButtons.count)
        
        for i in 0..<minCount {
            let title = answers[i].text
            let button = singleCollectionButtons[i]
            button.setTitle(title, for: [])
        }
        
        questionProgressView.progress = Float(questionIndex + 1) / Float(questions.count)
    
        singleStackView.isHidden = false
        
    }
    
    func updateMultipleStack(using question:Question) {
        
        questionLabel.text = question.text
        
        let answers = question.answers
        let minCount = min(question.answers.count, multipleCollectionLabels.count)
        
        for i in 0..<minCount {
            let text = answers[i].text
            let label = multipleCollectionLabels[i]
            label.text = text
        }
        
        questionProgressView.progress = Float(questionIndex + 1) / Float(questions.count)
        
        multipleStackView.isHidden = false
    }
    
    func updateRangeStack(using question:Question) {
        
        questionLabel.text = question.text
        
        let answers = question.answers
        
        rangeCollectionLabels.first?.text = answers.first?.text
        rangeCollectionLabels.last?.text = answers.last?.text
        
        questionProgressView.progress = Float(questionIndex + 1) / Float(questions.count)
        
        rangeStackView.isHidden = false
    }
    
    // MARK: --Actions
    
    @IBAction func singleTypeButtonPressed(_ sender: UIButton) {
       
        guard let index = singleCollectionButtons.index(of: sender) else { return }
        
       let currentQuestion = questions[questionIndex]
       let answers = currentQuestion.answers
       let currentAnswer = answers[index]
        
       selectedAnswers.append(currentAnswer)
       questionIndex += 1
       updateUI()
        
    }
    
    @IBAction func multipleTypeAnswerPressed(_ sender: UIButton) {
        
        let currentQuestion = questions[questionIndex]
        let answers = currentQuestion.answers
        
        var choosedAnswers = [Answer]()
        
        for (index, value) in multipleCollectionSwitches.enumerated() {
            if !value.isOn {
                continue
            }
            
            let currentAnswer = answers[index]
            choosedAnswers.append(currentAnswer)
            
        }
        
        if choosedAnswers.count == 0 {
            return
        }
        
        selectedAnswers += choosedAnswers
        
        questionIndex += 1
        updateUI()
        
    }
    
    @IBAction func rangeTypeAnswerPressed(_ sender: UIButton) {
        
        let currentQuestion = questions[questionIndex]
        let answers = currentQuestion.answers
        
        let step = Float(rangeSlider.maximumValue) / Float(answers.count)
        
        var less = Float(0)
        var height = step
        
        for i in 0..<answers.count {
            if rangeSlider.value >= less && rangeSlider.value <= height {
                selectedAnswers.append(answers[i])
                break
            }
            less += step
            height += step
        }
        
        performSegue(withIdentifier: "ShowResultID", sender: nil)
        
    }
    
    // MARK: --Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        resultVC.selectedAnswers = selectedAnswers
        
    }
    
    
}
