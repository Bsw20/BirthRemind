//
//  ImportPresentationViewController.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 02.11.2020.
//

import Foundation
import UIKit

class ImportPresentationViewController: UIViewController {
    let titleLabel = UILabel(text: "All holidays in one moment!",font: UIFont.systemFont(ofSize: 25), textColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
    let descriptionLabel = UILabel(text: "If you have Vkontakte,then just import all your friends", font: UIFont.systemFont(ofSize: 16) )

    
    let contactsButton = ImportButton(resourse: ImportResourse.Contacts)
    let vkButton = ImportButton(resourse: ImportResourse.VK)
    let policyButton = UIButton(type: .system)
    
    
    let nextButton = UIButton(title: "Пропустить")
    var pageControl = CustomPageControl(currentPage: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeElements()
        setupConstraints()
    }
    
    private func customizeElements() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contactsButton.translatesAutoresizingMaskIntoConstraints = false
        vkButton.translatesAutoresizingMaskIntoConstraints = false
        policyButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.textAlignment = .center
        titleLabel.textAlignment = .center
        
        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.mainGray(),
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "Usage policy your personal data",
                                                        attributes: yourAttributes)
        
        policyButton.setAttributedTitle(attributeString, for: .normal)
        policyButton.titleLabel?.numberOfLines = 2
        policyButton.titleLabel?.textAlignment = .center
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        contactsButton.addTarget(self, action: #selector(contactsButtonTapped), for: .touchUpInside)
        vkButton.addTarget(self, action: #selector(vkButtonTapped), for: .touchUpInside)
        policyButton.addTarget(self, action: #selector(policyButtonTapped), for: .touchUpInside)
        
    }
    
}

//handle events
extension ImportPresentationViewController {
    @objc func nextButtonTapped() {
        print(#function)
    }
    
    @objc func contactsButtonTapped() {
        print(#function)
    }
    
    @objc func vkButtonTapped() {
        print(#function)
    }
    
    @objc func policyButtonTapped() {
        print(#function)
    }
}

//MARK: Constraints
extension ImportPresentationViewController {
    private func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(pageControl)
        view.addSubview(descriptionLabel)
        view.addSubview(contactsButton)
        view.addSubview(vkButton)
        view.addSubview(policyButton)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
        

        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            contactsButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            contactsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            contactsButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            vkButton.topAnchor.constraint(equalTo: contactsButton.bottomAnchor, constant: 40),
            vkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            vkButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        
        NSLayoutConstraint.activate([
            policyButton.topAnchor.constraint(equalTo: vkButton.bottomAnchor, constant: 40),
            policyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            policyButton.widthAnchor.constraint(equalTo: vkButton.widthAnchor, multiplier: 0.6)
            
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: 150),
            pageControl.heightAnchor.constraint(equalToConstant: 50)

        ])
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.42)
        ])
        
    }
}



// MARK: - SwiftUI
import SwiftUI

struct ImportPresentationVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ImportPresentationViewController()
        
        func makeUIViewController(context: Context) -> some ImportPresentationViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}


