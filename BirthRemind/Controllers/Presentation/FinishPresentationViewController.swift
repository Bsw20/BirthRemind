//
//  FinishPresentationViewController.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 05.11.2020.
//

import Foundation
import UIKit

class FinishPresentationViewController : UIViewController {
    let nextButton = UIButton(title: "Start")
    let partyImageView = UIImageView(image: #imageLiteral(resourceName: "Let’s go"))
    let titleLabel = UILabel(text: "Everything is ready to use!",font: UIFont.openSansRegular(fontSize: 28), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    let descriptionLabel = UILabel(text: "We have prepared everything for you! Click start to use the app!",
                                   font: UIFont.openSansRegular(fontSize: 18),
                                   textColor: .darkGray())
    
    var pageControl = CustomPageControl(currentPage: 2)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        Router.instance.navigationViewController.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        modalTransitionStyle = .flipHorizontal
        customizeElements()
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func customizeElements() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        partyImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func nextButtonTapped() {
        print(#function)
        let mainAppViewController = MainAppViewController()
        Router.instance.setupAsBaseScreen(mainAppViewController, animated: true)
    }
}

//MARK: Constraints
extension FinishPresentationViewController {
    private func setupConstraints() {
        let screenSize = UIScreen.main.bounds
        
        view.addSubview(pageControl)
        view.addSubview(partyImageView)
        view.addSubview(nextButton)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)

        

        
        NSLayoutConstraint.activate([
            partyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            partyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenSize.height * 0.1),
            partyImageView.heightAnchor.constraint(equalToConstant: screenSize.height * 0.25),
            partyImageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * screenSize.height * 0.03),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: 150),
            pageControl.heightAnchor.constraint(equalToConstant: 50)

        ])
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.42),
            nextButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -1 * screenSize.height * 0.05)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: partyImageView.bottomAnchor, constant: 0.1 * screenSize.height),
            titleLabel.widthAnchor.constraint(equalTo: partyImageView.widthAnchor, multiplier: 0.9)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: screenSize.height * 0.04),
            descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.55)
        ])
    }
}

//MARK: - SwiftUI
import SwiftUI

struct FinishPresentationVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = FinishPresentationViewController()
        
        func makeUIViewController(context: Context) -> some FinishPresentationViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

