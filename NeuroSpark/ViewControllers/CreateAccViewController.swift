//
//  CreateAccViewController.swift
//  NeuroSpark
//
//  Created by salchug on 13.05.25.
//

import UIKit

class CreateAccViewController: UIViewController {
    private let appLogo = UIImageView(image: UIImage(named: "neurosparkpng"))
    private let leftLine = UIView()
    private let orText = UILabel()
    private let rightLine = UIView()
    private let altButton = UIButton()
    private let fbButton = UIButton()
    private let appleButton = UIButton()
    private let alreadyText = UILabel()
    private let signinText = UILabel()
    private let nameField = UITextField()
    private let nameText = UILabel()
    private let emailField = UITextField()
    private let emailText = UILabel()
    private let continueButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        title = "Create An Account"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton

        configureUI()
        nameField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        updateFilledState()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }

    private func configureUI() {
        configureAppLogo()
        configureNameField()
        configureNameText()
        configureEmailField()
        configureEmailText()
        configureContinueButton()
        configureOrText()
        configureLeftLine()
        configureRightLine()
        configureAltButton()
        configureFbButton()
        configureAppleButton()
        configureAlreadyText()
        configureSigninText()
    }

    private func configureAppLogo() {
        appLogo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appLogo)
        NSLayoutConstraint.activate([
            appLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            appLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLogo.widthAnchor.constraint(equalToConstant: 101),
            appLogo.heightAnchor.constraint(equalToConstant: 114)
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
            nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 291),
            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameField.widthAnchor.constraint(equalToConstant: 345),
            nameField.heightAnchor.constraint(equalToConstant: 37)
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
        emailField.placeholder = "Enter your email address"
        emailField.keyboardType = .emailAddress
        emailField.layer.borderWidth = 1
        emailField.layer.cornerRadius = 8
        emailField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        emailField.setPadding(left: 40)
        emailField.translatesAutoresizingMaskIntoConstraints = false

        let lockImageView = UIImageView(image: UIImage(systemName: "envelope"))
        lockImageView.tintColor = .gray
        lockImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
        lockImageView.contentMode = .scaleAspectFit

        let lockContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        lockContainerView.addSubview(lockImageView)
        lockImageView.center = lockContainerView.center
        emailField.leftView = lockContainerView
        emailField.leftViewMode = .always

        view.addSubview(emailField)
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: view.topAnchor, constant: 368),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 345),
            emailField.heightAnchor.constraint(equalToConstant: 37)
        ])
    }

    private func configureContinueButton() {
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.backgroundColor = UIColor(hex: "#A7C7E7")
        continueButton.layer.cornerRadius = 8
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        view.addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 486),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 344),
            continueButton.heightAnchor.constraint(equalToConstant: 45)
        ])
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

    private func configureAltButton() {
        altButton.setImage(UIImage(named: "googlebuttonpng"), for: .normal)
        altButton.translatesAutoresizingMaskIntoConstraints = false
        altButton.addTarget(self, action: #selector(googleSignInTapped), for: .touchUpInside)
        view.addSubview(altButton)
        NSLayoutConstraint.activate([
            altButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 589),
            altButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            altButton.widthAnchor.constraint(equalToConstant: 345),
            altButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    private func configureFbButton() {
        fbButton.setImage(UIImage(named: "fbicon"), for: .normal)
        fbButton.translatesAutoresizingMaskIntoConstraints = false
        fbButton.addTarget(self, action: #selector(facebookSignInTapped), for: .touchUpInside)
        view.addSubview(fbButton)
        NSLayoutConstraint.activate([
            fbButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 660),
            fbButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),
            fbButton.widthAnchor.constraint(equalToConstant: 48),
            fbButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func configureAppleButton() {
        appleButton.setImage(UIImage(named: "appleicon"), for: .normal)
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.addTarget(self, action: #selector(appleSignInTapped), for: .touchUpInside)
        view.addSubview(appleButton)
        NSLayoutConstraint.activate([
            appleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 660),
            appleButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 204),
            appleButton.widthAnchor.constraint(equalToConstant: 48),
            appleButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func configureAlreadyText() {
        alreadyText.text = "Already have an account?"
        alreadyText.font = UIFont.systemFont(ofSize: 13)
        alreadyText.textColor = UIColor(hex: "#333333")
        alreadyText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alreadyText)
        NSLayoutConstraint.activate([
            alreadyText.topAnchor.constraint(equalTo: altButton.bottomAnchor, constant: 140),
            alreadyText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30)
        ])
    }

    private func configureSigninText() {
        signinText.text = "Sign in"
        signinText.font = UIFont.systemFont(ofSize: 13)
        signinText.attributedText = NSAttributedString(
            string: signinText.text ?? "",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        signinText.textColor = UIColor(hex: "#3B82F6")
        signinText.translatesAutoresizingMaskIntoConstraints = false
        signinText.isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSignin))
        signinText.addGestureRecognizer(tapGesture)

        view.addSubview(signinText)
        NSLayoutConstraint.activate([
            signinText.topAnchor.constraint(equalTo: altButton.bottomAnchor, constant: 140),
            signinText.trailingAnchor.constraint(equalTo: alreadyText.trailingAnchor, constant: 50)
        ])
    }

    @objc private func continueButtonTapped() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.continueButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.continueButton.transform = CGAffineTransform.identity
                           }
                       })
        
        guard let name = nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty,
              let email = emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            showAlert(message: "Please fill in all fields.")
            return
        }

        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard emailPredicate.evaluate(with: email) else {
            showAlert(message: "Please enter a valid email address.")
            return
        }

        let passwordVC = CreatePasswdViewController(name: name, email: email)
        navigationController?.pushViewController(passwordVC, animated: true)
    }

    @objc private func googleSignInTapped() {
        
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

    @objc private func facebookSignInTapped() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.fbButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.fbButton.transform = CGAffineTransform.identity
                           }
                       })
        
        showAlert(message: "Facebook Login not implemented yet.")
    }

    @objc private func appleSignInTapped() {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                            self.appleButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.appleButton.transform = CGAffineTransform.identity
                           }
                       })
        
        showAlert(message: "Sign in with Apple not implemented yet.")
    }

    @objc private func handleSignin() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

    private func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true)
    }

    @objc private func textFieldDidChange() {
        updateFilledState()
    }

    private func updateFilledState() {
        let isNameFilled = !(nameField.text?.isEmpty ?? true)
        let isEmailFilled = !(emailField.text?.isEmpty ?? true)

        if isNameFilled && isEmailFilled {
            continueButton.backgroundColor = UIColor(hex: "#3B82F6")
            continueButton.isEnabled = true
        } else {
            continueButton.backgroundColor = UIColor(hex: "#A7C7E7")
            continueButton.isEnabled = false
        }

        nameField.layer.borderColor = isNameFilled ? UIColor(hex: "#3B82F6")?.cgColor : UIColor(hex: "#8D8D8D")?.cgColor
        emailField.layer.borderColor = isEmailFilled ? UIColor(hex: "#3B82F6")?.cgColor : UIColor(hex: "#8D8D8D")?.cgColor
    }
}
