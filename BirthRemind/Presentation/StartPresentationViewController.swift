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
//    let nextButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
}

//MARK: Constraints
extension StartPresentationViewController {
    private func setupConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        partyImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(partyImageView)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.widthAnchor.constraint(equalToConstant: 149)
        ])
        
        NSLayoutConstraint.activate([
            partyImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            partyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            partyImageView.heightAnchor.constraint(equalToConstant: 45),
            partyImageView.widthAnchor.constraint(equalToConstant: 149)
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

