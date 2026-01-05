//
//  AboutViewController.swift
//  NeuroSpark
//
//  Created by salchug on 29.05.25.
//

import UIKit

class AboutViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let applogopng = UIImageView()
    private let firstHeader = UILabel()
    private let secondHeader = UILabel()
    private let firstContainer = UIImageView()
    private let secondContainer = UIImageView()
    private let thirdContainer = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "About"
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        setupUI()

    }
    
    private func setupUI() {
        setupScrollView()
        setupNavigation()
        configureAppLogo()
        configureFirstHeader()
        configureSecondHeader()
        configureFirstContainer()
        configureSecondContainer()
        configurThirdContainer()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func configureAppLogo() {
        applogopng.image = UIImage(named: "neurosparkpng")
        applogopng.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(applogopng)
        NSLayoutConstraint.activate([
            applogopng.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            applogopng.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            applogopng.widthAnchor.constraint(equalToConstant: 98),
            applogopng.heightAnchor.constraint(equalToConstant: 108)
        ])
    }
    
    private func configureFirstHeader() {
        firstHeader.text = "Take a step closer to understanding \nyour child’s development"
        firstHeader.textColor = UIColor(hex: "#292929")
        firstHeader.font = UIFont.systemFont(ofSize: 20)
        firstHeader.numberOfLines = 2
        firstHeader.textAlignment = .center
        firstHeader.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(firstHeader)
        NSLayoutConstraint.activate([
            firstHeader.topAnchor.constraint(equalTo: applogopng.bottomAnchor, constant: 5),
            firstHeader.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            firstHeader.widthAnchor.constraint(equalToConstant: 345)
        ])
    }
    
    private func configureSecondHeader() {
        secondHeader.text = "Our app helps parents monitor behavioural and \ncommunication traits- making early detection of \nautism more accessible"
        secondHeader.textColor = UIColor(hex: "#292929")
        secondHeader.font = UIFont.systemFont(ofSize: 15)
        secondHeader.numberOfLines = 3
        secondHeader.textAlignment = .center
        secondHeader.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(secondHeader)
        NSLayoutConstraint.activate([
            secondHeader.topAnchor.constraint(equalTo: firstHeader.bottomAnchor, constant: 13),
            secondHeader.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            secondHeader.widthAnchor.constraint(equalToConstant: 345)
        ])
    }
    
    private func configureFirstContainer() {
        firstContainer.image = UIImage(named: "firstcontainer")
        firstContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(firstContainer)
        NSLayoutConstraint.activate([
            firstContainer.topAnchor.constraint(equalTo: secondHeader.bottomAnchor, constant: 15),
            firstContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            firstContainer.widthAnchor.constraint(equalToConstant: 345),
            firstContainer.heightAnchor.constraint(equalToConstant: 165)
        ])
    }
    
    private func configureSecondContainer() {
        secondContainer.image = UIImage(named: "secondcontainer")
        secondContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(secondContainer)
        NSLayoutConstraint.activate([
            secondContainer.topAnchor.constraint(equalTo: firstContainer.bottomAnchor, constant: 15),
            secondContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            secondContainer.widthAnchor.constraint(equalToConstant: 345),
            secondContainer.heightAnchor.constraint(equalToConstant: 215)
        ])
    }
    
    private func configurThirdContainer() {
        thirdContainer.image = UIImage(named: "thirdcontainer")
        thirdContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(thirdContainer)
        NSLayoutConstraint.activate([
            thirdContainer.topAnchor.constraint(equalTo: secondContainer.bottomAnchor, constant: 15),
            thirdContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            thirdContainer.widthAnchor.constraint(equalToConstant: 345),
            thirdContainer.heightAnchor.constraint(equalToConstant: 165),
            thirdContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22)
        ])
    }
    
    
    
    

}
