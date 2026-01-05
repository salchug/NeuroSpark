//
//  ProfileViewController.swift
//  NeuroSpark
//
//  Created by salchug on 22.05.25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let applogo = UIImageView()
    private let profInfoText = UILabel()
    private let container = UIView()
    private let nameField = UITextField()
    private let nameText = UILabel()
    private let emailField = UITextField()
    private let emailText = UILabel()
    private let passwordText = UILabel()
    private let passwordField = UITextField()
    private let phoneField = UITextField()
    private let phoneText = UILabel()
    private let countryButton = UIButton()
    private let countryText = UILabel()
    
    private let saveButton = UIButton()




    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        setupUI()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    private func setupUI() {
        appLogo()
        configureprofInfoText()
        mainContainer()
        configureNameField()
        configureNameText()
        configureEmailField()
        configureEmailText()
        configurePasswordField()
        configurePasswordText()
        configurePhoneField()
        configurePhoneText()
        configureCountryField()
        configureCountryText()
        configureSaveButton()
    }

    private func appLogo() {
        applogo.image = UIImage(named: "neurosparkpng")
        applogo.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(applogo)
        NSLayoutConstraint.activate([
            applogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 89),
            applogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applogo.widthAnchor.constraint(equalToConstant: 100),
            applogo.heightAnchor.constraint(equalToConstant: 114)
        ])
        
    }
    
    private func configureprofInfoText() {
        profInfoText.text = "Profile Information"
        profInfoText.textColor = UIColor(hex: "#1C1B1B")
        profInfoText.textAlignment = .center
        profInfoText.font = UIFont.systemFont(ofSize: 20)
        profInfoText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profInfoText)
        NSLayoutConstraint.activate([
            profInfoText.topAnchor.constraint(equalTo: view.topAnchor, constant: 239),
            profInfoText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    private func mainContainer() {
        container.backgroundColor = UIColor(hex: "#D2E7FB")?.withAlphaComponent(0.5)
        container.layer.cornerRadius = 20
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        
      //  let topConstant: CGFloat = UIScreen.main.bounds.width <= 375 ? 100 : 130

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 240),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            container.heightAnchor.constraint(equalToConstant: 567)
        ])
    }
    
    private func configureNameText() {
         nameText.text = "Full Name"
         nameText.textColor = UIColor(hex: "#292929")
         nameText.font = UIFont.boldSystemFont(ofSize: 10)
         nameText.textAlignment = .left
         nameText.translatesAutoresizingMaskIntoConstraints = false
         
        view.addSubview(nameText)
        NSLayoutConstraint.activate([
            nameText.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -6),
            nameText.leftAnchor.constraint(equalTo: nameField.leftAnchor, constant: 4)
        ])
     }
     
    
    private func configureNameField() {
         nameField.placeholder = "Enter your full name"
         nameField.layer.borderWidth = 1
         nameField.layer.cornerRadius = 8
         nameField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
         nameField.setPadding(left: 40)
         nameField.translatesAutoresizingMaskIntoConstraints = false
         
         let iconImageView = UIImageView(image: UIImage(systemName: "person"))
         iconImageView.tintColor = .gray
         iconImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
         iconImageView.contentMode = .scaleAspectFit
         
         let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
         iconContainerView.addSubview(iconImageView)
         iconImageView.center = iconContainerView.center
         nameField.leftView = iconContainerView
         nameField.leftViewMode = .always
         
        view.addSubview(nameField)
         NSLayoutConstraint.activate([
             nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 365),
             nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             nameField.widthAnchor.constraint(equalToConstant: 345),
             nameField.heightAnchor.constraint(equalToConstant: 40)
         ])
     }
    
    private func configureEmailText() {
         emailText.text = "Your Email"
         emailText.textColor = UIColor(hex: "#292929")
         emailText.font = UIFont.boldSystemFont(ofSize: 10)
         emailText.textAlignment = .left
         emailText.translatesAutoresizingMaskIntoConstraints = false
         
        view.addSubview(emailText)
        NSLayoutConstraint.activate([
            emailText.bottomAnchor.constraint(equalTo: emailField.topAnchor, constant: -6),
            emailText.leftAnchor.constraint(equalTo: emailField.leftAnchor, constant: 4)
        ])
     }
     
    
    private func configureEmailField() {
         emailField.placeholder = "Enter your mail address"
         emailField.keyboardType = .emailAddress
         emailField.layer.borderWidth = 1
         emailField.layer.cornerRadius = 8
         emailField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
         emailField.setPadding(left: 40)
         emailField.translatesAutoresizingMaskIntoConstraints = false
         
         let iconImageView = UIImageView(image: UIImage(systemName: "envelope"))
         iconImageView.tintColor = .gray
         iconImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
         iconImageView.contentMode = .scaleAspectFit
         
         let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
         iconContainerView.addSubview(iconImageView)
         iconImageView.center = iconContainerView.center
        emailField.leftView = iconContainerView
        emailField.leftViewMode = .always
         
        view.addSubview(emailField)
         NSLayoutConstraint.activate([
             emailField.topAnchor.constraint(equalTo: view.topAnchor, constant: 442),
             emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             emailField.widthAnchor.constraint(equalToConstant: 345),
             emailField.heightAnchor.constraint(equalToConstant: 40)
         ])
     }
    
    func configurePasswordText() {
        passwordText.text = "Your Password"
        passwordText.textColor = UIColor(hex: "#292929")
        passwordText.font = UIFont.boldSystemFont(ofSize: 10)
        passwordText.textAlignment = .left
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(passwordText)
        NSLayoutConstraint.activate([
            passwordText.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -6),
            passwordText.leftAnchor.constraint(equalTo: passwordField.leftAnchor, constant: 4)
        ])
    }
    
    func configurePasswordField() {
        passwordField.placeholder = "Enter your password"
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 8
        passwordField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        passwordField.setPadding(left: 40)
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        let lockImageView = UIImageView(image: UIImage(systemName: "lock"))
        lockImageView.tintColor = .gray
        lockImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        lockImageView.contentMode = .scaleAspectFit
        
        let lockContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        lockContainerView.addSubview(lockImageView)
        lockImageView.center = lockContainerView.center
        passwordField.leftView = lockContainerView
        passwordField.leftViewMode = .always
        
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 20)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        let eyeContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        eyeContainerView.addSubview(eyeButton)
        eyeButton.center = eyeContainerView.center
        passwordField.rightView = eyeContainerView
        passwordField.rightViewMode = .always
        
        view.addSubview(passwordField)
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: view.topAnchor, constant: 519),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 345),
            passwordField.heightAnchor.constraint(equalToConstant: 37)
        ])
    }
    
    @objc func togglePasswordVisibility() {
        passwordField.isSecureTextEntry.toggle()
        
        if let eyeButton = passwordField.rightView?.subviews.first as? UIButton {
            let iconName = passwordField.isSecureTextEntry ? "eye.slash" : "eye"
            eyeButton.setImage(UIImage(systemName: iconName), for: .normal)
        }
        
    }
    
    private func configurePhoneText() {
         phoneText.text = "Your Number"
         phoneText.textColor = UIColor(hex: "#292929")
         phoneText.font = UIFont.boldSystemFont(ofSize: 10)
         phoneText.textAlignment = .left
         phoneText.translatesAutoresizingMaskIntoConstraints = false
         
        view.addSubview(phoneText)
        NSLayoutConstraint.activate([
            phoneText.bottomAnchor.constraint(equalTo: phoneField.topAnchor, constant: -6),
            phoneText.leftAnchor.constraint(equalTo: phoneField.leftAnchor, constant: 4)
        ])
     }
     
    
    private func configurePhoneField() {
         phoneField.placeholder = "Enter your number"
         phoneField.keyboardType = .numberPad
         phoneField.layer.borderWidth = 1
         phoneField.layer.cornerRadius = 8
         phoneField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
         phoneField.setPadding(left: 40)
         phoneField.translatesAutoresizingMaskIntoConstraints = false
         
         let iconImageView = UIImageView(image: UIImage(systemName: "phone"))
         iconImageView.tintColor = .gray
         iconImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
         iconImageView.contentMode = .scaleAspectFit
         
         let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
         iconContainerView.addSubview(iconImageView)
         iconImageView.center = iconContainerView.center
         phoneField.leftView = iconContainerView
         phoneField.leftViewMode = .always
         
        view.addSubview(phoneField)
         NSLayoutConstraint.activate([
             phoneField.topAnchor.constraint(equalTo: view.topAnchor, constant: 596),
             phoneField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             phoneField.widthAnchor.constraint(equalToConstant: 345),
             phoneField.heightAnchor.constraint(equalToConstant: 40)
         ])
     }
    
    private func configureCountryText() {
         countryText.text = "Country"
         countryText.textColor = UIColor(hex: "#292929")
         countryText.font = UIFont.boldSystemFont(ofSize: 10)
         countryText.textAlignment = .left
         countryText.translatesAutoresizingMaskIntoConstraints = false
         
        view.addSubview(countryText)
        NSLayoutConstraint.activate([
            countryText.bottomAnchor.constraint(equalTo: countryButton.topAnchor, constant: -6),
            countryText.leftAnchor.constraint(equalTo: countryButton.leftAnchor, constant: 4)
        ])
     }
    
    private func configureCountryField() {
        countryButton.setImage(UIImage(named: "countrybutton"), for: .normal)
        countryButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countryButton)
        NSLayoutConstraint.activate([
            countryButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 673),
            countryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryButton.widthAnchor.constraint(equalToConstant: 345),
            countryButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor(hex: "#3B82F6"), for: .normal)
        saveButton.layer.borderColor = UIColor(hex: "#3B82F6")?.cgColor
        saveButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = 8
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 745),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 345),
            saveButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func saveButtonTapped() {
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.saveButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.saveButton.transform = CGAffineTransform.identity
                           }
                       })
    }
    
    
    
    
    
}
