//
//  ImportButton.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 03.11.2020.
//

import Foundation
import UIKit

class ImportButton: UIButton {
    //MARK - TODO: сделать блик как у системной кнопки
    var iconImageView: UIImageView!
    var textLabel: UILabel!
//    init(resourse: ImportResourse) {
//        iconImageView = UIImageView(image: resourse.resourseImage())
//        iconImageView.tintColor = resourse.relatedColor()
//        textLabel = UILabel(text: resourse.description(),font: UIFont.openSansSemibold(fontSize: 19), textColor: resourse.relatedColor())
//        textLabel.textAlignment = .center
////        textLabel.backgroundColor = .red
//        super.init(frame: .zero)
//        roundBorders(borderColor: resourse.relatedColor(),cornerRadius: 45/2, borderWidth: 1)
//
//        setupUI()
//        setupConstraints()
//    }
    
    public func configure(resourse: ImportResourse) {
        iconImageView = UIImageView(image: resourse.resourseImage())
        iconImageView.tintColor = resourse.relatedColor()
        textLabel = UILabel(text: resourse.description(),font: UIFont.openSansSemibold(fontSize: 19), textColor: resourse.relatedColor())
        textLabel.textAlignment = .center
//        textLabel.backgroundColor = .red
        roundBorders(borderColor: resourse.relatedColor(),cornerRadius: 45/2, borderWidth: 1)
        
        setupUI()
        setupConstraints()
    }
    
    
    private func setupUI() {

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        textLabel.backgroundColor = .red
    }
    
    private func setupConstraints() {
        let screenSize = UIScreen.main.bounds
        addSubview(iconImageView)
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenSize.width * 0.06)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1 * screenSize.width * 0.02)
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

