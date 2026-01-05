//
//  SplashScreen.swift
//  NeuroSpark
//
//  Created by salchug on 12.05.25.
//

import UIKit

class SplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: UIColor(hex: "#1562AE")!, colorTwo: UIColor(hex: "#74ACE4")!)

        let logoImageView = UIImageView(image: UIImage(named: "image.png"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 298),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 257),
            logoImageView.heightAnchor.constraint(equalToConstant: 256)
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.navigateToMain()
        }
        
        
    }
    private func navigateToMain() {
        let mainVC = MainViewController()
        self.navigationController?.setViewControllers([mainVC], animated: true)
    }

}
