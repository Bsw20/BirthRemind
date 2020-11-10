//
//  StartPresentationViewController.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 11.10.2020.
//

import Foundation
import UIKit
import Then

class StartPresentationViewController: UIViewController {
    let nextButton = UIButton(title: "Next",font: UIFont.openSansSemibold(fontSize: 18))
    let partyImageView = UIImageView(image: #imageLiteral(resourceName: "Party"))
    let rememberLabel = UILabel(text: "Remember everyone birthday",font: UIFont.openSansRegular(fontSize: 27), textColor: #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1))
    let descriptionLabel = UILabel(text: "All holidays of your family, friends are in one place!",
                                   font: UIFont.openSansRegular(fontSize: 18),
                                   textColor: .darkGray())
    
    var pageControl = CustomPageControl(currentPage: 0)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        Router.instance.navigationViewController.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        modalTransitionStyle = .flipHorizontal
        customizeElements()
        setupConstraints()
    }
    
    private func customizeElements() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        partyImageView.translatesAutoresizingMaskIntoConstraints = false
        rememberLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        rememberLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        
    }
    
    @objc func nextButtonTapped() {
        let importVC = ImportPresentationViewController()
        Router.instance.setupAsBaseScreen(importVC, animated: true)
    }
}

//MARK: - Constraints
extension StartPresentationViewController {
    private func setupConstraints() {
        let screenSize = UIScreen.main.bounds
        
        view.addSubview(pageControl)
        view.addSubview(partyImageView)
        view.addSubview(nextButton)
        view.addSubview(rememberLabel)
        view.addSubview(descriptionLabel)

        

        
        NSLayoutConstraint.activate([
            partyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            partyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenSize.height * 0.1),
            partyImageView.heightAnchor.constraint(equalToConstant: screenSize.height * 0.25),
            partyImageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: 150),
            pageControl.heightAnchor.constraint(equalToConstant: 50)

        ])
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.42),
            nextButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            rememberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rememberLabel.topAnchor.constraint(equalTo: partyImageView.bottomAnchor, constant: 0.06 * screenSize.height),
            rememberLabel.widthAnchor.constraint(equalTo: partyImageView.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: rememberLabel.bottomAnchor, constant: screenSize.height * 0.04),
            descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5)
        ])
    }
}


// MARK: - SwiftUI
import SwiftUI

struct StartPresentationVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = StartPresentationViewController()
        
        func makeUIViewController(context: Context) -> some StartPresentationViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

