//
//  UILabel + Extension.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 15.10.2020.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont? = UIFont.systemFont(ofSize: 16), textColor: UIColor = .black) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        numberOfLines = 0
    }
}
