//
//  HomeViewController.swift
//  NeuroSpark
//
//  Created by salchug on 14.05.25.
//

import UIKit


class HomeViewController: UIViewController {
    
    let welcomeUser = UILabel()
    let welcomeMessage = UILabel()
    
    var name: String = ""
    var email: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        configureUI()
        
    }
    
    private func setupBackground() {
        let backgroundImage = UIImageView(image: UIImage(named: "backgroundcircle"))
        backgroundImage.contentMode = .scaleAspectFit
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureUI() {
        configureSettingsIcon()
        configureWelcomeUser()
        configureWelcomeMessage()
        setupMainContainer()
    }

    private func configureSettingsIcon() {
        let settingsIcon = UIButton()
        settingsIcon.setImage(UIImage(named: "settingsicon"), for: .normal)
        settingsIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsIcon)
        NSLayoutConstraint.activate([
            settingsIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 67),
            settingsIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            settingsIcon.widthAnchor.constraint(equalToConstant: 60),
            settingsIcon.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        settingsIcon.addTarget(self, action: #selector(goSettingsVC), for: .touchUpInside)
    }
    
    @objc private func goSettingsVC() {
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    private func configureWelcomeUser() {
        welcomeUser.text = "Hello \(name)"
        welcomeUser.font = UIFont.boldSystemFont(ofSize: 30)
        welcomeUser.textColor = UIColor(hex: "#1C1B1B")
        welcomeUser.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeUser)
        
        NSLayoutConstraint.activate([
            welcomeUser.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
            welcomeUser.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
        ])
    }
    
    private func configureWelcomeMessage() {
        welcomeMessage.text = "Welcome to NEUROSPARK"
        welcomeMessage.font = UIFont.systemFont(ofSize: 10)
        welcomeMessage.textColor = UIColor(hex: "#1C1B1B")
        welcomeMessage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeMessage)
        
        NSLayoutConstraint.activate([
            welcomeMessage.topAnchor.constraint(equalTo: view.topAnchor, constant: 162),
            welcomeMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
        ])
    }
    
    private func setupMainContainer() {
        let container = UIView()
        container.backgroundColor = UIColor(hex: "#D2E7FB")?.withAlphaComponent(0.3)
        container.layer.cornerRadius = 12
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        
        let topConstant: CGFloat = UIScreen.main.bounds.width <= 375 ? 100 : 130

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            container.heightAnchor.constraint(equalToConstant: 641)
        ])
        
        setupBlueContainer(in: container)
        setupProfileButton(in: container)
        setupFullName(in: container)
        statusBar(in: container)
        setupWhiteContainer(in: container)
        setupGreenContainer(in: container)
        setupVideoIcon(in: container)
        setupChooseVideoButton(in: container)
        limitInfoText(in: container)
        setupAnalysisButton(in: container)
        setupRecommendButton(in: container)
        cancelVideoButton(in: container)
        uploadVideoButton(in: container)
        videoNameLabel(in: container)
    }



    private func setupBlueContainer(in parent: UIView) {
        let blueContentBox = UIView()
        blueContentBox.backgroundColor = UIColor(hex: "#A5C5E4")
        blueContentBox.layer.cornerRadius = 12
        blueContentBox.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(blueContentBox)
        
        NSLayoutConstraint.activate([
            blueContentBox.topAnchor.constraint(equalTo: parent.topAnchor, constant: 36),
            blueContentBox.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            blueContentBox.widthAnchor.constraint(equalToConstant: 345),
            blueContentBox.heightAnchor.constraint(equalToConstant: 103)
        ])
    }

    private func setupProfileButton(in parent: UIView) {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "profileiconpng")
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(profileImage)
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: parent.topAnchor, constant: 45),
            profileImage.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 35),
            profileImage.widthAnchor.constraint(equalToConstant: 85),
            profileImage.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    private func setupFullName(in parent: UIView) {
        let fullName = UILabel()
        fullName.text = "Full Name"
        fullName.textColor = UIColor(hex: "#1C1B1B")
        fullName.font = UIFont.systemFont(ofSize: 15)
        fullName.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(fullName)
        
        NSLayoutConstraint.activate([
            fullName.topAnchor.constraint(equalTo: parent.topAnchor, constant: 68),
            fullName.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 133),
        ])
    }
    
    private func statusBar(in parent: UIView) {
        let riskBar = UIView()
        riskBar.backgroundColor = UIColor(hex: "#4B9FCE")
        riskBar.layer.cornerRadius = 8
        riskBar.translatesAutoresizingMaskIntoConstraints = false
        
        let leftLabel = UILabel()
        leftLabel.text = "Risk Level"
        leftLabel.textColor = .white
        leftLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let rightLabel = UILabel()
        rightLabel.text = "" // status olacaq
        rightLabel.textColor = .white
        rightLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        riskBar.addSubview(leftLabel)
        riskBar.addSubview(rightLabel)
        parent.addSubview(riskBar)
        
        NSLayoutConstraint.activate([
            riskBar.topAnchor.constraint(equalTo: parent.topAnchor, constant: 92),
            riskBar.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 131),
            riskBar.widthAnchor.constraint(equalToConstant: 192),
            riskBar.heightAnchor.constraint(equalToConstant: 25),
            
            leftLabel.leadingAnchor.constraint(equalTo: riskBar.leadingAnchor, constant: 12),
            leftLabel.centerYAnchor.constraint(equalTo: riskBar.centerYAnchor),
            
            rightLabel.trailingAnchor.constraint(equalTo: riskBar.trailingAnchor, constant: -12),
            rightLabel.centerYAnchor.constraint(equalTo: riskBar.centerYAnchor)
        ])
    }
    
    private func setupWhiteContainer(in parent: UIView) {
        let whiteContentBox = UIView()
        whiteContentBox.backgroundColor = UIColor(hex: "#FBFBFB")
        whiteContentBox.layer.cornerRadius = 16
        whiteContentBox.layer.masksToBounds = true
        whiteContentBox.translatesAutoresizingMaskIntoConstraints = false
        
        parent.addSubview(whiteContentBox)
        NSLayoutConstraint.activate([
            whiteContentBox.topAnchor.constraint(equalTo: parent.topAnchor, constant: 149),
            whiteContentBox.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            whiteContentBox.widthAnchor.constraint(equalToConstant: 345),
            whiteContentBox.heightAnchor.constraint(equalToConstant: 216)
        ])
    }
    
    private func setupGreenContainer(in parent: UIView) {
        let greenContentBox = UIView()
        greenContentBox.backgroundColor = UIColor(hex: "#CBD8CF")
        greenContentBox.layer.cornerRadius = 16
        greenContentBox.layer.masksToBounds = true
        greenContentBox.translatesAutoresizingMaskIntoConstraints = false
        
        parent.addSubview(greenContentBox)
        NSLayoutConstraint.activate([
            greenContentBox.topAnchor.constraint(equalTo: parent.topAnchor, constant: 176),
            greenContentBox.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            greenContentBox.widthAnchor.constraint(equalToConstant: 317),
            greenContentBox.heightAnchor.constraint(equalToConstant: 137)
        ])
    }
    
    private func setupVideoIcon(in parent: UIView) {
        let videoIcon = UIImageView(image: UIImage(named: "videoicon"))
        videoIcon.translatesAutoresizingMaskIntoConstraints = false
        
        parent.addSubview(videoIcon)
        NSLayoutConstraint.activate([
            videoIcon.topAnchor.constraint(equalTo: parent.topAnchor, constant: 189),
            videoIcon.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 160),
            videoIcon.widthAnchor.constraint(equalToConstant: 73),
            videoIcon.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private var videoTitle: UILabel!

    private func setupChooseVideoButton(in parent: UIView) {
        let chooseVideo = UIButton()
        chooseVideo.setImage(UIImage(named: "choosevideo"), for: .normal)
        chooseVideo.translatesAutoresizingMaskIntoConstraints = false
        chooseVideo.addTarget(self, action: #selector(selectVideo), for: .touchUpInside)
        parent.addSubview(chooseVideo)
        
        NSLayoutConstraint.activate([
            chooseVideo.topAnchor.constraint(equalTo: parent.topAnchor, constant: 253),
            chooseVideo.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 135),
            chooseVideo.widthAnchor.constraint(equalToConstant: 110),
            chooseVideo.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    @objc private func selectVideo() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.mediaTypes = ["public.movie"]
        picker.videoQuality = .typeMedium
        picker.delegate = self
        present(picker, animated: true)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    private func limitInfoText(in parent: UIView) {
        let limitInfo = UILabel()
        limitInfo.text = "MP4 or MOV file, maximum size 500MB"
        limitInfo.font = UIFont.systemFont(ofSize: 10)
        limitInfo.textColor = UIColor(hex: "#484747")
        limitInfo.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(limitInfo)
        
        NSLayoutConstraint.activate([
            limitInfo.topAnchor.constraint(equalTo: parent.topAnchor, constant: 289),
            limitInfo.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 101),
        ])
    }

    private func videoNameLabel(in parent: UIView) {
        videoTitle = UILabel()
        videoTitle.numberOfLines = 1
        videoTitle.textColor = UIColor(hex: "#3B82F6")
        videoTitle.font = UIFont.systemFont(ofSize: 10)
        videoTitle.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(videoTitle)
        
        NSLayoutConstraint.activate([
            videoTitle.topAnchor.constraint(equalTo: parent.topAnchor, constant: 330),
            videoTitle.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 45),
            videoTitle.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    private func cancelVideoButton(in parent: UIView) {
        let cancelVideo = UIButton()
        cancelVideo.setImage(UIImage(named: "cancelbutton"), for: .normal)
        cancelVideo.translatesAutoresizingMaskIntoConstraints = false
        cancelVideo.addTarget(self, action: #selector(handlecancelVideo), for: .touchUpInside)
        parent.addSubview(cancelVideo)
        
        NSLayoutConstraint.activate([
            cancelVideo.topAnchor.constraint(equalTo: parent.topAnchor, constant: 324),
            cancelVideo.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 199),
            cancelVideo.widthAnchor.constraint(equalToConstant: 70),
            cancelVideo.heightAnchor.constraint(equalToConstant: 25)
        ])
    }

    @objc private func handlecancelVideo() {
        videoTitle.text = ""
    }
    
    private func uploadVideoButton(in parent: UIView) {
        let uploadButton = UIButton()
        uploadButton.setImage(UIImage(named: "uploadbutton")?.withRenderingMode(.alwaysOriginal), for: .normal)
        uploadButton.imageView?.contentMode = .scaleAspectFit
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(uploadButton)
        
        NSLayoutConstraint.activate([
            uploadButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 324),
            uploadButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 275),
            uploadButton.widthAnchor.constraint(equalToConstant: 70),
            uploadButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        uploadButton.addTarget(self, action: #selector(goToRiskLow), for: .touchUpInside)
    }
    
    @objc private func goToRiskLow() {
        navigationController?.pushViewController(LowRiskAnalyzeViewController(), animated: true)
    }

    
    private func setupAnalysisButton(in parent: UIView) {
        let analysisButton = UIButton()
        analysisButton.setImage(UIImage(named: "analysisbutton"), for: .normal)
        analysisButton.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(analysisButton)
        
        NSLayoutConstraint.activate([
            analysisButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 375),
            analysisButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            analysisButton.widthAnchor.constraint(equalToConstant: 344),
            analysisButton.heightAnchor.constraint(equalToConstant: 102)
        ])
        
        analysisButton.addTarget(self, action: #selector(goBehaviourAnalysis), for: .touchUpInside)
    }
    
    @objc func goBehaviourAnalysis() {
        navigationController?.pushViewController(BehaviourQuestionViewController(), animated: true)
    }
    
    private func setupRecommendButton(in parent: UIView) {
        let recommendButton = UIButton()
        recommendButton.setImage(UIImage(named: "recommendbutton"), for: .normal)
        recommendButton.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(recommendButton)
        
        NSLayoutConstraint.activate([
            recommendButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 487),
            recommendButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            recommendButton.widthAnchor.constraint(equalToConstant: 344),
            recommendButton.heightAnchor.constraint(equalToConstant: 102)
        ])
        
        recommendButton.addTarget(self, action: #selector(goRecommendations), for: .touchUpInside)
    }
    
    @objc func goRecommendations() {
        navigationController?.pushViewController(PersonalizedRcmmndViewController(), animated: true)
    }
    
    
    
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let videoURL = info[.mediaURL] as? URL {
            let fileName = videoURL.lastPathComponent
            videoTitle.text = fileName
        }
        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
