//
//  UIButton + Extension.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 11.10.2020.
//

import Foundation
import UIKit

extension UIButton {
    //TODO: FixFonts
    convenience init(title: String,
                     titleColor: UIColor = .white,
                     backgroundColor: UIColor = .mainPurple(),
                     font: UIFont? = UIFont(name: "OpenSans-Regular", size: 18),
                     cornerRadius: CGFloat = 23) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        titleLabel?.font = font
        layer.cornerRadius = cornerRadius
        print(font != nil ? "Ok" : "nil")
        
    }
    
    convenience init(hello: String) {
        self.init(type: .system)
    }
    
    func roundBorders(borderColor: UIColor, cornerRadius: CGFloat = 5, borderWidth: Int = 1) {
        backgroundColor = .clear
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 1
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
    
}
