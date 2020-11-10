//
//  ContactCell.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 04.11.2020.
//

import Foundation
import UIKit

class ContactCell: UICollectionViewCell {
    static var reuseId = "ContactCell"
    
    let checkBox = CheckBox(image: UIImage(systemName: "checkmark.circle"))
    
    let contactImageView = UIImageView()
    var cakeImageView = UIImageView()
    let dateLabel = UILabel()
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    //MARK: - TODO
//    let inSomeDaysLabel = UILabel()

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init")
        setupUI()
//        setupConstraints()
        
    }
    deinit {
        print("deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var checkBoxButton = UIButton(type: .system)
    
    func friendsConfigure(contact: ContactModel) {
        initializeElements(contact: contact)
        friendsSetupConstraints()
        
    }
    
    func mainConfigure(contact: ContactModel) {
        initializeElements(contact: contact)
        ageLabel.text = contact.age
        ageLabel.font = UIFont.openSansSemibold(fontSize: 17)
        ageLabel.textColor = #colorLiteral(red: 0.6156862745, green: 0.3764705882, blue: 1, alpha: 1)
        mainSetupConstraints()
        
    }
    private func initializeElements(contact: ContactModel) {
        checkBox.configure(with: contact.isSelected)
        contactImageView.image = contact.profileImage
        cakeImageView.image = contact.stringBirthdayDate == "Unspecified" ? UIImage(named: "greyCake") : UIImage(named: "purpleCake")
        dateLabel.text = contact.stringBirthdayDate
        nameLabel.text = contact.fullName
        setupUI()
    }
    
    private func setupUI() {
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        cakeImageView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = UIFont.openSansSemibold(fontSize: 19)
        dateLabel.font = UIFont.openSansRegular(fontSize: 17)
        dateLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        
        checkBox.tintColor = UIColor.mainGray()
        
    }
    
    public func cellTapped(by contact: ContactModel) {
        contact.changeState()
        checkBox.configure(with: contact.isSelected)
//        let state = checkBox.isChecked
//        checkBox.isChecked = !state
    }
}

//MARK:- Constraints
extension ContactCell {
    private func mainSetupConstraints() {
        let screenSize = UIScreen.main.bounds
        addSubview(ageLabel)
        addSubview(contactImageView)
        addSubview(dateLabel)
        addSubview(nameLabel)
        addSubview(cakeImageView)
//        backgroundColor = .yellow
//        contactImageView.backgroundColor = .red
        
        
        let contactImageViewSize = frame.height
        NSLayoutConstraint.activate([
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImageView.widthAnchor.constraint(equalToConstant: contactImageViewSize),
            contactImageView.heightAnchor.constraint(equalToConstant: contactImageViewSize),
            contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
//        nameLabel.backgroundColor = .red
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.1),
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
//            nameLabel.widthAnchor.constraint(equalToConstant: rect.width)
        ])
        
        let sizeCakeImage = frame.height * 0.35
        let bottomInset = -1 * frame.height * 0.1
        NSLayoutConstraint.activate([
            cakeImageView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            cakeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomInset),
            cakeImageView.widthAnchor.constraint(equalToConstant: sizeCakeImage),
            cakeImageView.heightAnchor.constraint(equalToConstant: sizeCakeImage)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: cakeImageView.trailingAnchor, constant: frame.width * 0.03),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomInset)
        ])
        
        NSLayoutConstraint.activate([
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: frame.width * 0.01),
            ageLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        //MARK: - прижать agelabel к nameLabel
    }
    
    private func friendsSetupConstraints() {
        let screenSize = UIScreen.main.bounds
        addSubview(checkBox)
        addSubview(contactImageView)
        addSubview(dateLabel)
        addSubview(nameLabel)
        addSubview(cakeImageView)
//        backgroundColor = .yellow
//        contactImageView.backgroundColor = .red
        
        let checkBoxSize = frame.height / 2.2
        NSLayoutConstraint.activate([
            checkBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkBox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBox.widthAnchor.constraint(equalToConstant: checkBoxSize),
            checkBox.heightAnchor.constraint(equalToConstant: checkBoxSize)
        ])
        
        let contactImageViewSize = frame.height
        NSLayoutConstraint.activate([
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImageView.widthAnchor.constraint(equalToConstant: contactImageViewSize),
            contactImageView.heightAnchor.constraint(equalToConstant: contactImageViewSize),
            contactImageView.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: screenSize.width * 0.01)
        ])
        
//        nameLabel.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.1),
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10)
        ])
        
        let sizeCakeImage = frame.height * 0.35
        let bottomInset = -1 * frame.height * 0.1
        NSLayoutConstraint.activate([
            cakeImageView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            cakeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomInset),
            cakeImageView.widthAnchor.constraint(equalToConstant: sizeCakeImage),
            cakeImageView.heightAnchor.constraint(equalToConstant: sizeCakeImage)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: cakeImageView.trailingAnchor, constant: frame.width * 0.03),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomInset)
        ])
        
    }
    
    
    func setupConstraints() {
        addSubview(checkBox)
        addSubview(contactImageView)
        addSubview(dateLabel)
        addSubview(nameLabel)
        addSubview(cakeImageView)
        addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            checkBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            checkBox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBox.widthAnchor.constraint(equalToConstant: 30),
            checkBox.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImageView.widthAnchor.constraint(equalToConstant: 70),
            contactImageView.heightAnchor.constraint(equalToConstant: 70),
            contactImageView.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 1)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            cakeImageView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            cakeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: cakeImageView.trailingAnchor, constant: 10),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            ageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
        
    }
}

import SwiftUI

struct ContactCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = FriendsPresentationViewController()
        
        func makeUIViewController(context: Context) -> some FriendsPresentationViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

