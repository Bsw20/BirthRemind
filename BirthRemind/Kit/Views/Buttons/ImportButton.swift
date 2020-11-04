//
//  ImportButton.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 03.11.2020.
//

import Foundation
import UIKit

class ImportButton: UIButton {
    
    var iconImageView: UIImageView
    var textLabel: UILabel
    init(resourse: ImportResourse) {
        iconImageView = UIImageView(image: resourse.resourseImage())
        textLabel = UILabel(text: resourse.description(), textColor: resourse.relatedColor())
        super.init(frame: .zero)
        roundBorders(borderColor: resourse.relatedColor(),cornerRadius: 45/2, borderWidth: 1)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        textLabel.backgroundColor = .red
    }
    
    private func setupConstraints() {
        
        addSubview(iconImageView)
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15)
        ])
    }
}


// MARK: - SwiftUI
import SwiftUI

struct ImportButtonProvider: PreviewProvider {
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

