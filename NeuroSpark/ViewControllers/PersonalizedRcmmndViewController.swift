//
//  PersonalizedRcmmndViewController.swift
//  NeuroSpark
//
//  Created by salchug on 25.05.25.
//

import UIKit

class PersonalizedRcmmndViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let pageLabel = UILabel()
    private let childpfp = UIImageView()
    private let autismLabel = UILabel()
    private let autismSummary = UIImageView()
    private let firstRec = UIImageView()
    private let secondRec = UIImageView()
    private let thirdRec = UIImageView()
    private let fourthRec = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        setupScrollView()
        setupUI()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupUI() {
        setupNavigation()
        configurePageLabel()
        configureChildpfp()
        configureAutismLabel()
        configureAutismSummary()
        configureFirstRec()
        configureSecondRec()
        configureThirdRec()
        configureFourthRec()
    }
    
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func configurePageLabel() {
        pageLabel.text = "Personalized \nRecommendation"
        pageLabel.numberOfLines = 2
        pageLabel.textAlignment = .center
        pageLabel.font = UIFont.systemFont(ofSize: 20)
        pageLabel.textColor = UIColor(hex: "#1C1B1B")
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(pageLabel)
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            pageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func configureChildpfp() {
        childpfp.image = UIImage(named: "childpfp")
        childpfp.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(childpfp)
        NSLayoutConstraint.activate([
            childpfp.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 19),
            childpfp.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 43),
            childpfp.widthAnchor.constraint(equalToConstant: 85),
            childpfp.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    private func configureAutismLabel() {
        autismLabel.text = "Autism diagnosis"
        autismLabel.numberOfLines = 2
        autismLabel.textAlignment = .center
        autismLabel.font = UIFont.systemFont(ofSize: 16)
        autismLabel.textColor = UIColor(hex: "#1C1B1B")
        autismLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(autismLabel)
        NSLayoutConstraint.activate([
            autismLabel.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 34),
            autismLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 149)
        ])
    }
    
    private func configureAutismSummary() {
        autismSummary.image = UIImage(named: "autismsummary")
        autismSummary.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(autismSummary)
        NSLayoutConstraint.activate([
            autismSummary.topAnchor.constraint(equalTo: autismLabel.bottomAnchor, constant: 12),
            autismSummary.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 143),
            autismSummary.widthAnchor.constraint(equalToConstant: 169),
            autismSummary.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
   
    private func configureFirstRec() {
        firstRec.image = UIImage(named: "rectone")
        firstRec.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(firstRec)
        NSLayoutConstraint.activate([
            firstRec.topAnchor.constraint(equalTo: childpfp.bottomAnchor, constant: 12),
            firstRec.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            firstRec.widthAnchor.constraint(equalToConstant: 345),
            firstRec.heightAnchor.constraint(equalToConstant: 159)
        ])
    }
    
    private func configureSecondRec() {
        secondRec.image = UIImage(named: "recttwo")
        secondRec.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(secondRec)
        NSLayoutConstraint.activate([
            secondRec.topAnchor.constraint(equalTo: firstRec.bottomAnchor, constant: 12),
            secondRec.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            secondRec.widthAnchor.constraint(equalToConstant: 345),
            secondRec.heightAnchor.constraint(equalToConstant: 159)
        ])
    }
    
    private func configureThirdRec() {
        thirdRec.image = UIImage(named: "rectthree")
        thirdRec.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(thirdRec)
        NSLayoutConstraint.activate([
            thirdRec.topAnchor.constraint(equalTo: secondRec.bottomAnchor, constant: 12),
            thirdRec.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            thirdRec.widthAnchor.constraint(equalToConstant: 345),
            thirdRec.heightAnchor.constraint(equalToConstant: 159)
        ])
    }
    
    private func configureFourthRec() {
        fourthRec.image = UIImage(named: "rectfour")
        fourthRec.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(fourthRec)
        NSLayoutConstraint.activate([
            fourthRec.topAnchor.constraint(equalTo: thirdRec.bottomAnchor, constant: 12),
            fourthRec.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            fourthRec.widthAnchor.constraint(equalToConstant: 345),
            fourthRec.heightAnchor.constraint(equalToConstant: 159),
            fourthRec.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40) // Important for scroll height
        ])
    }
}

