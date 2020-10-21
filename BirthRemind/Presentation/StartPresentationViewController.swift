//
//  StartPresentationViewController.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 11.10.2020.
//

import Foundation
import UIKit

class StartPresentationViewController: UIViewController {
    let nextButton = UIButton(title: "Next")
    let partyImageView = UIImageView(image: #imageLiteral(resourceName: "Party"))
    let rememberLabel = UILabel(text: "Remember everyone birthday",font: UIFont.systemFont(ofSize: 28), textColor: #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1))
    let descriptionLabel = UILabel(text: "All holidays of your family, friends are in one place!",
                                   font: UIFont.systemFont(ofSize: 17),
                                   textColor: .darkGray())
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeElements()
        setupConstraints()
    }
    
    private func customizeElements() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        partyImageView.translatesAutoresizingMaskIntoConstraints = false
        rememberLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        rememberLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
    }
}

//MARK: Constraints
extension StartPresentationViewController {
    private func setupConstraints() {

        view.addSubview(partyImageView)
        view.addSubview(nextButton)
        view.addSubview(rememberLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.widthAnchor.constraint(equalToConstant: 149)
        ])
        
        NSLayoutConstraint.activate([
            partyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            partyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            partyImageView.heightAnchor.constraint(equalToConstant: 200),
            partyImageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8)
        ])
        
        NSLayoutConstraint.activate([
            rememberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rememberLabel.topAnchor.constraint(equalTo: partyImageView.bottomAnchor, constant: 50)
        ])
    
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: rememberLabel.bottomAnchor, constant: 80),
            descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.6)
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

