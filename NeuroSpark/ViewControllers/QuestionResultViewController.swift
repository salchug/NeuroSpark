//
//  QuestionResultViewController.swift
//  NeuroSpark
//
//  Created by salchug on 25.05.25.
//

import UIKit

class QuestionResultViewController: UIViewController {
    var answers: BehaviourAnswers!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        print("Final Answers:")
        for (index, answer) in answers.answers.enumerated() {
            print("Q\(index + 1): \(answer.rawValue)")
        }

        // You can show the result here or send to server
    }
}

