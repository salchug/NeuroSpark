//
//  BehaviourQuestionViewController.swift
//  NeuroSpark
//
//  Created by salchug on 24.05.25.
//


import UIKit


let behaviourQuestions: [String] = [
    "1. Does your child have difficulty making eye contact?",
    "2.⁠ ⁠Does your child not respond when called by name?",
    "3.⁠ ⁠Does your child seem uninterested in other people?",
    "4.⁠ ⁠Does your child avoid social games like peek-a-boo or playing with others?",
    "5.⁠ ⁠Does your child perform repetitive movements (e.g., hand-flapping, spinning, or repeatedly turning objects)?",
    "6.⁠ ⁠Has your child started speaking very late or does not speak at all?",
    "7.⁠ ⁠Is your child very sensitive to changes in routine?",
    "8.⁠ ⁠Does your child have difficulty understanding other people's feelings or facial expressions?",
    "9.⁠ ⁠Does your child use toys or objects in unusual ways (e.g., lining them up instead of playing)?",
    "10.⁠ ⁠Does your child use fewer gestures like pointing or waving?",
    "11.⁠ ⁠Is your child overly sensitive or indifferent to sounds, lights, or other sensory inputs?",
    "12.⁠ ⁠Does your child have trouble following someone’s gaze or understanding what others are looking at?"
    
]

class BehaviourQuestionViewController: UIViewController {
    
    var currentQuestionIndex: Int = 0
    var answers: BehaviourAnswers = BehaviourAnswers()
    
    private let container = UIView()
    private let questionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        setupNavigation()
        setupUI()
        showQuestion()
    }
    
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
    }

    private func setupUI() {
        let pageLabel = UILabel()
        pageLabel.text = "Behaviour Analysis"
        pageLabel.textColor = UIColor(hex: "#1C1B1B")
        pageLabel.font = UIFont.systemFont(ofSize: 24)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageLabel)
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 105),
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        container.backgroundColor = UIColor(hex: "#E3E6FD")
        container.layer.cornerRadius = 18
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.widthAnchor.constraint(equalToConstant: 346),
            container.heightAnchor.constraint(equalToConstant: 476)
        ])
        
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: 22)
        questionLabel.textColor = UIColor(hex: "#27638D")
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 57),
            questionLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10),
            questionLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10)
        ])
        
        addAnswerButtons()
        
        addProgressBar()
    }
    
    private func addAnswerButtons() {
        let answerTypes: [(String, BehaviourAnswer)] = [
            ("yesanswerbutton", .yes),
            ("noanswerbutton", .no),
            ("sometimesanswerbutton", .sometimes)
        ]
        
        for (i, (imageName, answerType)) in answerTypes.enumerated() {
            let button = UIButton()
            button.setImage(UIImage(named: imageName), for: .normal)
            button.tag = i
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addAction(UIAction(handler: { [weak self] _ in
                self?.submitAnswer(answerType)
            }), for: .touchUpInside)
            container.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: container.topAnchor, constant: CGFloat(198 + i * 85)),
                button.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 17),
                button.widthAnchor.constraint(equalToConstant: 312),
                button.heightAnchor.constraint(equalToConstant: 58)
            ])
        }
    }
    
    private func addProgressBar() {
        let progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.layer.cornerRadius = 10
        progressBar.clipsToBounds = true
        progressBar.trackTintColor = UIColor(hex: "#E3E6FD")
        progressBar.progressTintColor = UIColor(hex: "#055DB5")
        progressBar.setProgress(Float(currentQuestionIndex + 1) / Float(behaviourQuestions.count), animated: false)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBar)
        
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 34),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.widthAnchor.constraint(equalToConstant: 345),
            progressBar.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func showQuestion() {
        if currentQuestionIndex < behaviourQuestions.count {
            questionLabel.text = behaviourQuestions[currentQuestionIndex]
        }
    }

    private func submitAnswer(_ answer: BehaviourAnswer) {
        var updatedAnswers = answers
        updatedAnswers.answers.append(answer)
        
        let nextIndex = currentQuestionIndex + 1
        if nextIndex < behaviourQuestions.count {
            let nextVC = BehaviourQuestionViewController()
            nextVC.currentQuestionIndex = nextIndex
            nextVC.answers = updatedAnswers
            navigationController?.pushViewController(nextVC, animated: true)
        } else {
            let resultVC = QuestionResultViewController()
            resultVC.answers = updatedAnswers
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }

    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
