//
//  LoginViewController.swift
//  NeuroSpark
//
//  Created by salchug on 12.05.25.
//

import UIKit

class MainViewController: UIViewController {
    
    let childpng = UIImageView(image: UIImage(named: "child.png"))
    let welcomeText = UILabel()
    let descripText = UILabel()
    let createButton = UIButton()
    let loginButoon = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        configureUI()
    }
    
    func configureUI() {
        configureChildPng()
        configureWelcomeText()
        configureDescripText()
        configureCreateButton()
        configureLoginButton()
    }

    func configureChildPng() {
        childpng.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childpng)
        
        NSLayoutConstraint.activate([
            childpng.topAnchor.constraint(equalTo: view.topAnchor, constant: 107),
            childpng.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            childpng.widthAnchor.constraint(equalToConstant: 344),
            childpng.heightAnchor.constraint(equalToConstant: 397)
        ])
    }
    
    func configureWelcomeText() {
        welcomeText.text = "Welcome!"
        welcomeText.textAlignment = .center
        welcomeText.textColor = UIColor(hex: "#292929")
        welcomeText.font = UIFont.boldSystemFont(ofSize: 38)
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeText)
        NSLayoutConstraint.activate([
            welcomeText.topAnchor.constraint(equalTo: view.topAnchor, constant: 474),
            welcomeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configureDescripText() {
        descripText.text = "See the early signs, understand the silent\nsignals, and take the right steps with\nconfidence."
        descripText.textAlignment = .center
        descripText.numberOfLines = 3
        descripText.textColor = UIColor(hex: "#515151")
        descripText.font = UIFont.systemFont(ofSize: 15)
        descripText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(descripText)
        NSLayoutConstraint.activate([
            descripText.topAnchor.constraint(equalTo: view.topAnchor, constant: 538),
            descripText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descripText.widthAnchor.constraint(equalToConstant: 344)
        ])
    }
    
    func configureCreateButton() {
        createButton.setTitle("Create Account", for: .normal)
        createButton.backgroundColor = UIColor(hex: "#3B82F6")
        createButton.layer.cornerRadius = 8
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(createButton)
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 662),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.widthAnchor.constraint(equalToConstant: 344),
            createButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        createButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    @objc func handleRegister() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.createButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.createButton.transform = CGAffineTransform.identity
                           }
                       })
        
        let createAccVC = CreateAccViewController()
        navigationController?.pushViewController(createAccVC, animated: true)
    }
    
    func configureLoginButton() {
        loginButoon.setTitle("Already have account? Log in", for: .normal)
        loginButoon.setTitleColor(UIColor(hex: "#3B82F6"), for: .normal)
        loginButoon.layer.borderWidth = 1
        loginButoon.layer.borderColor = UIColor(hex: "#3B82F6")?.cgColor
        loginButoon.layer.cornerRadius = 8
        loginButoon.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginButoon)
        NSLayoutConstraint.activate([
            loginButoon.topAnchor.constraint(equalTo: view.topAnchor, constant: 723),
            loginButoon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButoon.widthAnchor.constraint(equalToConstant: 344),
            loginButoon.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        loginButoon.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    @objc private func handleLogin() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.loginButoon.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.loginButoon.transform = CGAffineTransform.identity
                           }
                       })
        
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
}
