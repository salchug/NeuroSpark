//
//  LoginViewController.swift
//  NeuroSpark
//
//  Created by salchug on 12.05.25.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    let applogo = UIImageView(image: UIImage(named: "neurosparkpng"))
    let emailField = UITextField()
    let emailText = UILabel()
    let passwordField = UITextField()
    let passwordText = UILabel()
    let forgotpswd = UILabel()
    let continueButton = UIButton()
    let leftLine = UIView()
    let orText = UILabel()
    let rightLine = UIView()
    let altButton = UIButton()
    let fbButton = UIButton()
    let appleButton = UIButton()
    let alreadyText = UILabel()
    let signinText = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        title = "Welcome Back!"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        
        configureUI()
        emailField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
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
        configureEmailField()
        configureEmailText()
        configurePasswordField()
        configurePasswordText()
        configureForgotPassword()
        configureContinueButton()
        configureOrText()
        configureLeftLine()
        configureRightLine()
        configureAltButton()
        configureFbButton()
        configureAppleButton()
    }
    
    func configureAppLogo() {
        applogo.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(applogo)
        NSLayoutConstraint.activate([
            applogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            applogo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 144),
            applogo.widthAnchor.constraint(equalToConstant: 101),
            applogo.heightAnchor.constraint(equalToConstant: 114)
        ])
    }
    
    func configureEmailText() {
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
    
    func configureEmailField() {
        emailField.placeholder = "Enter your email address"
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
            emailField.topAnchor.constraint(equalTo: view.topAnchor, constant: 291),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 345),
            emailField.heightAnchor.constraint(equalToConstant: 37)
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
            passwordField.topAnchor.constraint(equalTo: view.topAnchor, constant: 368),
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
    
    func configureForgotPassword() {
        forgotpswd.text = "Forgot Password?"
        forgotpswd.font = UIFont.systemFont(ofSize: 10)
        forgotpswd.attributedText = NSAttributedString(
            string: forgotpswd.text ?? "",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        forgotpswd.textColor = UIColor(hex: "#3B82F6")
        forgotpswd.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(forgotpswd)
        NSLayoutConstraint.activate([
            forgotpswd.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 6),
            forgotpswd.rightAnchor.constraint(equalTo: passwordField.rightAnchor, constant: 4)
        ])
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
        
        continueButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    @objc func handleLogin() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                           self.continueButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.continueButton.transform = CGAffineTransform.identity
                           }
                       })
        
        
        guard let email = emailField.text, let password = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            guard let self = self else { return }
            
            if let error = error {
                if error.localizedDescription.contains("badly formatted") || error.localizedDescription.contains("no user") {
                    showAlert(message: "Invalid email.")
                } else {
                    showAlert(message: "Wrong password.")
                }
                return
            }
            
            guard let uid = user?.user.uid else { return }
            let database = Database.database(url: "https://neurospark-7ffe1-default-rtdb.europe-west1.firebasedatabase.app/").reference()
            database.child("users").child(uid).getData { error, snapshot in
                if let data = snapshot?.value as? [String: Any],
                   let name = data["name"] as? String,
                   let email = data["email"] as? String {
                    let homeVC = HomeViewController()
                    homeVC.name = name
                    homeVC.email = email
                    self.navigationController?.setViewControllers([homeVC], animated: true)
                } else {
                    self.showAlert(message: "Failed to load user data.")
                }
            }
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func updateFilledState() {
        let isEmailFilled = !(emailField.text?.isEmpty ?? true)
        let isPasswordFilled = !(passwordField.text?.isEmpty ?? true)

        if isEmailFilled && isPasswordFilled {
            continueButton.backgroundColor = UIColor(hex: "#3B82F6")
            continueButton.isEnabled = true
        } else {
            continueButton.backgroundColor = UIColor(hex: "#A7C7E7")
            continueButton.isEnabled = false
        }
        
        if isEmailFilled {
            emailField.layer.borderColor = UIColor(hex: "#3B82F6")?.cgColor
        } else {
            emailField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        }
        
        if isPasswordFilled {
            passwordField.layer.borderColor = UIColor(hex: "#3B82F6")?.cgColor
        } else {
            passwordField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor

        }
    }

    @objc func textFieldDidChange() {
        updateFilledState()
    }

    
    
    private func configureOrText() {
        orText.text = "Or"
        orText.textColor = UIColor(hex: "#5E5E5E")
        orText.font = UIFont.systemFont(ofSize: 9)
        orText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(orText)
        NSLayoutConstraint.activate([
            orText.topAnchor.constraint(equalTo: view.topAnchor, constant: 557),
            orText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func configureLeftLine() {
        leftLine.backgroundColor = UIColor(hex: "#B6B6B6")
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leftLine)
        NSLayoutConstraint.activate([
            leftLine.topAnchor.constraint(equalTo: view.topAnchor, constant: 562),
            leftLine.leadingAnchor.constraint(equalTo: orText.leadingAnchor, constant: 8),
            leftLine.widthAnchor.constraint(equalToConstant: 72),
            leftLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    private func configureRightLine() {
        rightLine.backgroundColor = UIColor(hex: "#B6B6B6")
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rightLine)
        NSLayoutConstraint.activate([
            rightLine.topAnchor.constraint(equalTo: view.topAnchor, constant: 562),
            rightLine.trailingAnchor.constraint(equalTo: orText.trailingAnchor, constant: -8),
            rightLine.widthAnchor.constraint(equalToConstant: 72),
            rightLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    
    func configureAltButton() {
        altButton.setImage(UIImage(named: "googlebuttonpng"), for: .normal)
        altButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(altButton)
        NSLayoutConstraint.activate([
            altButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 589),
            altButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            altButton.widthAnchor.constraint(equalToConstant: 345),
            altButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        altButton.addTarget(self, action: #selector(altButtonTapped), for: .touchUpInside)
    }
    
    @objc private func altButtonTapped() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.altButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.altButton.transform = CGAffineTransform.identity
                           }
                       })
        
        showAlert(message: "Google Sign-In not implemented yet.")
    }
    
    func configureFbButton() {
        fbButton.setImage(UIImage(named: "fbicon"), for: .normal)
        fbButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fbButton)
        NSLayoutConstraint.activate([
            fbButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 660),
            fbButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),
            fbButton.widthAnchor.constraint(equalToConstant: 48),
            fbButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        fbButton.addTarget(self, action: #selector(fbButtonTapped), for: .touchUpInside)
    }
    
    @objc private func fbButtonTapped() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.fbButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.fbButton.transform = CGAffineTransform.identity
                           }
                       })
        
        showAlert(message: "Facebook Sign-In not implemented yet.")
    }
    
    func configureAppleButton() {
        appleButton.setImage(UIImage(named: "appleicon"), for: .normal)
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(appleButton)
        NSLayoutConstraint.activate([
            appleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 660),
            appleButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 204),
            appleButton.widthAnchor.constraint(equalToConstant: 48),
            appleButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        appleButton.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)
    }
    
    @objc private func appleButtonTapped() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.appleButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.appleButton.transform = CGAffineTransform.identity
                           }
                       })
        
        showAlert(message: "Apple Sign-In not implemented yet.")
    }
    
}
