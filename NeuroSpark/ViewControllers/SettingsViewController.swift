//
//  SettingsViewController.swift
//  NeuroSpark
//
//  Created by salchug on 19.05.25.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "F3E8FF")
        title = "Settings"
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        configureUI()
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    
    private func configureUI() {
        configureAccLabel()
        configureProfileButton()
        configureAboutChildButton()
        configureChangePasswdButton()
        configureLanguagesButton()
        configureOtherLabel()
        configureAboutButton()
        configurePrivacyButton()
        configureNotificationsButton()
    }
    
    private func configureAccLabel() {
        let accLabel = UILabel()
        accLabel.text = "Account"
        accLabel.font = UIFont.systemFont(ofSize: 18)
        accLabel.textColor = UIColor(hex: "#292929")
        accLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(accLabel)
        
        NSLayoutConstraint.activate([
            accLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 145),
            accLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35)
        ])
    }
    
    private func configureProfileButton() {
        let profileButton = UIButton()
        profileButton.setImage(UIImage(named: "goprofilebutton"), for: .normal)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
        
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 183),
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: 345),
            profileButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        profileButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
    }
    
    @objc func goToProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    private func configureAboutChildButton() {
        let aboutChildButton = UIButton()
        aboutChildButton.setImage(UIImage(named: "aboutyourchild"), for: .normal)
        aboutChildButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutChildButton)
        
        NSLayoutConstraint.activate([
            aboutChildButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 255),
            aboutChildButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutChildButton.widthAnchor.constraint(equalToConstant: 345),
            aboutChildButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        aboutChildButton.addTarget(self, action: #selector(goAboutYourChild), for: .touchUpInside)
    }
    
    @objc private func goAboutYourChild() {
        navigationController?.pushViewController(AboutYourChildViewController(), animated: true)
    }
    
    private func configureChangePasswdButton() {
        let changePasswd = UIButton()
        changePasswd.setImage(UIImage(named: "changepassword"), for: .normal)
        changePasswd.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(changePasswd)
        
        NSLayoutConstraint.activate([
            changePasswd.topAnchor.constraint(equalTo: view.topAnchor, constant: 327),
            changePasswd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changePasswd.widthAnchor.constraint(equalToConstant: 345),
            changePasswd.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureLanguagesButton() {
        let languageButton = UIButton()
        languageButton.setImage(UIImage(named: "languagebutton"), for: .normal)
        languageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(languageButton)
        
        NSLayoutConstraint.activate([
            languageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 399),
            languageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            languageButton.widthAnchor.constraint(equalToConstant: 345),
            languageButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureOtherLabel() {
        let accLabel = UILabel()
        accLabel.text = "Other"
        accLabel.font = UIFont.systemFont(ofSize: 18)
        accLabel.textColor = UIColor(hex: "#292929")
        accLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(accLabel)
        
        NSLayoutConstraint.activate([
            accLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 476),
            accLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35)
        ])
    }
    
    private func configureAboutButton() {
        let aboutButton = UIButton()
        aboutButton.setImage(UIImage(named: "aboutbutton"), for: .normal)
        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutButton)
        
        NSLayoutConstraint.activate([
            aboutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 514),
            aboutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutButton.widthAnchor.constraint(equalToConstant: 345),
            aboutButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        aboutButton.addTarget(self, action: #selector(goToAbout), for: .touchUpInside)
        
    }
    
    @objc func goToAbout() {
        navigationController?.pushViewController(AboutViewController(), animated: true)
    }
    
    private func configurePrivacyButton() {
        let privacyButton = UIButton()
        privacyButton.setImage(UIImage(named: "privacybutton"), for: .normal)
        privacyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(privacyButton)
        
        NSLayoutConstraint.activate([
            privacyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 586),
            privacyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            privacyButton.widthAnchor.constraint(equalToConstant: 345),
            privacyButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureNotificationsButton() {
        let notifButton = UIButton()
        notifButton.setImage(UIImage(named: "notificationsbutton"), for: .normal)
        notifButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notifButton)
        
        NSLayoutConstraint.activate([
            notifButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 658),
            notifButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notifButton.widthAnchor.constraint(equalToConstant: 345),
            notifButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
}
