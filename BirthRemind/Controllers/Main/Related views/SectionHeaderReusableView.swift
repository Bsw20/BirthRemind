//
//  SectionHeaderReusableView.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 05.11.2020.
//

import Foundation
import UIKit

class SectionHeaderReusableView: UICollectionReusableView {
    static var reuseId: String {
        return "SectionHeaderReusableView"
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.openSansSemibold(fontSize: 14)
        label.textColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .clear
        label.layer.borderColor = UIColor.mainGray().cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius =  UIScreen.main.bounds.height * 0.05 * 0.5
//        label.backgroundColor = .red
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let screenSize = UIScreen.main.bounds
//        backgroundColor = .yellow
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: screenSize.height * 0.05)
            //            titleLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width)
        ])
//        titleLabel.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

