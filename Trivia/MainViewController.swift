import UIKit

class MainViewController: UIViewController {
    var index = 0
    let networker = Networker()
    var questions: [Question] = []

    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionType: UILabel!
    @IBOutlet weak var questionContainer: UILabel!
    @IBOutlet weak var answer: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Call the method to fetch questions when the view loads
        refresh(self)
    }

    @IBAction func answerBtn(_ sender: Any) {
        index = (index + 1) % 5
        updateQuestion(index: index)
    }

    @IBAction func answer2Btn(_ sender: Any) {
        index = (index + 1) % 5
        updateQuestion(index: index)
    }

    @IBAction func answer3Btn(_ sender: Any) {
        index = (index + 1) % 5
        updateQuestion(index: index)
    }

    @IBAction func answer4Btn(_ sender: Any) {
        index = (index + 1) % 5
        updateQuestion(index: index)
    }

    @IBAction func refresh(_ sender: Any) {
        // Call the networker to fetch new questions
        networker.getQuestions { [weak self] (json, error) in
            guard let self = self else { return }

            if let error = error {
                print(error)
                return
            }
            
            // Update the questions and UI elements with the new data
            self.questions = json?.results ?? []
            DispatchQueue.main.async {
                self.updateQuestion(index: 0) // Update with the first question after refreshing
            }
        }
    }

    func updateQuestion(index: Int) {
        questionNumber.text = "Question: \(index + 1)/5"
        
        // Decode HTML entities in the question text
        let questionText = decodeHTMLString(questions[index].question)
        self.questionContainer.text = questionText
        
        self.questionContainer.numberOfLines = 0
        self.questionType.text = questions[index].category
        self.answer.setTitle(questions[index].correct_answer, for: .normal)
        self.answer2.setTitle(questions[index].incorrect_answers[0], for: .normal)
        self.answer3.setTitle(questions[index].incorrect_answers[1], for: .normal)
        self.answer4.setTitle(questions[index].incorrect_answers[2], for: .normal)
    }
    
    // Function to decode HTML entities in a string
    func decodeHTMLString(_ htmlString: String) -> String {
        guard let data = htmlString.data(using: .utf8) else { return htmlString }
        guard let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else { return htmlString }
        return attributedString.string
    }
}
