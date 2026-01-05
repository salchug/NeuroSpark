//
//  LowRiskAnalyzeViewController.swift
//  NeuroSpark
//
//  Created by salchug on 29.05.25.
//

import UIKit

class LowRiskAnalyzeViewController: UIViewController {
    
    private let lowriskpng = UIImageView()
    private let riskTitle = UILabel()
    private let descripText = UILabel()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Video analysis"
        view.backgroundColor = UIColor(hex: "#F3E8FF")
        setupUI()
        
    }
    
    private func setupUI() {
        setupNavigation()
        setupScrollView()
        configureLowRiskImg()
        configureRiskTitle()
        configureDescrip()
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
    
    private func configureLowRiskImg() {
        lowriskpng.image = UIImage(named: "risklowimg")
        lowriskpng.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lowriskpng)
        NSLayoutConstraint.activate([
            lowriskpng.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            lowriskpng.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lowriskpng.widthAnchor.constraint(equalToConstant: 270),
            lowriskpng.heightAnchor.constraint(equalToConstant: 153)
        ])
    }
    
    private func configureRiskTitle() {
        riskTitle.text = "The risk of autism is low based on the video \nyou uploaded."
        riskTitle.textColor = UIColor(hex: "#292929")
        riskTitle.numberOfLines = 2
        riskTitle.textAlignment = .center
        riskTitle.font = UIFont.boldSystemFont(ofSize: 15)
        riskTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(riskTitle)
        NSLayoutConstraint.activate([
            riskTitle.topAnchor.constraint(equalTo: lowriskpng.bottomAnchor, constant: 12),
            riskTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

    }
    
    private func configureDescrip() {
        descripText.text =
        """
        Your child has been assessed as having a low risk of autism. This suggests that no concerning signs have been observed in their development. However, it is still important to actively support and monitor your child's growth. Our advice: Engage in daily conversations and playtime with your child to support social and language skills. Read age-appropriate books together, describe the pictures, and ask simple questions. If you notice any unusual changes in behavior or development in the future, don’t hesitate to consult a specialist. Remember, every child develops at their own pace — variations are normal. This result provides an initial insight, but it should not replace professional medical advice or evaluation.Your child has been assessed as having a low risk of autism. This suggests that no concerning signs have been observed in their development. However, it is still important to actively support and monitor your child's growth. Our advice: Engage in daily conversations and playtime with your child to support social and language skills. Read age-appropriate books together, describe the pictures, and ask simple questions. If you notice any unusual changes in behavior or development in the future, don’t hesitate to consult a specialist. Remember, every child develops at their own pace — variations are normal. This result provides an initial insight, but it should not replace professional medical advice or evaluation.Your child has been assessed as having a low risk of autism. This suggests that no concerning signs have been observed in their development. However, it is still important to actively support and monitor your child's growth. Our advice: Engage in daily conversations and playtime with your child to support social and language skills. Read age-appropriate books together, describe the pictures, and ask simple questions. If you notice any unusual changes in behavior or development in the future, don’t hesitate to consult a specialist. Remember, every child develops at their own pace — variations are normal. This result provides an initial insight, but it should not replace professional medical advice or evaluation.

        """
        
        descripText.font = UIFont.systemFont(ofSize: 15)
        descripText.numberOfLines = 0
        descripText.textColor = UIColor(hex: "#292929")
        descripText.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(descripText)
        NSLayoutConstraint.activate([
            descripText.topAnchor.constraint(equalTo: riskTitle.bottomAnchor, constant: 19),
            descripText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descripText.widthAnchor.constraint(equalToConstant: 345),
            descripText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
        ])

    }
    

}
