//
//  CreatePasswdViewController.swift
//  NeuroSpark
//
//  Created by salchug on 13.05.25.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreatePasswdViewController: UIViewController {

    let applogo = UIImageView(image: UIImage(named: "neurosparkpng"))
    let passwdField = UITextField()
    let passwdText = UILabel()
    let repeatField = UITextField()
    let repeatText = UILabel()
    let continueButton = UIButton()

    private let name: String
    private let email: String
    
    private let database = Database.database().reference()
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        title = "Create A Password"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        
        configureUI()
        passwdField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        repeatField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        updateFilledState()

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureUI() {
        configureAppLogo()
        configurePasswdField()
        configurePasswdText()
        configureRepeatField()
        configureRepeatText()
        configureContinueButton()

    }
    
    func configureAppLogo() {
        applogo.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(applogo)
        NSLayoutConstraint.activate([
            applogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            applogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applogo.widthAnchor.constraint(equalToConstant: 101),
            applogo.heightAnchor.constraint(equalToConstant: 114)
        ])
    }
    
    func configurePasswdText() {
        passwdText.text = "Create Password"
        passwdText.textColor = UIColor(hex: "#292929")
        passwdText.font = UIFont.boldSystemFont(ofSize: 10)
        passwdText.textAlignment = .left
        passwdText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(passwdText)
        NSLayoutConstraint.activate([
            passwdText.bottomAnchor.constraint(equalTo: passwdField.topAnchor, constant: -6),
            passwdText.leftAnchor.constraint(equalTo: passwdField.leftAnchor, constant: 4)
        ])
    }
    
    func configurePasswdField() {
        passwdField.placeholder = "Enter new password"
        passwdField.layer.borderWidth = 1
        passwdField.layer.cornerRadius = 8
        passwdField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        passwdField.setPadding(left: 40)
        passwdField.isSecureTextEntry = true
        passwdField.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView(image: UIImage(systemName: "lock"))
        iconImageView.tintColor = .gray
        iconImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
        iconImageView.contentMode = .scaleAspectFit
        
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        iconContainerView.addSubview(iconImageView)
        iconImageView.center = iconContainerView.center
        passwdField.leftView = iconContainerView
        passwdField.leftViewMode = .always
        
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 20)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        
        
        let eyeContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        eyeContainerView.addSubview(eyeButton)
        eyeButton.center = eyeContainerView.center
        passwdField.rightView = eyeContainerView
        passwdField.rightViewMode = .always
        
        view.addSubview(passwdField)
        NSLayoutConstraint.activate([
            passwdField.topAnchor.constraint(equalTo: view.topAnchor, constant: 291),
            passwdField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwdField.widthAnchor.constraint(equalToConstant: 345),
            passwdField.heightAnchor.constraint(equalToConstant: 37)
        ])
    }
    
    @objc func togglePasswordVisibility() {
        passwdField.isSecureTextEntry.toggle()
        
        if let eyeButton = passwdField.rightView?.subviews.first as? UIButton {
            let iconName = passwdField.isSecureTextEntry ? "eye.slash" : "eye"
            eyeButton.setImage(UIImage(systemName: iconName), for: .normal)
        }
    }
    
    
    func configureRepeatText() {
        repeatText.text = "Confirm Password"
        repeatText.textColor = UIColor(hex: "#292929")
        repeatText.font = UIFont.boldSystemFont(ofSize: 10)
        repeatText.textAlignment = .left
        repeatText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(repeatText)
        NSLayoutConstraint.activate([
            repeatText.bottomAnchor.constraint(equalTo: repeatField.topAnchor, constant: -6),
            repeatText.leftAnchor.constraint(equalTo: repeatField.leftAnchor, constant: 4)
        ])
    }
    
    func configureRepeatField() {
        repeatField.placeholder = "Repeat new password"
        repeatField.layer.borderWidth = 1
        repeatField.layer.cornerRadius = 8
        repeatField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        repeatField.setPadding(left: 40)
        repeatField.isSecureTextEntry = true
        repeatField.translatesAutoresizingMaskIntoConstraints = false
        
        let lockImageView = UIImageView(image: UIImage(systemName: "lock"))
        lockImageView.tintColor = .gray
        lockImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
        lockImageView.contentMode = .scaleAspectFit
        
        let lockContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        lockContainerView.addSubview(lockImageView)
        lockImageView.center = lockContainerView.center
        repeatField.leftView = lockContainerView
        repeatField.leftViewMode = .always
        
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 20)
        eyeButton.addTarget(self, action: #selector(toggleRepeatVisibility), for: .touchUpInside)
        
        let eyeContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        eyeContainerView.addSubview(eyeButton)
        eyeButton.center = eyeContainerView.center
        repeatField.rightView = eyeContainerView
        repeatField.rightViewMode = .always
        
        
        view.addSubview(repeatField)
        NSLayoutConstraint.activate([
            repeatField.topAnchor.constraint(equalTo: view.topAnchor, constant: 368),
            repeatField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            repeatField.widthAnchor.constraint(equalToConstant: 345),
            repeatField.heightAnchor.constraint(equalToConstant: 37)
        ])
        
        
    }
    
    @objc func toggleRepeatVisibility() {
        repeatField.isSecureTextEntry.toggle()
        
        if let eyeButton = repeatField.rightView?.subviews.first as? UIButton {
            let iconName = repeatField.isSecureTextEntry ? "eye.slash" : "eye"
            eyeButton.setImage(UIImage(systemName: iconName), for: .normal)
        }
    }
    
    
    
    func configureContinueButton() {
        continueButton.setTitle("Continue", for: .normal)
        continueButton.backgroundColor = UIColor(hex: "#A7C7E7")
        continueButton.layer.cornerRadius = 8
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 486),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 344),
            continueButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        continueButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }

    @objc private func createButtonTapped() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.continueButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.continueButton.transform = CGAffineTransform.identity
                           }
                       })
        
        guard let password = passwdField.text, !password.isEmpty,
              let confirmPassword = repeatField.text, !confirmPassword.isEmpty else { return }

        guard password.count >= 6 else {
            showAlert(message: "Password must be at least 6 characters long.")
            return
        }
         
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
             
            if let error = error {
                self.showAlert(message: error.localizedDescription)
                return
            }
             
            guard let user = authResult?.user else {
                self.showAlert(message: "User creation failed.")
                return
            }
             
            let userData = ["name": self.name, "email": self.email]
            print("Writing user data: \(userData)")
            let database = Database.database(url: "https://neurospark-7ffe1-default-rtdb.europe-west1.firebasedatabase.app/").reference()
            print("Database reference: \(database.url)")
            database.child("users").child(user.uid).setValue(userData) { error, _ in
                print("Database completion called")
                print("Database error: \(error?.localizedDescription ?? "None")")
                if let error = error {
                    self.showAlert(message: "Failed to save user data: \(error.localizedDescription)")
                    return
                }
                
                print("Database write succeeded")
                print("Navigating to HomeViewController")
                let homeVC = HomeViewController()
                homeVC.name = self.name
                homeVC.email = self.email
                self.navigationController?.setViewControllers([homeVC], animated: true)
            }
        }
    }

     
     private func showAlert(message: String, completion: (() -> Void)? = nil) {
         let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
             completion?()
         })
         present(alert, animated: true)
     }
    
    
    func updateFilledState() {
        let isPasswdFilled = !(passwdField.text?.isEmpty ?? true)
        let isRepeatFilled = !(repeatField.text?.isEmpty ?? true)

        if isPasswdFilled && isRepeatFilled && passwdField.text == repeatField.text {
            continueButton.backgroundColor = UIColor(hex: "#3B82F6")
            continueButton.isEnabled = true
        } else {
            continueButton.backgroundColor = UIColor(hex: "#A7C7E7")
            continueButton.isEnabled = false
        }
        
        if isPasswdFilled {
            passwdField.layer.borderColor = UIColor(hex: "#3B82F6")?.cgColor
        } else {
            passwdField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        }
        
        if isRepeatFilled {
            repeatField.layer.borderColor = UIColor(hex: "#3B82F6")?.cgColor
        } else {
            repeatField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor

        }
    }

    @objc func textFieldDidChange() {
        updateFilledState()
    }
    
    
}
