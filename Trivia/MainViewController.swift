//
//  MainViewController.swift
//  Trivia
//
//  Created by Thu nguyen on 3/13/24.
//

import UIKit

class MainViewController: UIViewController {
    var index = 0;
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionType: UILabel!
    @IBOutlet weak var questionContainer: UILabel!
    @IBOutlet weak var answer: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    let questions = [
        Question(questionType: QuestionType.Entertainment, question: "Which superhero, with the alter ego Wade Wilson and the powers of accelerated healing, was played by Ryan Reynolds in a 2016 film of the same name?", answerList: ["Deadpool", "Black Panther", "Ant-Man", "Hawk"]),
        Question(questionType: QuestionType.Science, question: "What type of scientist studies living plants?", answerList: ["Botanist", "Geologist", "Paleontologist", "Entomologist"]),
        Question(questionType: QuestionType.Travel, question: "This region, famous for its wines, only produces 4% of California’s wines. What is the name of this region?", answerList: ["Napa Valley", "Snake River Valley", "Sonoma", "Los Carneros"])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        questionNumber.text = String(index)
        questionNumber.text = "Question: " + String(index+1) + "/3"
        let questionCode: String
                switch questions[index].questionType {
                    case .Music:
                        questionCode = "Music"
                    case .Science:
                        questionCode = "Science"
                    case .Travel:
                        questionCode = "Travel"
                    case .Entertainment:
                        questionCode = "Entertainment"
                }
        questionType.text = questionCode
        questionContainer.text = questions[index].question
        questionContainer.numberOfLines = 0
        answer.setTitle(questions[index].answerList[0], for: .normal)
        answer2.setTitle(questions[index].answerList[1], for: .normal)
        answer3.setTitle(questions[index].answerList[2], for: .normal)
        answer4.setTitle(questions[index].answerList[3], for: .normal)
     
    }
    
    @IBAction func answerBtn(_ sender: Any) {
        
        index = (index+1)%3
        updateQuestion(index: index)
    }
    
    @IBAction func answer2Btn(_ sender: Any) {
        index = (index+1)%3
        updateQuestion(index: index)
    }
    
    @IBAction func answer3Btn(_ sender: Any) {
        index = (index+1)%3
        updateQuestion(index: index)
    }
    
    @IBAction func answer4Btn(_ sender: Any) {
        index = (index+1)%3
        updateQuestion(index: index)
    }
    
    
    func updateQuestion(index: Int){
        questionNumber.text = "Question: " + String(index+1) + "/3"
        let questionCode: String
                switch questions[index].questionType {
                    case .Music:
                        questionCode = "Music"
                    case .Science:
                        questionCode = "Science"
                    case .Travel:
                        questionCode = "Travel"
                    case .Entertainment:
                        questionCode = "Entertainment"
                }
        questionType.text = questionCode
        questionContainer.text = questions[index].question
        answer.setTitle(questions[index].answerList[0], for: .normal)
        answer2.setTitle(questions[index].answerList[1], for: .normal)
        answer3.setTitle(questions[index].answerList[2], for: .normal)
        answer4.setTitle(questions[index].answerList[3], for: .normal)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
