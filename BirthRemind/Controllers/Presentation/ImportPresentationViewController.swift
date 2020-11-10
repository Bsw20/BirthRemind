//
//  ImportPresentationViewController.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 02.11.2020.
//

import Foundation
import UIKit

class ImportPresentationViewController: UIViewController {
    let titleLabel = UILabel(text: "All holidays in one moment!", font: UIFont.openSansRegular(fontSize: 27), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    let descriptionLabel = UILabel(text: "If you have Vkontakte, then just import all your friends", font: UIFont.openSansRegular(fontSize: 18), textColor: #colorLiteral(red: 0.4274509804, green: 0.4274509804, blue: 0.4274509804, alpha: 1) )

    
    let contactsButton = ImportButton(type: .system)
    let vkButton = ImportButton(type: .system)
    let policyButton = UIButton(type: .system)
    
    
    let nextButton = UIButton(title: "Skip", font: UIFont.openSansSemibold(fontSize: 18))
    var pageControl = CustomPageControl(currentPage: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        customizeElements()
        setupConstraints()
    }
    
    private func customizeElements() {
        vkButton.configure(resourse: ImportResourse.VK)
        contactsButton.configure(resourse: ImportResourse.Contacts)
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
        Router.instance.setupAsBaseScreen(FinishPresentationViewController(), animated: true)
    }
    
    @objc func contactsButtonTapped() {
        print(#function)
        Router.instance.show(FriendsPresentationViewController())
    }
    
    @objc func vkButtonTapped() {
        print(#function)
        Router.instance.show(FriendsPresentationViewController())
    }
    
    @objc func policyButtonTapped() {
        print(#function)
    }
}

//MARK: Constraints
extension ImportPresentationViewController {
    private func setupConstraints() {
        let screenSize = UIScreen.main.bounds
        
        view.addSubview(titleLabel)
        view.addSubview(pageControl)
        view.addSubview(descriptionLabel)
        view.addSubview(contactsButton)
        view.addSubview(vkButton)
        view.addSubview(policyButton)
        view.addSubview(nextButton)
        
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
            vkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            vkButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            policyButton.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -1 * screenSize.height * 0.14),
            policyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            policyButton.widthAnchor.constraint(equalTo: vkButton.widthAnchor, multiplier: 0.6)
        ])
        

        NSLayoutConstraint.activate([
            vkButton.bottomAnchor.constraint(equalTo: policyButton.topAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            contactsButton.bottomAnchor.constraint(equalTo: vkButton.topAnchor, constant: -15),
            contactsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            contactsButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        

        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contactsButton.topAnchor, constant: -1 * screenSize.height * 0.09),
            descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -1 * screenSize.height * 0.03),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
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


